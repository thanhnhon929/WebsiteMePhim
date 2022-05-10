using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MePhim.Models
{
    public class PhimHay
    {
        public int id { get; set; }
        public string TenPhim { get; set; }
        public string AnhBia { get; set; }
        public string MoTa { get; set; }
        public DateTime NgayCapNhat { get; set; }
    }
}