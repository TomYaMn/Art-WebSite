<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="ArtPiece.aspx.cs" Inherits="Assignment.ArtPiece" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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



        .alertBox
        {
            position: absolute;
            top: 100px;
            left: 50%;
            width: 500px;
            margin-left: -250px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            padding: 4px 8px;
        }


        .description{
            display:flex;
            flex-direction:column;
            align-items:center;

            text-align:left;
            color:white;
        }



    </style>
    <script type="text/javascript">
    function closeAlert(e)
    {
        e.preventDefault();
        this.parentNode.style.display = "none";
    }
    </script>

    <p><br /><br /><br /><br />
        
    </p>

    <div class="contentContainer">    
        <div class="picture">
            <asp:Label ID="lblImageName" runat="server" CssClass="imageName"></asp:Label>
            <br />
            <br />
            <asp:DataList ID="gvImages" runat="server" RepeatColumns="1" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <Image ID="Image1" runat="server" src='<%# String.Format("data:image/jpeg;base64,{0}", Convert.ToBase64String((byte[])Eval("Image")) ) %>' height="600px" width="1066px" />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Image] FROM [UserGalleryPost]"></asp:SqlDataSource>    
        </div>
        <div class="info">
            <br />
            <br />
            <br />
            <div>
                By: <asp:Label ID="lblUserName" runat="server" CssClass="imageDescription"></asp:Label>
                  (<asp:Label ID="lblRole" runat="server" CssClass="imageDescription"></asp:Label>)
                <br />
                Email: <asp:Label ID="lblEmail" runat="server" CssClass="imageDescription"></asp:Label>
                <br />
                Last Login By: <asp:Label ID="lblLastLoginDate" runat="server" CssClass="imageDescription"></asp:Label>
            </div>
            
            
        </div>
    </div>
    <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="likeImageBox">
        <asp:ImageButton ID="ButtonLIke" runat="server" CssClass="unlike" ImageUrl="~/Images/thumbUp.png" OnClick="ButtonLIke_Click"/>
        &nbsp;&nbsp;&nbsp;
    </div>
    <div class="likeCount">
        &nbsp;
        <asp:Label ID="lblLikeCount" runat="server" ForeColor="#c9a838" Font-Size="Large"></asp:Label>
        &nbsp;
        <span style="color:#00b1d2">Favourite</span>
    </div>

<%--    <div runat="server" id="AlertBox" class="alertBox" Visible="false">
        <div runat="server" id="AlertBoxMessage"></div>
        <button onclick="closeAlert.call(this, event)">Ok</button>
    #c9a838
    </div>
    This is the discard feature on the message box--%>

    

    <div class="description">
        <div>
            <br /><br /><br /><br /><br /><br />
        </div>        
        <div style="line-height:0.95">
            &#124;<br />
            &#124;<br />
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </div>
        <asp:Label ID="lblImageDescription" runat="server" CssClass="imageDescription"></asp:Label>
        <div>
            <br /><br /><br /><br /><br /><br />
        </div>        
        <div style="line-height:0.95">
            &#124;<br />
            &#124;<br />
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </div>
    </div>

</asp:Content>
