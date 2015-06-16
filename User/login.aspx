<%@ Page Title="Daftar Masuk" Language="C#" MasterPageFile="~/User/Session.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ibnusina.login" %>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="row lead">
        <div class="col-md-3 col-md-offset-4">
            
            <h2>Please Sign in Here</h2>
            <form runat="server">
            <div class="form-group">
                <asp:TextBox ID="usernameTxtBox" runat="server" placeholder="Username"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:TextBox ID="passwordTxtBox" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
            </div>
            
            
            <asp:Button ID="submitBtn" runat="server" Text="Submit" OnClick="submitBtn_Click" CssClass="btn btn-md btn-primary btn-block" />
        </form>
        </div>
    </div>
    <!-- /.lead content -->
    <div class="col-md-offset-4">
        <p>Dont have account yet?Register <a href="register.aspx">here</a></p>
    </div>
</asp:Content>
