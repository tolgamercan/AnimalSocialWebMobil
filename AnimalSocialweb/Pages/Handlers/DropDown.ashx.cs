using AnimalSocialweb.Securty;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AnimalSocialweb.Pages.Providers
{
    /// <summary>
    /// Summary description for DropDown
    /// </summary>
    public class DropDown : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var user = context.User.Identity as CustomIdentity;
            AnimalProcess provider = new AnimalProcess();
            string dropDownType = context.Request.Params["RequestType"];
            string inputRaceName=context.Request.Params["InputRaceName"];
            var data = "";
            switch (dropDownType)
            {
                case "RaceDropDown": data = provider.GetRaceValues(user.User.accessToken);
                    context.Response.Write(data);
                    break;
                case "RaceSaveButton": data = provider.AddRaceValues(user.User.accessToken, inputRaceName);
                    context.Response.Write(data);
                    break;
                default:
                    break;
            }
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