using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace KeLuoPlatform.Common
{
    public static class Logger
    {
        private static readonly NLog.Logger _logger 
            = NLog.Web.NLogBuilder.ConfigureNLog(Path.Combine(AppContext.BaseDirectory, "Log", "NLog.config")).GetCurrentClassLogger();

        public static NLog.Logger Log
        {
            get
            {
                return _logger;
            }
        }
    }
}
