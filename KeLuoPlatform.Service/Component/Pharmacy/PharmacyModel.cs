using System;
using System.Collections.Generic;
using System.Text;

namespace KeLuoPlatform.Service.Pharmacy
{
    public class PharmacyModel
    {
        public string name { get; set; }

        public string department { get; set; }

        public override string ToString()
        {
            return name + department;
        }
    }
}
