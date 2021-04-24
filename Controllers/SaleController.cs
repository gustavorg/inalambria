using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using inalambria.Models;
using inalambria.Services;
using System;

namespace inalambria.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SaleController:ControllerBase
    {
        [HttpGet]
        [Route("")]
        public IActionResult  all(int provider_id,int product_id,string date1 = "0",string date2 = "0")
        {
            SaleService service = new SaleService();
            var status = true; List<SaleModel>  result = null;
           // try{
                result = service.all(provider_id,product_id,date1,date2);
           // }catch (System.Exception)
           // {
               //status = false;
           // }

            var rtn = new {
                status = status,
                result = result
            };

            return Ok(rtn);
        }
    }   
}