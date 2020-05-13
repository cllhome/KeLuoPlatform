using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace KeLuoPlatform.Common
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
