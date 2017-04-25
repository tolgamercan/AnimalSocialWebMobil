using AnimalSocialweb.Model;
using AnimalSocialweb.Securty;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace AnimalSocialweb
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Application_AuthenticateRequest()
        {

            if (FormsAuthentication.CookiesSupported)
            {
                HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
                if (authCookie == null)
                    return;
                FormsAuthenticationTicket formTicket = FormsAuthentication.Decrypt(authCookie.Value);
                string userName = formTicket.Name;
                AuthUser user = JsonConvert.DeserializeObject<AuthUser>(formTicket.UserData);
                HttpContext.Current.User = new CustomPrincipal(new CustomIdentity(userName, user, "Forms") ,"");
            }

        }

    }
}