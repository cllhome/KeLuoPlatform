
using KeLuoPlatform.API.Common;
using Microsoft.AspNetCore.Mvc;
using KeLuoPlatform.Service.Pharmacy;
using Microsoft.Extensions.Configuration;
using KeLuoPlatform.Common;
using System.Net.Http;
using System;
using System.Threading.Tasks;
using System.Net;
using KeLuoPlatform.Service.Http;
using System.Text;
using Newtonsoft.Json;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace KeLuoPlatform.API.Controller
{
    [Route("api/[controller]")]
    public class PharmacyController : ControllerBase
    {

        private static IConfiguration _config  =Configuration.Load();

        private PharmacyService _pharmacyService = new PharmacyService();

        [HttpGet]
        public CommonResult  Get()
        {
            var data = _pharmacyService.GetList();


            string responseStr = HttpRequestHelper.GetToUrl("https://localhost:44300/api/test", Encoding.UTF8);
            var model = JsonConvert.DeserializeObject<PharmacyModel>(responseStr);
            Logger.Log.Info(string.Format("{0}: {1}", "Get", model.ToString()));

            string postData = string.Format("name={0}&department={1}", model.name, model.department);

            //var obj = new { name = "test trigger api", department = "this is the department" };
            //string jsonStr = JsonHelper.ToJson(obj);
            //Logger.Log.Info(string.Format("{0}: {1}", "POST.Request", jsonStr));
            byte[] byteData = UTF8Encoding.UTF8.GetBytes(postData);
            responseStr = HttpRequestHelper.PostToUrl("https://localhost:44300/api/test", byteData, Encoding.UTF8);
            //Logger.Log.Info(string.Format("{0}: {1}", "POST.Response", responseStr));
            return new CommonResult { Status = true, Message = model.ToString(), Result = data };
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
            Logger.Log.Info(string.Format("{0}: {1}", "PharmacyController.Post", model.ToString()) );
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
