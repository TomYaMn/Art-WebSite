<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="PrimeTutorial2.aspx.cs" Inherits="Assignment.WebForm3" %>
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
            height:418px;
            width:800px;
        }
</style>


    <br /><br /><br /><br /><br />
    <div class="container">
    <div class="primeTitle">
        <h1>Tutorial 2: The Human Eye</h1>
        <h3>by <span style="color: #00b1d2">Jarrod Hasenjäger</span></h3>
        <br />
        <br />
    </div>

    <div class="primeContent">
        <h1>Introduction</h1><br /><br />
        <div class="imageDiv">
            <image src="/PrimePageImages/TheHumanEye.jpg" alt="Mel1" class="imageDiv"></image>
        </div>
        <p>
            Hello everyone! A bit of a preamble before getting to it, this post is part of a larger project 
            that I am working on and is mainly motivated by wanting to more formally document information and 
            techniques that I have gathered, instead of keeping it all written down in a notebook. As such, 
            there will more than likely be multiple blog entries involving an array of connected topics, but 
            the intention is not to have them build toward something, but rather just document aspects which I 
            found interesting. I wasn't entirely sure how to categorise this post; it is a bit of a making-of as 
            well as it being a bit of a tutorial, although it doesn't really commit to either in my opinion.
        </p>
        <br /><br /><br /><br />
        <p>
            What is really important to note is that I understand how frustrated the community can find 'tutorials' 
            that don't really show you the entirety of the process, but rather skip over very essential steps. I do 
            apologise if this comes across like that, but as mentioned, this is more of a collection of information 
            while at the same time assuming a basic knowledge of box modelling and how to implement the supplied information. 
        </p>
        <br /><br /><br /><br />
        <p>
            A few things that I feel is necessary to make clear though, starting with the perception of realism. Am 
            I trying to make this eyeball as realistic as possible? Yes, for the most part at least. I have gathered 
            reference that I am following, which is a rule for anything involving art and CG, but I am also willing to 
            deviate and favour appeal when needed. This version of the eye seems to work well within the context of the 
            project it belongs too, with many of the adjustments and choices made to suit the face in which it sits. 
            To be honest, I have never held an eyeball in my hand or seen one detached from its owner, and I don't wish 
            to either, so all references and observations have been made by looking at high-resolution photography which 
            I will list within the article. This last note is important as it does inform my process and decision making, 
            making me feel as though I went down a slightly different route when compared to some of the more popular eyes 
            that have been done. 
        </p>
        <br /><br /><br /><br />
    </div>
    <div class="primeContent">
        <h1>TOOLS USED</h1><br /><br />
        <p>
            Modelling: MODO | Texturing: Mari | Shading and Lighting: Houdini

            Iris texture maps from Texturing XYZ.

            Please note that the maps provided by Texturing XYZ only 
            cover the iris, so the rest of the sclera and veins will 
            need to be hand-painted. 
        </p><br /><br />        
    </div>

    <div class="primeContent">
        <h1>DIMENSIONS</h1><br /><br />
        <p>
            THE EYE<br /><br />

            Knowing the average sizes of the eye and its relative parts is a crucial first step. 
            The average horizontal diameter of an adult human eye is around 24 mm (24.2 mm to be exact), 
            making it roughly the size of a golf ball. The vertical diameter average is very close to that at 23.7 mm, 
            and the transverse diameter can vary between 21 mm to 27 mm. I personally prefer to keep the transverse 
            diameter higher at around 27mm to give the eye the subtle misshapen form. From my understanding, 
            the above numbers do vary, but these seem to be solid averages from which to build upon.
            If you would like to refer to the journal from which I gathered this information, you can find it here.
        </p><br /><br /> 
        <p>
            THE IRIS<br /><br />

            The size of the iris once again varies from person to person and has been recorded within the 
            range of 10.2 mm to 13 mm, with an average size of 12 mm in diameter.<br /><br />

            Iris thickness is not necessarily something you often think about but has been recorded as 
            averaging 0.55 mm for Asian eyes, while caucasian eyes are 0.49 mm.<br /><br />

            Information gathered from this journal.
        </p><br /><br /> 
        <p>
            THE PUPIL<br /><br />

            The average pupil size for Asian eyes is recorded as 4.73 mm with a deviation of 0.85 mm, 
            while caucasian eyes have an average diameter of 4.3 mm with a deviation of 1.02 mm within the test group.<br /><br />

            Information gathered from this journal.
            
        </p><br /><br /> 
        <div class="imageDiv">
            <image src="/PrimePageImages/TheHumanEye_Modelling.jpg" alt="Mel1" class="imageDiv"></image>
        </div>
    </div>

    <div class="primeContent">
        <h1>MODELLING</h1><br /><br />
        <p>
            The components of the eye that I will be creating are the pupil, iris and sclera (one piece of geometry), 
            aqueous humour and cornea. The iris scan geometry is supplied by Texturing XYZ and comes with whatever iris 
            texturing pack you purchase. Although maps are supplied that can be used to displace regular geometry to 
            create the iris complex, it doesn't compare to the actual layered look of the geometry when viewed up close.
        </p><br /><br /> 
        <p>
            BASIC TERMINOLOGY<br /><br />

            Sclera: The sclera is the white part of the eye that surrounds the cornea.<br /><br /> 

            Iris: The iris is a flat and ring-shaped membrane behind the cornea of the eye with an adjustable circular 
            opening in the centre called a pupil. <br /><br />

            Aqueous Humour: Aqueous humour, optically clear, slightly alkaline liquid that occupies the anterior and 
            posterior chambers of the eye (the space in front of the iris and lens and the ringlike space encircling 
            the lens). <br /><br />

            Cornea:  The cornea is the transparent front part of the eye that covers the iris, pupil, and anterior 
            chamber. <br /><br />
        </p>
        <p>
            With the basic, but vital measurements of the eye now known, we can proceed to build a reasonably 
            realistic eye geometry from a simple sphere. As you can see from the below image, I have opened up 
            the pole of the sphere so that the sclera/iris geometry transitions into the internal lens more 
            realistically. The iris portion of the geometry has also been caved inward to create a very 
            distinct transition from the sclera to the iris.<br /><br /><br /><br />
        </p>
        <p>
            The same starting sphere should also be used as the base for the cornea with an ever so slightly 
            increased scale to allow for the cornea to house the internal geometry while also avoiding collisions. 
            The only thing that will need to be adjusted is the topology of the pole of the sphere that will be in 
            front of the iris. Keeping it as a pole will result in pinching of the geometry when subdivided, which 
            will not always be visible from every angle and view, but will always reveal itself when sharp reflections 
            fall directly over it, and especially when there is movement (animation).<br /><br /><br /><br />
        </p>
        <p>
            The pupil is nothing more than a simple card that is placed within the sclera, completely covering the opening 
            in the centre of the iris to avoid any unfortunate light leaks from various angles.  <br /><br /><br /><br />
        </p>
        <p>
            The aqueous humour is not something that is always included, but it sits in the space between the cornea 
            and iris, encompassing even the pupil as well. it can be created by merely duplicating the existing faces 
            of the cornea bulge in the front of the iris and then closing the polygons off so that it forms a sack. <br /><br /><br /><br />
        </p>

    </div>
    </div>
</asp:Content>
