<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Assignment.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

      .slider-container {
        position: static;
        height:100%;
        width:95%;
        margin:30px -30px 70px 50px;
        padding:0px -80px 0px 0px;
        border-style:dotted solid solid solid;
        border-color: rgb(150,150,150);
        border-width: medium;
      }

      .mySlides {
        display: none;
      }
      .slide {
        height:600px;
        width:1066px;
        position: absolute;
        background-repeat: no-repeat;
        top: 160px;
        left: 200px;
      }

      .prev,
      .next {
        cursor: pointer;
        position: absolute;
        top: 830px;
        width: auto;
        padding: 16px;
        margin-top: -50px;
        color: white;
        font-weight: bold;
        font-size: 20px;
        border-radius: 0 3px 3px 0;
        user-select: none;
        -webkit-user-select: none;
      }

      .next {
        right: 310px;
        border-radius: 3px 0 0 3px;
       }
      .prev {
        right: 360px;
        border-radius: 3px 0 0 3px;
       }

      .prev:hover,
      .next:hover {
        background-color: rgba(120, 120, 120, 0.8);
      }

      .caption-container {
        position:absolute;
        max-width:180px;
        right:120px;
        top:250px;
        text-align: center;
        background-color: #222;
        padding: 2px 16px;
        color: white;
      }

    </style>


    <div class="slider-container">
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

      <div class="mySlides">
          <div class="slide" style="background-image: url('/Images/Guweiz1.jpg');" 
              title=" &#8220; I found I could say things with color and shapes that I couldn’t say any other way, things that I had no words for.&#8221;   
              <br/><br/><br/><br/>—— Georgia O’Keeffe " ></div>
      </div>

      <div class="mySlides">
          <div class="slide" style="background-image:url('/Images/Guweiz4.jpg');" 
              title=" &#8220; Every artist was first an amateur.&#8221;   
              <br/><br/><br/><br/>—— Ralph Waldo Emerson "></div>
      </div>

      <div class="mySlides">
          <div class="slide" style="background-image: url('/Images/Guweiz5.jpg');" 
              title=" &#8220; Artists are just children who refuse to put down their crayons.&#8221;   
              <br/><br/><br/><br/>—— Al Hirschfeld "></div>
      </div>

      <div class="mySlides">
          <div class="slide" style="background-image: url('/Images/Guweiz6.jpg');" 
              title=" &#8220; Art is standing with one hand extended into the universe and one hand extended into the world, and letting ourselves be a conduit for passing energy.&#8221;   
              <br/><br/><br/><br/>—— Albert Einstein "></div>
      </div>
      
      
      

      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>


      <div class="caption-container">
      <p id="caption"></p>
      </div>
    </div>




    <script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("slide");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }

  slides[slideIndex-1].style.display = "block";
  captionText.innerHTML = dots[slideIndex-1].title;
}
    </script>
        </asp:Content>



