<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="PrimeTutorial1.aspx.cs" Inherits="Assignment.PrimeTutorial1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
        .container{
            display:flex;
            flex-direction:column;
            align-items:center;

        }

        .primeTitle{
            color:#c9c9c9;
            width:40%;
        }
        .primeTitle h1{
            font-size:45px;  
            color:#e0e0e0;
        }
        .primeTitle p{
            font-size:140%;
            font-family:Calibri;
            font-weight:lighter;
        }

        .primeContent{
            color:#c9c9c9;
            width:40%;
        }
        .primeContent h1{
            font-family:Calibri;
            font-weight:lighter;
        }
        .primeContent p{
            font-size:140%;
            font-family:Calibri;
            font-weight:lighter;
        }
        .primeContent li{
            font-size:140%;
            font-family:Calibri;
            font-weight:lighter;
        }
        .imageDiv{
            display:inline-flex;
            height:617px;
            width:800px;
        }
</style>


    <br /><br /><br /><br /><br />
    <div class="container">
    <div class="primeTitle">
        <h1>Tutorial 1: Stylized outline tutorial!</h1>
        <h3>by <span style="color: #00b1d2">Olga Skaskevich</span></h3>
        <br />
        <br />
        <p>
            Hey! <br />
            Some people asked about the method I used for my outlines, so I decided to make a very small tutorial!<br />
            It's extremely basic, but I'll be glad if someone finds this helpful<br />
        </p>
        <br />


    </div>

    <div class="primeContent">
        <div class="imageDiv">
            <image src="/PrimePageImages/CASINO_TUT.jpg" alt="Mel1" class="imageDiv"></image>
        </div>
        <p>
            Here's how to achieve varying thickness :^D<br />
            Move, check different angles, rinse and repeat
        </p>
        <br />
        <image src="/PrimePageImages/Casino_TUT.gif" alt="Mel1" class="imageDiv" width="500px"></image>
    </div>
    </div>
</asp:Content>
