using Microsoft.Extensions.DependencyInjection;

using RxWeb.Core.Data;

using RxWebSampleApp.BoundedContext.Singleton;
using RxWebSampleApp.Infrastructure.Singleton;

namespace RxWebSampleApp.Api.Bootstrap
{
    public static class Singleton
    {
        public static void AddSingletonService(this IServiceCollection serviceCollection)
        {
            #region Singleton
            serviceCollection.AddSingleton<ITenantDbConnectionInfo, TenantDbConnectionInfo>();
            serviceCollection.AddSingleton(typeof(UserAccessConfigInfo));
            #endregion Singleton
        }

    }
}




