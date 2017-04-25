using AnimalSocialweb.Model;
using AnimalSocialweb.Models;
using Newtonsoft.Json;
using RestSharp;
using RestSharp.Authenticators;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace AnimalSocialweb.Provider
{
    public class LoginProvider
    {
        private RestClient client;
        
        public LoginProvider()
        {
            string WebApiAdres = ConfigurationManager.AppSettings["WebApiAdres"];
             client = new RestClient(WebApiAdres);
        }

        public AuthUser Login(string email, string password)
        {
            var request = new RestRequest(@"/token", Method.POST);

            var encodedBody = string.Format("username={0}&password={1}&grant_type=password", email, password);
            request.AddParameter("application/x-www-form-urlencoded", encodedBody, ParameterType.RequestBody);
            request.AddParameter("Content-Type", "application/x-www-form-urlencoded", ParameterType.HttpHeader);
            IRestResponse response = client.Execute(request);
            string result = response.Content;
            GetTokenModel getParams = JsonConvert.DeserializeObject<GetTokenModel>(result);
            client.Authenticator = new OAuth2AuthorizationRequestHeaderAuthenticator(getParams.access_token, "bearer");

            if (!String.IsNullOrEmpty(getParams.access_token) && email == getParams.userName)
            {

                var user = new AuthUser()
                {
                    accessToken = getParams.access_token,
                    Email = getParams.userName,
                    Name = getParams.FirstName,
                    Surname = getParams.LastName,
                    Id = getParams.userId
                };
                return user;
            }
            else
                return null;
        }
        public void LogOut(string accessToken)
        {
            var request = new RestRequest(@"/api/account/logout", Method.POST);
            request.AddParameter("Authorization",
            string.Format("Bearer " + accessToken),
            ParameterType.HttpHeader);
            IRestResponse response = client.Execute(request);
        }
        public string Register(string email,string password,string firstName,string LastName,string passwordConfirm)
        {
            var request = new RestRequest(@"/api/account/register", Method.POST);
            request.RequestFormat = DataFormat.Json;
            request.AddBody(new { Email =email , Password = password,FirstName=firstName,LastName=LastName,ConfirmPassword=passwordConfirm });
            //request.AddParameter("Content-Type", "application/json", ParameterType.HttpHeader);
            IRestResponse response = client.Execute(request);
            string result = response.Content;
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                return "Registration success";
            }
            else
                return null;
        }
    }
}