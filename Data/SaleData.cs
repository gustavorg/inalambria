using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using inalambria.Library;
using inalambria.Models;
using System;

namespace inalambria.Data
{
    public class SaleData : MsSqlExtensions
    { 
        public List<SaleModel> all(int provider_id,int product_id,string date1,string date2){
            List<SaleModel> rtn = null;

        Console.WriteLine(provider_id+"---------"+ product_id+"---------"+  date1+"---------"+  date2);
            SqlParameter[] parameters = {
                 new SqlParameter{ ParameterName= "@pprovider_id", Value = provider_id},
                 new SqlParameter{ ParameterName= "@pproduct_id", Value = product_id},
                 new SqlParameter{ ParameterName= "@pdate1", Value = date1, DbType = DbType.String},
                 new SqlParameter{ ParameterName= "@pdate2", Value = date2, DbType = DbType.String}
            };

            DataTable dt = base.ExecuteDataTable("usp_sales_s_sales",parameters);
            if (dt!=null && dt.Rows.Count>0)
            {
                rtn = new List<SaleModel>();

                foreach(DataRow dr in dt.Rows)
                {
                    rtn.Add(new SaleModel{
                        id = Convert.ToInt16(dr["id"]),
                        customer = Convert.ToString(dr["customer"]),
                        provider = Convert.ToString(dr["provider"]),
                        amount = Convert.ToDecimal(dr["amount"]),
                        tax = Convert.ToDecimal(dr["tax"]),
                        discount = Convert.ToDecimal(dr["discount"]),
                        totalAmount = Convert.ToDecimal(dr["totalAmount"]),
                        itemQty = Convert.ToInt16(dr["itemQty"])
                    });
                }
            }

            return rtn;
        }
    }
}