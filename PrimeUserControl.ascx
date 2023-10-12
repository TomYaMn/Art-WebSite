<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrimeUserControl.ascx.cs" Inherits="Assignment.PrimeUserControl" %>


    <style>
        .BlinkBlinkContainer{
            position:absolute;
            width:100%;
            height:100%;
        }
        .BlinkBlink{
            display:block;
            position:sticky;
            top:200px;
            float:right;
            margin-right:80px;
            z-index:1;
        }



        .PageTitleContainer{
            display:flex;
            flex-direction:row;
            justify-content:space-evenly;
            align-items:center;
            text-align:center;
        }
        .PageTitle{
            color:white;
            width:200px;
            height:60px;
            border:solid white 2px;

            position: relative;
            display: inline-block;
        }
        .PageTitleBtn{
            background-color: #1c1b1d;
            color: white;

            height:100%;
            width:100%;
            font-size: 16px;
            border: none;
        }
        .PageTitleLink{
            display: none;
            position: absolute;
            background-color: #1c1b1d;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;   
        }
        .PageTitleLink a{
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .PageTitleLink a:hover{background-color: #ddd;color:#878787;}

        .PageTitle:hover .PageTitleLink{display:block;}

        .PageTitle:hover .PageTitleBtn {background-color: #00b1d2;}




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



    <br /><br /><br /><br />
    
    <div class="BlinkBlinkContainer">
        <div class="BlinkBlink">
            <img src="/Images/StarBlinkBlink.gif" width="160" height="160" alt="Dancing">
        </div>
    </div>

    <div class="PageTitleContainer">
        <div class="PageTitle">
            <button class="PageTitleBtn">Beginner</button>
            <div class="PageTitleLink">
                <a href="PrimeTutorial1.aspx">Tutorial 1</a>
                <a href="PrimeTutorial2.aspx">Tutorial 2</a>
                <a href="PrimeTutorial3.aspx">Tutorial 3</a>
            </div>
        </div>
        <div class="PageTitle">
            <button class="PageTitleBtn">Intermediate</button>
            <div class="PageTitleLink">
                <a href="PrimeTutorial1.aspx">Tutorial 1</a>
                <a href="PrimeTutorial2.aspx">Tutorial 2</a>
                <a href="PrimeTutorial3.aspx">Tutorial 3</a>
            </div>
        </div>
        <div class="PageTitle">
            <button class="PageTitleBtn">Advanced</button>
            <div class="PageTitleLink">
                <a href="PrimeTutorial1.aspx">Tutorial 1</a>
                <a href="PrimeTutorial2.aspx">Tutorial 2</a>
                <a href="PrimeTutorial3.aspx">Tutorial 3</a>
            </div>
        </div>
    </div><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />



<div class="container">
    <div class="primeTitle">
        <h1>Welcome to The Family!</h1>

        <br />
        <br />
        <p>We trully appreciate your support toward our team, your kind support will definitely fund our team to keep on producing and refining our web.
            With bottom of our heart, we will promise to delicated our best to delviery the best experience you can find on out web!!<br /><br />
            Also, feel fre to join our discord server at <a style="color:#00b1d2;text-decoration:none;" href="https://discord.com/invite/t4nqmvxvea">https://discord.com/invite/t4nqmvxvea </a>

        </p>
        <br />
    </div>

    <div class="primeContent">
        <h1>Background</h1>
        <p>
            For about 500 years, illustration was the main way people exhibited fashion. This art form nearly came to an end in the 1930s when photography 
            abruptly replaced illustrations. Thankfully with the rise of social media there has been a recent resurgence. Today fashion illustrators are 
            being sought after to collaborate with fashion brands, magazines, and marketing campaigns.
        </p>
        <br />
    </div>
    <div class="primeContent">
<iframe src="https://www.youtube.com/embed/SJZ9w3a6ZFI?autoplay=1" width="560" height="315" frameborder="0"></iframe>
    </div>
</div>

