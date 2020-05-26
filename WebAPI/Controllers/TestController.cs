using KeLuoPlatform.Common;
using KeLuoPlatform.Service.Pharmacy;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPI.Controllers
{
    [Route("api/[controller]")]
    public class TestController: ControllerBase
    {
        [HttpGet]
        public ActionResult<string> Get()
        {
            return "{\"name\":\"cuilin\", \"department\":\"test\"} ";
        }

        [HttpPost]
        public PharmacyModel Post(PharmacyModel model)
        {
            Logger.Log.Info("im here" + model.ToString());

            model.department = "department from response";
            return model;
        }

        [HttpPost("Form")]
        public PharmacyModel PostForm(PharmacyModel model)
        {
            Logger.Log.Info("im here form" + model.ToString());

            model.department = "department from response";
            return model;
        }
    }
}
