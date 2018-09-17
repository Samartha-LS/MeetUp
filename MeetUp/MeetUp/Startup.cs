using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MeetUp.Startup))]
namespace MeetUp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
