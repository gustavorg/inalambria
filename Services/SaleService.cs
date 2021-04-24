using System.Collections.Generic;
using inalambria.Data;
using inalambria.Models;
using System;
namespace inalambria.Services
{
    public class SaleService
    {
        public List<SaleModel> all(int provider_id,int product_id,string date1,string date2)
        {
            SaleData dsale = new SaleData();
            return dsale.all(provider_id,product_id,date1,date2);
        }

    }
}