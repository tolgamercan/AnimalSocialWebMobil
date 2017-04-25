using AnimalSocialweb.Securty;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace AnimalSocialweb.Pages.Providers
{
    public class AnimalProcess
    {
        private RestClient client;
        public AnimalProcess()
        {
            string WebApiAdres = ConfigurationManager.AppSettings["WebApiAdres"];
            client = new RestClient(WebApiAdres);
        }

        public string GetTribeValues(string accessToken)
        {         
        
            RestRequest request = new RestRequest("api/tribes", Method.GET);
            request.AddParameter("Authorization",
            string.Format("Bearer " + accessToken),
                        ParameterType.HttpHeader);
            var response = client.Execute(request);
            return response.Content;
        }
        public string GetGenusValues(string accessToken)
        {

            RestRequest request = new RestRequest("api/genus", Method.GET);
            request.AddParameter("Authorization",
            string.Format("Bearer " + accessToken),
                        ParameterType.HttpHeader);
            var response = client.Execute(request);
            return response.Content;
        }
        public string GetSpeciesValues(string accessToken)
        {

            RestRequest request = new RestRequest("api/species", Method.GET);
            request.AddParameter("Authorization",
            string.Format("Bearer " + accessToken),
                        ParameterType.HttpHeader);
            var response = client.Execute(request);
            return response.Content;
        }
    }
}