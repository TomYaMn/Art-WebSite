<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="PrimeTutorial3.aspx.cs" Inherits="Assignment.PrimeTutorial3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .BlinkBlink{
            display:block;
            position:sticky;
            top:200px;
            float:right;
            margin-right:80px;
            z-index:1;
        }
        .BlinkBlinkDialogueContainer{
            position:absolute;
 
            display:block;
/*            top:50px;
            right:0;*/
            width: 100%;
            height: 100%;
            
        }
        .BlinkBlinkDialogue{

            position:sticky;
            float:right;
            top:30px;
            display:block;

            background-color:#2e2e2e;
            color:white;
            opacity:0.6;
            width: 300px;

            margin-right:80px;
            padding:15px;
            border-radius:10px;
        }

        .BlinkBlinkDialogue:hover{

            opacity:0.8;
            z-index:2;
        }



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
    

<div class="container">
    <div class="primeTitle">
        <h1>Tutorial 3: FAN mARTerial - God Of War</h1>
        <h3>by <span style="color: #00b1d2">Enrico Tammekänd</span></h3>
        <br />
        <br />
    </div>

    <div class="primeContent">
        <div class="imageDiv">
            <image src="/PrimePageImages/GodOfWarTwitchCover.jpg" alt="Mel1" class="imageDiv"></image>
        </div><br /><br />
        <p>
            Hey guys!
        </p><br /><br /><br /><br /><br /><br />
        <p>
            So this is my very first blog post actually. Or at least a proper one so here it goes:
        </p><br /><br />
        <p>
            I have been wanting to do live streaming on Substance Designer for quite some time now 
            and also do them more often but haven't had the time for it but finally took it up and 
            now there isn't a way back. I didn't want to do just random materials but rather have a 
            consistent theme or style that I could develop in the future as well.
        </p><br /><br />
        <p>
            And here it is: FAN mARTerial series where I will be creating materials about well known games, 
            movies or any other entertainment I'm able to visualize to be a cool texture to try out. But or 
            less I will still try to keep the style within games since that's the industry I'm in and just love it. 
        </p><br /><br />
        <p>
            Since I really enjoyed playing God Of War, then the first material will be towards that art style. I will be creating 
            the materials right there on the spot so just a heads up that I will be making mistakes and for sure there 
            will be a lot of trial and error before something starts to take shape. I want to demonstrate or show that 
            creating artwork isn't always just opening the software and creating some portfolio piece within minutes 
            and finding the perfect balance right away. I think that is one of the biggest misunderstandings that 
            people have and hopefully it shows that it actually requires a lot of effort to finish and polish the final 
            piece (if that actually happens since I have no idea what to expect from the outcome).
        </p><br /><br /><br /><br /><br /><br />
        <p>
            Anyways, in the stream I will be going through some quick ideas on how I usually look at references, the overall 
            look and how I start creating a procedural texture. For sure there are so many different ways of doing them and 
            tons of approaches so please know that I will be showing how I'm used to do everything. If everything comes out 
            nicely, then I will quickly go through rendering in Marmoset too. I have a tutorial on it as well and wouldn't 
            mind earning little something for the effort I put into it but I do think that more tutorials should be cheaper 
            or even free since I know the struggle when you start out and can't afford even the basics to get you started. 
            This again is my own personal opinion so I hope I don't get much hate from this. So yeah, what meant by that is, 
            if everything goes well then at the end I will show a proper way of presenting your materials in Marmoset Toolbag 
            so you don't need to purchase it.
        </p><br /><br /><br /><br />
        <p>
            The time for it might change since I can't predict the future (or maybe I can?) and don't know what the day will 
            hold for me, but right know I am thinking of starting it at 20:00 or 8PM Barcelona Time (Central European Summer 
            Time GMT+2) on 25/10/2018.
        </p><br /><br /><br />
        <p>
            And by the way, I am testing out my own personal logo which has a really simple design so if anyone knows if this 
            logo is used by any other artist, please let me know ASAP so I can change it since I don't want to copy someone else.
        </p><br /><br /><br /><br /><br /><br />
        <p>
            Oh and a final remind is that I might "casually curse" a bit so beware that some Estonian swearing might be heard.<br />
            So stay awesome and see you guys on Thursday!
        </p>
        
    </div>
</asp:Content>
