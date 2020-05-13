
using KeLuoPlatform.API.Common;
using Microsoft.AspNetCore.Mvc;
using KeLuoPlatform.Service.Pharmacy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using KeLuoPlatform.Common;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace KeLuoPlatform.API.Controller
{
    [Route("api/[controller]")]
    public class PharmacyController : ControllerBase
    {
        // Message = _config.GetConnectionString("Conn") + _config["MyConfig:name"]

        //private readonly IConfiguration _config;
        //public PharmacyController(IConfiguration config)
        //{
        //    _config = config;
        //}

        private static IConfiguration _config  =Configuration.Load();

        private PharmacyService _pharmacyService = new PharmacyService();

        [HttpGet]
        public CommonResult Get()
        {
            var data = _pharmacyService.GetList();
            return new CommonResult { Status = true, Message = _config.GetConnectionString("Conn"), Result = data };
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        [HttpPost]
        public CommonResult Post(PharmacyModel model)
        {
            return new CommonResult { Status = true, Message = "success", Result = "" };
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
