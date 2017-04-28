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

        public string GetRaceValues(string accessToken)
        {         
        
            RestRequest request = new RestRequest("api/races", Method.GET);
            request.AddParameter("Authorization",
            string.Format("Bearer " + accessToken),
                        ParameterType.HttpHeader);
            var response = client.Execute(request);
            return response.Content;
        }
        public string AddRaceValues(string accessToken,string raceName)
        {
            RestRequest request = new RestRequest("api/races", Method.POST);
            request.AddParameter("Content-Type", "application/json", ParameterType.HttpHeader);
            request.AddParameter("Authorization",
            string.Format("Bearer " + accessToken),
                        ParameterType.HttpHeader);
            request.AddParameter("Name", raceName, ParameterType.GetOrPost);
            var response = client.Execute(request);
            return response.Content;
        }

        public string AddAnimalValues(string accessToken, string raceId, string inputAnimalName, string selectGender, string inputDate)
        {

            RestRequest request = new RestRequest("api/animals", Method.POST);
            request.AddParameter("Content-Type", "application/json", ParameterType.HttpHeader);
            request.AddParameter("Authorization",
            string.Format("Bearer " + accessToken),
                        ParameterType.HttpHeader);
            request.AddParameter("Name", inputAnimalName, ParameterType.GetOrPost);
            request.AddParameter("Gender", selectGender=="0"?false:true, ParameterType.GetOrPost);
            request.AddParameter("RaceId", raceId, ParameterType.GetOrPost);
            request.AddParameter("BirtOfDate", inputDate, ParameterType.GetOrPost);
            var response = client.Execute(request);
            return response.Content;
        }

        
    }
}