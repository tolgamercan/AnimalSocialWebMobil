﻿using AnimalSocialweb.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnimalSocialweb
{
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
      
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("Pages/MainPage.aspx");
            }     
        }
    }
}