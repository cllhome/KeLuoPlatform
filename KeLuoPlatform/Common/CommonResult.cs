using System;

namespace KeLuoPlatform.API.Common
{
    public class CommonResult
    {
        public bool Status { get; set; }
        public Object Result { get; set; }
        public string Message { get; set; }
    }
}
