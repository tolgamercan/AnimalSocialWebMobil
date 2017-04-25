<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="AnimalSocialweb.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
     <link href="StyleSheet/LoginCss/Login.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/LoginJS.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
     <script>
         $(document).ready(function () {
             $("#LoginButton").click(function () {
                 $.ajax({
                     type: "POST",
                     url: "LoginHandler.ashx",
                     data: "email=" + $("#lg_username").val() + "&password=" + $("#lg_password").val() + "&processType=login",
                     dataType: "json",
                     success: function (data) {
                         if (data == 1) {
                             document.location = "Pages/MainPage.aspx";
                         }
                     }
                 });
             });
         });
         //5555
     </script>
</head>
<body>  
    <div class="login-form-1">
		<form id="form1" runat="server" class="text-left">  
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="lg_username" class="sr-only">Username</label>
						<asp:TextBox runat="server" type="text" CssClass="form-control" id="lg_username" name="lg_username" placeholder="username"/>
					</div>
					<div class="form-group">
						<label for="lg_password" class="sr-only">Password</label>
						<asp:TextBox runat="server" type="password" CssClass="form-control" id="lg_password" name="lg_password" placeholder="password"/>
					</div>
					<div class="form-group login-group-checkbox">
        
						<asp:CheckBox runat="server"  id="lg_remember" name="lg_remember"/>
						<label for="lg_remember">remember</label>
					</div>
				</div>
       
				<button type="button" id="LoginButton" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>forgot your password? <a href="#">click here</a></p>
				<p>new user? <a href="RegisterPage.aspx">create new account</a></p>
			</div>
		</form>
        </div>    
</body>
</html>

