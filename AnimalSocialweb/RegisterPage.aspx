<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="AnimalSocialweb.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
     <link href="StyleSheet/LoginCss/Login.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/LoginJS.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
    <script>
         $(document).ready(function () {
             $("#RegisterButton").click(function () {
                 $.ajax({
                     type: "POST",
                     url: "LoginHandler.ashx",
                     data: "email=" + $("#reg_username").val() + "&password=" + $("#reg_password").val() + "&confirmPassword=" + $("#reg_password_confirm").val() + "&firstName=" + $("#reg_first_name").val() + "&lastName=" + $("#reg_last_name").val() + "&processType=register",
                     dataType: "json",
                     success: function (data) {
                         if (data == 1) {
                             document.location = "Pages/MainPage.aspx";
                         }
                     }                     
                 });
             })
         })
     </script>
    <title></title>
</head>
<body>
    
    <div class="text-center" style="padding:50px 0">
	<div class="logo">register</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form runat="server" id="register_form" class="text-left">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<asp:label runat="server" for="reg_username" class="sr-only" Text="Email Address"/>
						<asp:TextBox runat="server" type="text" class="form-control" id="reg_username" name="reg_username" />
					</div>
					<div class="form-group">
						<asp:label runat="server" for="reg_password" CssClass="sr-only" Text="Password"/>
						<asp:TextBox runat="server" type="password" class="form-control" id="reg_password" name="reg_password" />
					</div>
					<div class="form-group">
						<asp:label runat="server" for="reg_password_confirm" class="sr-only" Text="Password Confirm"/>
						<asp:TextBox runat="server" type="password" class="form-control" id="reg_password_confirm" name="reg_password_confirm"/>
					</div>
					
					<div class="form-group">
						<asp:label runat="server" for="reg_email" class="sr-only" Text="First Name"/>
						<asp:TextBox runat="server" type="text" class="form-control" id="reg_first_name" name="reg_email" />
					</div>
					<div class="form-group">
						<asp:label runat="server" for="reg_fullname" class="sr-only" Text="Last Name"/>
						<asp:TextBox runat="server" type="text" class="form-control" id="reg_last_name" name="reg_fullname" />
					</div>
					
					<div class="form-group login-group-checkbox">
						 <asp:RadioButton runat="server" class="" name="reg_gender" id="male" />
						<label runat="server"  for="male" >Male</label>
						
						 <asp:RadioButton runat="server" class="" name="reg_gender" id="female" />
						<label  for="female" > Female</label>
					</div>
					
					<div class="form-group login-group-checkbox">
						<asp:CheckBox runat="server" type="checkbox" class="" id="reg_agree" name="reg_agree"/>
						<label runat="server"  for="reg_agree">i agree with <a href="#">terms</a></label>
					</div>
				</div>
				<button type="button" id="RegisterButton" class="login-button"><i class="fa fa-chevron-right"></i></button>
			</div>
			<div class="etc-login-form">
				<p>already have an account? <a href="#">login here</a></p>
			</div>
		</form>
	</div>
  </div>
</body>
</html>
