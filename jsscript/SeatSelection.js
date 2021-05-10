const seats = document.querySelectorAll(".row .seat:not(.occupied)");
const seatContainer = document.querySelector(".row-container");
const count = document.getElementById("count");
const total = document.getElementById("total");
const movieSelect = document.getElementById("movie");

// Another Approach

// seats.forEach(function(seat) {
//   seat.addEventListener("click", function(e) {
//     seat.classList.add("selected");
//     const selectedSeats = document.querySelectorAll(".container .selected");
//     selectedSeathLength = selectedSeats.length;
//     count.textContent = selectedSeathLength;
//     let ticketPrice = +movieSelect.value;
//     total.textContent = ticketPrice * selectedSeathLength;
//   });
// });

// localStorage.clear();

function SelectedSeats(id) {
    $("#" + id).addClass("selected");
        var val = parseInt(document.getElementById("count").innerHTML);
        document.getElementById("count").innerHTML= val+1+""
    if (parseInt(id) <= 58) {
        var val1 = parseInt(document.getElementById("total").innerHTML);
        document.getElementById("total").innerHTML = val1 + parseInt(document.getElementById("gold").innerHTML) + ""
    }
    else {
        var val1 = parseInt(document.getElementById("total").innerHTML);
        document.getElementById("total").innerHTML = val1 + parseInt(document.getElementById("diamond").innerHTML) + ""
    }
    var lst = localStorage.getItem("SelectedSeat");
    localStorage.setItem("SelectedSeat", lst + " " + id);
    
    var JSONObj = {
        showid:"1",
        seatId: id,
        isPaid: null
    }
    console.log(id);
    $.ajax({
        type: "POST",
        url: "WebForm1.aspx/UpdateSeatStatus",
        data: JSON.stringify(JSONObj),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: onSuccess,
        failure: function (AjaxResponse) {
            alert("Failed");
        }
    });
    function onSuccess(AjaxResponse) {
        //alert(AjaxResponse.d);
    }

}



populateUI();
let ticketPrice = 100;//+movieSelect.value;

// Save selected movie index and price
function setMovieData() {
    localStorage.setItem("selectedMovieIndex", "1");
    localStorage.setItem("selectedMoviePrice","100");
}

function updateSelectedCount() {
    const selectedSeats = document.querySelectorAll(".container .selected");

    seatsIndex = [...selectedSeats].map(function (seat) {
        return [...seats].indexOf(seat);
    });

    localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));

    let selectedSeatsCount = selectedSeats.length;
    count.textContent = selectedSeatsCount;
    total.textContent = selectedSeatsCount * ticketPrice;
}

function setFinalData() {
    localStorage.setItem("totalAmount", document.getElementById("total").innerHTML);
}
// Get data from localstorage and populate
function populateUI()
{
    localStorage.setItem("SelectedSeat", " ");
    document.getElementById("count").innerHTML = "0";
    $.ajax({
        type: "POST",
        url: 'WebForm1.aspx/getShowDetails',
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (data) {
            var objdata = $.parseJSON(data.d);
            
            document.getElementById("gold").innerHTML = objdata["Table1"][0][1] + "";
            localStorage.setItem("goldprice", objdata["Table1"][0][1]);
            document.getElementById("diamond").innerHTML = objdata["Table1"][0][2] + "";
            localStorage.setItem("diamondprice", objdata["Table1"][0][2]);
        }
        
    });


    $.ajax({
        type: "POST",
        url: 'WebForm1.aspx/loadAllSeats',
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: 'json',
        success: function (data) {
            var objdata = $.parseJSON(data.d);
            var today = new Date();   
            for (var i = 0; i < 56; i++) {
                var obj1 = objdata["Table1"][i];
                var str1 = obj1[1]
                var str2 = str1.substring(6, str1.indexOf(")/"));
                var num1 = parseInt(str2)
                var num2 = Date.parse(today)
                
                if (obj1[3] == "0" && obj1[4] == "0") {
                    $("#"+obj1[2]).removeClass("occupied");
                    $("#"+obj1[2]).removeClass("pending");
                }
                if (num2 - num1 < 50000)
                    $("#" + obj1[2]).addClass("pending");

                if (obj1[3] == "1") {
                    $("#" + obj1[2]).addClass("occupied");
                }
                    
            }
           // alert(num2 - num1)
            // now iterate through this object's contents and load your gridview
        }
    });

    const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));

    if (selectedSeats !== null && selectedSeats.length > 0) {
        seats.forEach(function (seat, index) {
            if (selectedSeats.indexOf(index) > -1) {
                seat.classList.add("selected");
            }
        });
    }

    const selectedMovieIndex = localStorage.getItem("selectedMovieIndex");

    if (selectedMovieIndex !== null) {
        movieSelect.selectedIndex = selectedMovieIndex;

    }
}

// Movie select event

movieSelect.addEventListener("change", function (e) {
    ticketPrice = +movieSelect.value;
    setMovieData(e.target.selectedIndex, e.target.value);
    updateSelectedCount();
});

// Adding selected class to only non-occupied seats on 'click'

seatContainer.addEventListener("click", function (e) {
    if (
        e.target.classList.contains("seat") &&
        !e.target.classList.contains("occupied") &&
        !e.target.classList.contains("pending")
    ) {
        e.target.classList.toggle("selected");
        updateSelectedCount();
    }
});

// Initial count and total rendering
updateSelectedCount();