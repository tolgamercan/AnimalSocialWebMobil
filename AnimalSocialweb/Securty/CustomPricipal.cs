using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace AnimalSocialweb.Securty
{
    public class CustomPrincipal : IPrincipal
    {
        public IIdentity Identity
        {
            get;
            private set;
        }

        private string Role { get; set; }

        public CustomPrincipal(CustomIdentity identity, string role)
        {
            this.Identity = identity ;
            this.Role = role;
        }

        public bool IsInRole(string role)
        {
            //return Roles.IsUserInRole(role);
            return Role == role;
        }
    }
}