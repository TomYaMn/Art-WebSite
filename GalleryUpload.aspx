<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="GalleryUpload.aspx.cs" Inherits="Assignment.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .style1{
            color:white;
        }
        .style2{

        }
    </style>

    <h4 style="font-family: 'Times New Roman', Times, serif; font-size: medium; font-weight: bolder; font-style: normal; font-variant: normal; text-transform: none; color: white; text-decoration: blink"> Upload Your file And Show your artwork</h4>
    <table style="width: 31%;">
        <tr>
            <td class="style1">
           Select Image
            </td>
            <td class="style2">
             
                <asp:FileUpload ID="FileUpload1" runat="server" BackColor="#333333" Font-Names="Castellar" ForeColor="#CCCCCC" />
             
            </td>
        </tr>
        <tr>
            <td class="style1">
         Album Name
            </td>
            <td class="style2">
                <asp:TextBox ID="txtImageName" runat="server" Width="241px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1"> 
         Please Fill in the desription of your post
            </td> <td class="style2"> 
           
               <asp:TextBox ID="txtImageDescription" runat="server" Height="329px" Width="241px"></asp:TextBox>
               </td>
        </tr>
        
        <tr>
               <td class="style1"> </td> <td class="style2"> 
           
               <asp:Button ID="btnUpload" runat="server" Height="26px" Text="Upload" OnClick="btnUpload_Click" />
               </td>
        </tr>
        
        </table>    
        <p> <asp:Label ID="lblError" runat="server" Font-Bold="True" 
                ForeColor="Red"></asp:Label>  </p>
</asp:Content>
