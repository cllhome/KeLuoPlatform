using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using KeLuoPlatform.Common;
using KeLuoPlatform.Service.Data;
using MySql.Data.MySqlClient;


namespace KeLuoPlatform.Service.Pharmacy
{
    public class PharmacyService
    {

        public List<PharmacyModel> GetList()
        {
            var dt = SQLHelper.ExecuteDataTable("select * from test", System.Data.CommandType.Text);
            Logger.Log.Warn("Service开始");

            var list = new List<PharmacyModel>();
            var item = new PharmacyModel() { name= "name", department="dept"};
            list.Add(item);
            return list;
        }
    }
}
