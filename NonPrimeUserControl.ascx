<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NonPrimeUserControl.ascx.cs" Inherits="Assignment.NonPrimeUserControl" %>

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
    
    <div class="BlinkBlink">
        <img src="/Images/LoveBlinkBlink.gif" width="160" height="160" alt="Dancing">
    </div>

<div class="BlinkBlinkDialogueContainer">
    <div class ="BlinkBlinkDialogue">
        <p>You can unlock all access to our web by becoming one of our premium user, it will also support us to keep developing the web!<br /><br />
        Click <a href="Payment.aspx?PurchaseType=Premium&Price=150&ArtId=NULL" style="color:#00b1d2">HERE</a> To join as our family!!!
        </p>
    </div>
</div>


<div class="container">
    <div class="primeTitle">
        <h1>Tutorial: Fasion Illustration in 7 steps</h1>
        <h3>by <span style="color: #00b1d2">MelEesa Lorett</span></h3>
        <br />
        <br />
        <p>
            Hello, my name is <span style="color: #00b1d2">MelEesa Lorett</span> and today I will be sharing with you the basics of fashion illustration in an 
            <span style="color: #00b1d2">Oscar de la Renta</span>-inspired drawing series. My background was in fashion design/illustration for 15 years. About 
            four years ago I became a character and surfacing designer for animation and film. I found that my knowledge for textures, fabrics, prints, and 
            clothing has helped me carve a niche in this market. By the end of this blog I hope you will gain a few insights on the industry and absorb a 
            few tricks to help you moving forward.
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
        <h1>Step 1: Proportions</h1>
        <p>
            The first thing most people notice in fashion illustration is that the figures (croquis) are very tall. With the average human being 7.5-8 
            heads high, in fashion we add at least one extra head into the legs and feet. (A lot of runway models will wear 4-5" heels in real life which 
            adds to the elongation). The 9-head croquis also gives the artist room to play with the 'rule of thirds' and create a more dramatic model for 
            the clothing to sit on.
        </p>
        <div class="imageDiv">
            <image src="/PrimePageImages/Mel1.jpg" alt="Mel1" class="imageDiv"></image>
        </div>
    <p>
        Above I've shown you the basic breakdown of a 9-head figure. I do want to emphasize that this is a starting point, not a rule. If you were to go 
            onto Pinterest and look up fashion illustrations, you will see a wide variety of styles and shape proportions. With fashion finally starting to 
            become more inclusive, I believe it's our responsibility as artists to show different representations in our work. 
    </p>
    <div class="imageDiv">
        <image src="/PrimePageImages/Mel2.jpg" alt="Mel2"></image>
    </div>
    <p>
        Here, I've demonstrated what it looks like when you start adding extra head lengths to the model. I’ve shown things evenly scaled up, however 
            feel free to play with your proportions, shapes, focal points. Always keep in mind what clothes you will be drawing. You might have to shift 
            your base croquis proportions to help emphasize and add detail on the garment.
    </p>
    <br />
    </div>

    <div class="primeContent">
        <h1>Step 2: Exaggeration</h1>
        <p>When you start penciling in the garment you want to pick 1-2 things to focus on. This could be a silhouette, a ruffle, a print, a colour, 
            and the like. You want to push the boundaries of that element by doing things like making the focus bigger or smaller, brighter, more showy, etc.  </p>
        <p>You will most likely notice that runway models tend to have minimalist hair and makeup. Designers want the focus to be on the garment, not the person. 
            With that in mind many illustrators don’t always draw full faces. The areas I chose to focus on and exaggerate in my drawings are: </p>
        <ul>
          <li>Drawing A: The print, and the air at the bottom of the skirt </li>
          <li>Drawing B: The ruffle skirt </li>
          <li>Drawing C: The fabric and the off-the-shoulder element </li>
          <li>Drawing D: The sequin fabric and silhouette</li>
        </ul>
        <div class ="imageDiv">
            <image src="/PrimePageImages/Mel3.jpg" alt="Mel3"></image><br />
        </div>
    </div>

    <div class="primeContent">
        <h1>Step 3: Lighting</h1>
        <p>Runway shows traditionally had very harsh spotlights, or flash photography. These days runway shows are outdoors at night in greek ruins, or a man-made 
            indoor beach, or a rocket ship, or any number of expensive environments. You can choose your own lighting, but today I’m going to teach you the traditional 
            way—using the paper as your highlight. </p>
        <p>Start by imagining where your light source is. Mine is almost always upper left. I actually visualize where the base colour hits the highlight and start 
            inking an edge line first, then colour, and then the rest. Using the rule of thirds, I colour 2/3 of the garment and leave 1/3 blank. This can be awkward
            when you first start, and it honestly takes a few goes to get it right. If your base colour is too dark, and the contrast is too harsh, go in and feather 
            the edges out a bit (like I did in C and D).</p>
        <div class ="imageDiv">
            <image src="/PrimePageImages/Mel4.jpg" alt="Mel4"></image><br />
        </div>
    </div>

    <div class="primeContent">
        <h1>Step 4: Texture</h1>
        <p>Creating depth and texture in the fabric is the best thing you can do to keep your illustrations from looking flat. There are a variety of ways to do this. 
            Here are a few of the most popular ones: </p>
        <ul>
          <li>Finding free fabric textures online and using them to mask onto your base layer. </li>
          <li>Use Photoshop’s Mixer Brush tool to screenshot a texture and then paint over it. (This takes some practice and manipulation to keep the print from looking striped).</li>
          <li>Collect and build your own brushes in Photoshop and draw them by hand or manipulate over an existing texture. </li>
          <li>For repeats: Use the Pattern Preview tool in Photoshop or create your own repeat in Illustrator and place it in. </li>
        </ul>
        <p>Below I’ve shown how I made four different textures for each look before doing a clipping mask to my base colour.</p>
        <div class ="imageDiv">
            <image src="/PrimePageImages/Mel5.jpg" alt="Mel5"></image>
        </div>
        <div class ="imageDiv">
            <image src="/PrimePageImages/Mel6.jpg" alt="Mel6"></image>
        </div>
        <br />
    </div>

    <div class="primeContent">
        <h1>Step 5: Shadow</h1>
        <p>Using my imaginary light source, I started filling in shadows with a 50% opacity feather pen tool. I know a lot of people that use a hard brush and soften 
            it with a smudge tool, or Filter/Blur/Gaussian Blur. I personally like the control of layering shadows myself but there’s no one ‘right way.’ If you struggle 
            with shadows in fabric, looking at real-life references will give you an idea of how light bounces on moving fabric. </p>
        <div class ="imageDiv">
            <image src="/PrimePageImages/Mel7.jpg" alt="Mel7"></image>
        </div>
        <br />
    </div>

    <div class="primeContent">
        <h1>Step 6: Highlight</h1>
        <p>This step helps pop the base colour on the page by enhancing the movement in fabric folds or drape. Remember that fabric wraps around the body, so you want to 
            highlight that. I also used a watercolour brush to soften edges, and a hard brush to show reflected light on the runway.</p>
        <div class ="imageDiv">
            <image src="/PrimePageImages/Mel8.jpg" alt="Mel8"></image>
        </div>
        <br />
    </div>

    <div class="primeContent">
        <h1>Step 7: Finishing Touches</h1>
        <p>My last step is to ground my figures so they don’t look like they are floating on the page. Oh, and to add any extra air and drama I missed. Some artists will 
            hint at having an audience, or show the colour of the runway. It’s really up to your own personal style. </p>
        <div class ="imageDiv">
            <image src="/PrimePageImages/Mel9.jpg" alt="Mel9"></image>
        </div>
        <p>Thanks so much for reading. Feel free to reach out with any questions or comments.</p><br />
    </div>
</div>