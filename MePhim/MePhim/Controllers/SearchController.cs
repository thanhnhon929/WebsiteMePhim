using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MePhim.Models;
namespace MePhim.Controllers
{
    public class SearchController : Controller
    {
        dbPhimDataContext db = new dbPhimDataContext();
        // GET: Search

        public ActionResult Search(string strSearch)
        {
            ViewBag.Search = strSearch;
            if (!string.IsNullOrEmpty(strSearch))
            {
                //Truy van
                var kq = from s in db.PHIMs where s.TenPhim.Contains(strSearch) || s.MoTa.Contains(strSearch) select s;
                
                //Phuong thuc
                return View(kq);
            }
            return View();
        }
       
        
    }
}