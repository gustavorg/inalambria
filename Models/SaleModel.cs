using System;
namespace inalambria.Models
{
    public class SaleModel
    {
        public int id { get; set; }
        public string customer { get; set; }
        public string provider { get; set; }
        public decimal amount { get; set; }
        public decimal tax { get; set; }   
        public decimal discount { get; set; }   
        public decimal totalAmount { get; set; }
        public int itemQty { get; set; }
    }
}