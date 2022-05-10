using MePhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace MePhim.Areas.Admin.Controllers
{
    public class PhimHayController : Controller
    {

        dbPhimDataContext data = new dbPhimDataContext();

        public ActionResult Index()
        {
            return View(from ph in data.PHIMHAYs select ph);
        }
        public ActionResult Details(int id)
        {
            var ph = data.PHIMHAYs.SingleOrDefault(n => n.MaPhimHay == id);
            if (ph == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(ph);
        }
        public PHIMHAY GetPH(int id)
        {
            return (data.PHIMHAYs.OrderBy(n => n.TenPhimHay).Where(n => n.MaPhimHay == id).SingleOrDefault());
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var ph = data.PHIMHAYs.SingleOrDefault(n => n.MaPhimHay == id);
            return View(ph);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f)
        {
            var ph = data.PHIMHAYs.SingleOrDefault(n => n.MaPhimHay == int.Parse(f["iMaPhimHay"]));
            if (ModelState.IsValid)
            {
                ph.TenPhimHay = f["sTenPhimHay"];
                data.SubmitChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("Edit");
            }
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            return View(GetPH(id));
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection f)
        {
            var ph = GetPH(id);
            if (ph == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            data.PHIMHAYs.DeleteOnSubmit(ph);
            data.SubmitChanges();
            return RedirectToAction("Index");
        }
       
    }
}