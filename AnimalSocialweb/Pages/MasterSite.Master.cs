using AnimalSocialweb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using AnimalSocialweb.Securty;

namespace AnimalSocialweb
{
    public partial class MasterSite : System.Web.UI.MasterPage
    {
        protected override void OnPreRender(EventArgs e)
        {
          
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //var user = Page.User.Identity as CustomIdentity;
            //userEmailLabel.Text= user.User.Name;
        }
    }
}