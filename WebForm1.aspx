<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EasyBook.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Seat Booking</title>
    <link rel="stylesheet" href="../CSSS/SeatSelection.css">
   
</head>
<body >

    <form id="form1" runat="server">
  

    <ul class="showcase">
        <li>
            <div class="seat"></div>
            <small>N/A</small>
        </li>
        <li>
            <div class="seat selected"></div>
            <small>Selected</small>
        </li>
        <li>
            <div class="seat occupied"></div>
            <small>Occupied</small>
        </li>
        <li>
            <div class="seat pending"></div>
            <small>Pending</small>
        </li>
    </ul>

    <div class="container">
        <div class="movie-screen">
            <img class=" col-sm-5 " src="../assete/Images/screen.jpg" alt='screen' />
        </div>

        <div class="row-container">
            <div class="row">
                <div class="seat" id="11" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="12" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="13" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="14" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="15" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="16" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="17" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="18" onclick="SelectedSeats(id)"></div>
            </div>
            <div class="row">
                <div class="seat" id="21" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="22" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="23" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="24" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="25" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="26" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="27" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="28" onclick="SelectedSeats(id)"></div>
            </div>
            <div class="row">
                <div class="seat" id="31" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="32" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="33" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="34" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="35" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="36" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="37" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="38" onclick="SelectedSeats(id)"></div>
            </div>
            <div class="row">
                <div class="seat" id ="41" onclick="SelectedSeats(id)"></div>
                <div class="seat" id ="42" onclick="SelectedSeats(id)"></div>
                <div class="seat" id ="43" onclick="SelectedSeats(id)"></div>
                <div class="seat" id ="44" onclick="SelectedSeats(id)"></div>
                <div class="seat" id ="45" onclick="SelectedSeats(id)"></div>
                <div class="seat" id ="46" onclick="SelectedSeats(id)"></div>
                <div class="seat" id ="47" onclick="SelectedSeats(id)"></div>
                <div class="seat" id ="48" onclick="SelectedSeats(id)"></div>
            </div>
            <div class="row">
                <div class="seat" id="51" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="52" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="53" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="54" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="55" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="56" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="57" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="58" onclick="SelectedSeats(id)"></div>
            </div>
            <h5 class='subtitle'>GOLD -  <span id='gold'>0</span></h5>
            <div class="row">
                <div  class="seat" id="61" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="62" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="63" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="64" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="65" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="66" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="67" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="68" onclick="SelectedSeats(id)"></div>
            </div>
            <div class="row">
                <div class="seat"  id="71" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="72" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="73" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="74" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="75" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="76" onclick="SelectedSeats(id)"></div>
                <div class="seat " id="77" onclick="SelectedSeats(id)"></div>
                <div class="seat" id="78"  onclick="SelectedSeats(id)"></div>
            </div>
            <h5 class='subtitle'>DIAMOND -  <span id='diamond'>0</span></h5>

            <div class="text-wrapper">
                <p class="text">Selected Seats <span id='count'>0</span>
                    <p class="text">Total Price ₹<span id="total">0</span></p>
            </div>
        </div>
        <div class="row-container">
            <div  onclick="setFinalData()"><asp:Button ID="payment" runat="server" Text="Go To Payment" OnClick="payment_Click" /></div>
        </div>
             </div>
        <script rel="javascript" type="text/javascript" src="Scripts/jquery-3.6.0.min.js"></script>
        <script rel="javascript" type="text/javascript" src="Scripts/WebForms/MSAjax/MicrosoftAjax.js"></script>
    <script rel="javascript" src="jsscript/SeatSelection.js"></script>
    </form>
</body>
</html>c    