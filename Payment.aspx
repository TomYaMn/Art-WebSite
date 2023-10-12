<%@ Page Title="" Language="C#" MasterPageFile="~/mainMaster.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Assignment.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>


        .hidden{
            display:none;
        }

        .Label{
            color:white;
        }
        .Input{

        }
    </style>
    <br /><br /><br /><br /><br />
    <asp:PlaceHolder ID="plhFeature" runat="server"></asp:PlaceHolder>
    <asp:Label ID="lblPrice" runat="server" ForeColor="White"></asp:Label>
    <asp:TextBox ID="txtPrice" CssClass="hidden" runat="server"></asp:TextBox>



    <table>
        <thead>
            <tr>
                <td>
                    <div class="Label">Name:</div>
                </td>
                <td>
                    <div class="Input">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="RequiredFieldValidator" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>
        </thead>
        <tbody>
          <tr>
            <td><div class="Label">CardType</div></td>
            <td>
                <div class="Input">
                    <asp:DropDownList ID="ddlCardType" runat="server">
                        <asp:ListItem>MasterCard</asp:ListItem>
                        <asp:ListItem>Visa</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCardType" ErrorMessage="RequiredFieldValidator" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </td>
          </tr>
          <tr>
            <td><div class="Label">Credit Card Number:</div></td>
            <td>
                <div class="Input">
                    <asp:TextBox ID="txtCreditCardNumber" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a correct format of credit card no" ControlToValidate="txtCreditCardNumber" ForeColor="Red" ValidationExpression="\d{4}-\d{4}-\d{4}-\d{4}"></asp:RegularExpressionValidator>
                </div>
            </td>
          </tr>
          <tr>
            <td><div class="Label">CVV</div></td>
            <td>
                <div class="Input">
                    <asp:TextBox ID="txtCVV" runat="server" MaxLength="3"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCVV" ErrorMessage="Please input 3 digit of CVV number" ForeColor="Red" ValidationExpression="\d{3}"></asp:RegularExpressionValidator>
                </div>
            </td>
          </tr>
          <tr>
            <td><div class="Label">Amount</div></td>
            <td>
                <div class="Input"><asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Please make sure your amount is right" ControlToValidate="txtAmount" Operator="GreaterThanEqual" ControlToCompare="txtPrice" ForeColor="Red"></asp:CompareValidator>
                </div>
            </td>
          </tr>
        </tbody>
    </table>




    <br /><br /><br /><br /><br /><br /><br /><br />
    <asp:Button ID="Pay" runat="server" Text="Pay" OnClick="Pay_Click" />

</asp:Content>
