<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Assignment.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
        <br />
        <br />
    <div class="topRowImage"></div>

    <marquee behavior="scroll" direction="left" scrollamount="10">
        <img src="/Images/ShakingDance.gif" width="125" height="125" alt="Dancing">
    </marquee>
        <div style="display:flex;flex-direction:column;align-items:center;justify-content:center">
            <div class="tittleFavourite">
                <h1>Your Cart &#10024;</h1>
            </div>

            <div style="width:100%;height:50px;border-top:2px solid white;"></div>

            

            <div>
                <asp:DataList ID="gvImage" runat="server"  OnItemCommand="Item_Command">
                    <ItemTemplate>
                        <div style="display:inline-block">
                        <asp:ImageButton ID="btnImage" runat="server" CssClass="artPieceImage" OnClick="btnImage_Click" height="150px" width="267px"
                            src= '<%# String.Format("data:image/jpeg;base64,{0}", Convert.ToBase64String((byte[])Eval("ArtData")) ) %>' />
                        </div>
                        <div style="display:inline-block;margin-left:20px;">
                        <span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color:#949398;">BY: </span>
                        <asp:Label ID="Label1" CssClass="lblData" runat="server" Text='<%# Eval("UserName") %>'></asp:Label> <br /> 
                        <span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color:#949398;">Art Name: </span>
                        <asp:Label ID="Label2" CssClass="lblData" runat="server" Text='<%# Eval("ArtName") %>'></asp:Label> <br />   
                        <span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color:#949398;">Price: </span>
                        <asp:Label ID="Label3" CssClass="lblData" runat="server" Text='<%# Eval("ArtPrice") %>'></asp:Label> <br />
                        <span style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color:#949398;">Add at: </span>
                        <asp:Label ID="Label4" CssClass="lblData" runat="server" Text='<%# Eval("CartTime") %>'></asp:Label> 
                        </div>
                        <br /> <br /> <br />  
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
</asp:Content>
