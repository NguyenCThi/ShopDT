using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopDT.Startup))]
namespace ShopDT
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
