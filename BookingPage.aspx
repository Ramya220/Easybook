<%@ Page MasterPageFile="~/SideNav.master" Language="C#" AutoEventWireup="true" CodeBehind="BookingPage.aspx.cs" Inherits="EasyBook.BookingPage" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href='https://fonts.googleapis.com/css?family=Alike' rel='stylesheet'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> 
      
      <script  type="text/javascript" src="../Scripts/jquery-3.6.0.min.js"></script>
    <%--<script rel="javascript" src="../jsscript/BookingPage.js"></script>--%>
    
       <style type="text/css">
.mytdclass {
  color: white;
  line-height:50px;
  padding:3px 40px 6px
 
}

 .productList {  
            border: 1px solid #6c757d;  
            margin-bottom: 10px;  
            padding: 15px;  
            border-radius: 3px;  
        }  
</style>
   
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
     <div>
    <table>
        <tr>
            <td class="mytdclass">Choose location:</td>
           <td><asp:DropDownList runat="server" ID="ddlcountry"  AutoPostBack="true" OnSelectedIndexChanged="changingselectedindex">
               
               </asp:DropDownList>
            
             
 
            </td> 
        </tr>
        </table>
         <table>
        <tr>
            <td>
        <div>
            <asp:DataList ID="datalist1" runat="server" RepeatColumns="3" RepeatDirection="horizontal" >
                    <ItemTemplate>  
                        
                        <div class="row productList">  
                        <div class="col-4"> 

                            <asp:ImageButton ID="ImageButton1"  width="250"  runat="server"  AutoPostBack="true" CommandArgument='<%# Eval("showid") %>' 
                 ImageUrl='<%# Eval("mphoto") %>' onclick="DataList_ItemCommand" />
                                    <%--<img alt="" width="250" src=' <%#Eval("mphoto") %>'  />--%>
                            <asp:HiddenField ID="hfield" runat="server" Value='<%# Eval("showid")%>'  />
                            </div>
                            </div>
                               

                    </ItemTemplate>
   </asp:DataList>
            </div>
                </td>
            </tr>
     </table>
     </div>

   </asp:Content>

