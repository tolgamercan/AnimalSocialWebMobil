using AnimalSocialweb.Model;
using AnimalSocialweb.Models;
using AnimalSocialweb.Provider;
using Newtonsoft.Json;
using RestSharp;
using RestSharp.Authenticators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace AnimalSocialweb
{
    /// <summary>
    /// Summary description for LoginHandler
    /// </summary>
    public class LoginHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            var user = new AuthUser();
            context.Response.ContentType = "application/json";
            LoginProvider provider = new LoginProvider();
            string email = context.Request.Params["email"];
            string password = context.Request.Params["password"];
            string firstName = context.Request.Params["firstName"];
            string lastName = context.Request.Params["lastName"];
            string processType = context.Request.Params["processType"];
            string confirmPassword = context.Request.Params["confirmPassword"];
            
            if (processType=="login")
            {
                 user = provider.Login(email, password);
            }
            else if (processType=="register")
            {
                var regUser = provider.Register(email, password, firstName, lastName, confirmPassword);
                 user = provider.Login(email, password);
            }       
            
            if (user != null)
            {
                context.Response.Write("1");
                AuthorizedUser(user, context);
            }
            else
                context.Response.Write("0");       
        }

        protected void AuthorizedUser(AuthUser user, HttpContext context)
        {

            FormsAuthenticationTicket ticket1 =
            new FormsAuthenticationTicket(
                 1,// version
                 user.Name,// get username  from the form
                 DateTime.Now,                              // issue time is now
                 DateTime.Now.AddDays(1),               // expires in 1 day
                 false,                                 // cookie is not persistent
                 JsonConvert.SerializeObject(user)      // role assignment is stored
                // in userData
                 );
            System.Web.HttpCookie cookie1 = new System.Web.HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket1));
            context.Response.Cookies.Add(cookie1);
          

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}