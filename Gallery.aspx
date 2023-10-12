<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Assignment.Gallery" %>
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
        .auto-style1 {
            margin-left: 878px;
        }
        .auto-style2 {
            margin-left: 88px;
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
    </style>






    <div class="topRow" style="background-image:url('/Images/TopRowImage.jpg');width:100%;">
        <br />
        <br />
        <br />
        <asp:Button ID="btnUpgrade" runat="server" Text="Upgrade To Premium Now" OnClick="Upload"  BackColor="#666666" BorderColor="#FFCC00" BorderStyle="Outset" CssClass="auto-style2"  Font-Italic="True" Font-Size="medium" ForeColor="#FFFFCC" />
        <asp:Button ID="btnUpload" runat="server" Text="Publish Your Own Artwork!!!" OnClick="Upload" PostBackUrl="~/GalleryUpload.aspx" BackColor="#666666" BorderColor="#FFCC00" BorderStyle="Outset" CssClass="auto-style1"  Font-Italic="True" Font-Size="medium" ForeColor="#FFFFCC" />
        <br />
        <br />
        <br />


    </div>


    <div class="imgBox">
        <%--    <asp:GridView ID="gvImages" runat="server">
        <Columns>
                <asp:TemplateField HeaderText="Art Gallery">
            <ItemTemplate>

                <Image id="image" src="<%# String.Format("data:image/jpeg;base64,{0}", Convert.ToBase64String((byte[])Eval("Image")) ) %>" height="400px" width="600px" />
            </ItemTemplate>

        </asp:TemplateField>--%>
        <%--    <asp:BoundField DataField="ImageName" HeaderText="Name" />
        <asp:BoundField DataField="ImageDescription" HeaderText="Description" />
        <asp:BoundField DataField="GalleryPostId" HeaderText="Image Id" />--%>
        <%--            </Columns>
    </asp:GridView>--%>
        <br />
        <br />
        <div style="border-bottom:thin solid grey;">
            <h2 style="font-family:'Gill Sans';font-size:xx-large;font-weight:300">Gallery</h2>
        </div>
        <br />
        <asp:DataList ID="gvImages" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" OnItemCommand="Item_Command">
            <ItemTemplate>
                <asp:Label ID="lblGalleryPostId" CssClass="hidden" runat="server" Text='<%# Eval("GalleryPostId") %>'></asp:Label>            

                
                <asp:ImageButton ID="btnImage" runat="server" CssClass="artPieceImage" OnClick="btnImage_Click" height="150px" width="267px"
                    src= '<%# String.Format("data:image/jpeg;base64,{0}", Convert.ToBase64String((byte[])Eval("Image")) ) %>' />
               <%--this.style='background-color:#94948a;background-blend-mode:multiply;height:150px;width:267px;--%>
               <%-- <Image id="image" src="<%# String.Format("data:image/jpeg;base64,{0}", Convert.ToBase64String((byte[])Eval("Image")) ) %>" height="150px" width="267px" usemap="#artPiece"/>
                <map name="artPiece">
                  <area shape="rect" coords="0,0,267,150" alt="Gallery art" href="ArtPiece.aspx">
                </map>--%>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Image] FROM [UserGalleryPost]"></asp:SqlDataSource>
    </div>

</asp:Content>
