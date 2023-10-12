<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Assignment.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <style>
        div.imgBox{
            color:white;
            margin:0px;
            padding:40px 40px;
            border-top:2px solid white;
            border-bottom:thin solid white;

            text-align:center;
        }

        div.topRow{
            left:0px;
        }
        .hidden{
            display:none;
            max-width:267px;
        }
        .artPieceImage:hover{
            filter: brightness(50%);
            transform: scale(1.3);
            transition-duration:0.3s;
            z-index:100;
        }
            .auto-style3 {
                top: 13px;
                left: 2%;
                margin-left: 227px;
            }
            .auto-style4 {
                margin-left: 699px;
            }
    </style>

    <div class="topRow" style="background-image:url('/Images/TopRowImage.jpg');width:100%;">
        <br />
        <br />
        <br />
        <asp:Button ID="btnUpgrade" runat="server" Text="Upgrade To Premium Now" OnClick="Upload"  BackColor="#666666" BorderColor="#FFCC00" BorderStyle="Outset" CssClass="auto-style3"  Font-Italic="True" Font-Size="medium" ForeColor="#FFFFCC" Width="269px" />
        <asp:Button ID="btnUpload" runat="server" Text="Post Art for sale!!!" OnClick="Upload" PostBackUrl="~/Sell.aspx" BackColor="#666666" BorderColor="#FFCC00" BorderStyle="Outset" CssClass="auto-style4"  Font-Italic="True" Font-Size="medium" ForeColor="#FFFFCC" Height="47px" Width="318px" />
        <br />
        <br />
        <br />
    </div>

    <div class="imgBox">
        <br />
        <br />
        <div style="border-bottom:thin solid grey;">
            <h2 style="font-family:'Gill Sans';font-size:xx-large;font-weight:300">Shop</h2>
        </div>
        <br />
        <asp:DataList ID="gvImages" runat="server" RepeatColumns = "4" CellPadding = "20" RepeatDirection="Horizontal" OnItemCommand="Item_Command" OnSelectedIndexChanged="gvImages_SelectedIndexChanged">
            <ItemTemplate>
                <asp:Label ID="lblArtId" CssClass="hidden" runat="server" Text='<%# Eval("ArtId") %>'></asp:Label>        
                <asp:ImageButton ID="btnImage" runat="server" CssClass="artPieceImage" OnClick="btnImage_Click" height="150px" width="267px"
                    src= '<%# String.Format("data:image/jpeg;base64,{0}", Convert.ToBase64String((byte[])Eval("ArtData")) ) %>' /><br />
                Art Name : <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("ArtName") %>'></asp:HyperLink><br />

                Art Price : RM <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# Eval("ArtPrice") %>'></asp:HyperLink><br />

            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ArtData] FROM [tblFiles]"></asp:SqlDataSource>
    </div>
</asp:Content>
