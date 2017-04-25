using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AnimalSocialweb.Models
{
    public class GetTokenModel
    {
       public string access_token { get; set; }
       public string userName { get; set; }
       public string userId { get; set; }
       public string token_type { get; set; }
       public string FirstName { get; set; }
       public string LastName { get; set; }
    }
}