using Microsoft.Extensions.Configuration;
using System.IO;

namespace KeLuoPlatform.Common
{
    public class KeLuoConfig
    {
        private static IConfigurationRoot _config;

        public static IConfigurationRoot Load()
        {
            if (_config == null)
            {
                _config = new ConfigurationBuilder()
             .SetBasePath(Directory.GetCurrentDirectory())
             .AddJsonFile("appsettings.json")
             .Build();
            }
            return _config;
        }
    }
}
