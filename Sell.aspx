<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="Sell.aspx.cs" Inherits="Assignment.Sell" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        .auto-style1 {
            margin-left: 83px;
        }
        .auto-style2 {
            margin-left: 0px;
        }
        .imageName{
            Color:ghostwhite; 
            font-family:Gill Sans; 
            font-size:x-large; 
            font-weight:100;
        }
        .imageDescription{
            Color:ghostwhite; 
            font-family:Gill Sans; 
            font-size:large; 
            font-weight:100;


            width:1000px;
        }
        
        .contentContainer{
            display:flex;
            flex-direction:row;
            justify-content:space-around;
        }
        .picture{
            text-align:center;
            border-right:thin solid #c9a838;
            border-bottom:thin solid #c9a838;
            padding:0px 30px 30px 0px;
        }
        .info{
            color:white;
            text-align:center;
            background-color: #131313;

            margin:200px 0px 0px 0px;
            width:300px;
        }


        .like{

            
            filter:sepia(100%);
            width: 44px;
            height: 38px;
        }
        .unlike{
            opacity:0.8;
            filter:brightness(50%);
            width: 44px;
            height: 38px;
        }
        .likeImageBox{
            display:inline-block;
        }
        .likeImageBox:hover{
            background-color:#131313;
        }
        .likeCount{
            display:inline-block;
            color:white;
            font-family:Gill Sans; 
            border-bottom:thin solid #00b1d2;
        }
        <style>

        .topRowImage{
            background-image:url(/Images/TopRowImage2.jpg);
            height:350px;
            width:100%;
            position: absolute; 
            left: 0px;
            top: 0px;
            z-index:-1;
            background-repeat: no-repeat;
        }
        .tittleFavourite h1{
            font-family: 'Gill Sans';
            color: #dfdee0;
            padding:20px 60px;
            border-style: double;
            border-radius: 20px;
            background:rgba(12, 12, 12, 0.6);

        }
        .lblData{
            color:white;
            
        }
        .hidden{
            display:none;
        }

    
        </style>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
        <br />
        <br />
    <div class="topRowImage"></div>

    <marquee behavior="scroll" direction="left" scrollamount="10">
        <img src="/Images/ShakingDance.gif" width="125" height="125" alt="Dancing">
    </marquee>
        <div style="display:flex;flex-direction:column;align-items:center;justify-content:center">
            <div class="tittleFavourite">
                <h1>Upload Your Art &#10024;</h1>
            </div>
            <div style="width:100%;height:50px;border-top:2px solid white;"></div>
     <table>
           <tr>
               <td align="right" class="auto-style1">
                   &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" BorderColor="Black" ForeColor="Black" Width="247px" /><br />
               </td>
           </tr>
    </table>
    
    <table>
                                <tr>
                                    <td align="right" style="color:#CCCCCC;" class="auto-style1">
                                        <asp:Label ID="ArtNameLabel" runat="server" AssociatedControlID="ArtName">Art Name:</asp:Label>
                                    </td>
                                    <td class="auto-style1">
                                        
                                        <asp:TextBox ID="ArtName" runat="server" Height="20px" Width="140px"></asp:TextBox>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="color:#CCCCCC;" class="auto-style1">
                                        <asp:Label ID="PriceLabel" runat="server" AssociatedControlID="Price">Price:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="price" runat="server" Height="20px" Width="140px"></asp:TextBox>
                                        
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                <asp:Button ID="UplaodButton" runat="server" Text="Upload" OnClick="Upload" Height="24px" Width="99px" CssClass="auto-style2" />  
                            </td>
                                        </tr>
                                    </table>
</asp:Content>
