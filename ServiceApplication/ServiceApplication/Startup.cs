using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ServiceApplication.Startup))]
namespace ServiceApplication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
