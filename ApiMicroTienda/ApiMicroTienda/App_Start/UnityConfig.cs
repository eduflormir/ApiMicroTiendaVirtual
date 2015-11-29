using Microsoft.Practices.Unity;
using System.Web.Http;
using Unity.WebApi;

namespace ApiMicroTienda
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();
            
            // agrego referencia con el metodo Init
            Bootstraper.Init(container);
            
            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}