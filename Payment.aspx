<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="EasyBook.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body align="center" style="background-image:url('seats.jpg');background-position: center;
    <form id="form1" runat="server" align="center">
        <div align="center">
            <h1>Seats selected are :<span id="seatsselected">0</span></h1>
             <h1>Total Amount :<span id="total">0</span></h1>
            <input type="button" onclick="payment()" style="width: 200px" value="Pay"/>
            <p id="thanks"></p>

            <div id="imageid" style="visibility:hidden">
                <img  id="image1" src="../assete/Images/qr-code.png"/>
                </div>
            
        </div>
        
    </form>
     <script rel="javascript" type="text/javascript" src="../Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        document.getElementById("seatsselected").innerHTML = localStorage.getItem("SelectedSeat");
        var seats = localStorage.getItem("SelectedSeat").trim();
        var seat1 = seats.split(" ");
        var total = 0;
        var total = parseInt(localStorage.getItem("totalAmount")) + (seat1.length * 45) //tax 45 per each ticket
        document.getElementById("total").innerHTML = total;
        localStorage.setItem("TotalAmount",total);
        function payment() {
            var seat2 = seat1.join(",")+"";
            
            var JSONObj = {
        showid:"1",
        seatId: seat2,
        isPaid: "1"
    }
    $.ajax({
        type: "POST",
        url: "PayAmount.aspx/UpdateSeatStatus",
        data: JSON.stringify(JSONObj),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: onSuccess,
        failure: function (AjaxResponse) {
            document.getElementById("thanks").innerHTML = "Sorry Something went wrong."
            
        }
    });
    function onSuccess(AjaxResponse) {
        document.getElementById("thanks").innerHTML = "Thank you Payment Successdull."
        $("#imageid").show("fast");
    }
        }
    </script>
</body>
</html>
