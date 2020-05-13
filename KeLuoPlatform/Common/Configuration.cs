using Microsoft.Extensions.Configuration;
using System.IO;

namespace KeLuoPlatform.API.Common
{
    public class Configuration
    {
        public static IConfigurationRoot Config { get; private set; }

        public static IConfigurationRoot Load()
        {
            if (Config == null)
            {
                Config = new ConfigurationBuilder()
             .SetBasePath(Directory.GetCurrentDirectory())
             .AddJsonFile("appsettings.json")
             .Build();
            }
            return Config;
        }
    }
}
