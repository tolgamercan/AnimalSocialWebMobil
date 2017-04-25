using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AnimalSocialweb.Model
{
    public class AuthUser
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public string Id { get; set; }
        public string accessToken { get; set; }

        //public int Role { get; set; }
        //public string RoleName { get; set; }
    }
}