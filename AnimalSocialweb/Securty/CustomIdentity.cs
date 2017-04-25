using AnimalSocialweb.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace AnimalSocialweb.Securty
{
    public class CustomIdentity : IIdentity
    {

        public CustomIdentity(string Name, AuthUser User, string AuthenticationType)
        {
            this.Name = Name;
            this.User = User;
            this.AuthenticationType = AuthenticationType;
            this.IsAuthenticated = true;
        }

        public string AuthenticationType
        {
            get;
            private set;
        }

        public bool IsAuthenticated
        {
            get;
            private set;
        }

        public string Name { get; private set; }
        public AuthUser User { get; private set; }
    }
}