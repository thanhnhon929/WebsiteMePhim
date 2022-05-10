using MePhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace MePhim.Areas.Admin.Controllers
{
    public class ChieuRapController : Controller
    {

        dbPhimDataContext data = new dbPhimDataContext();

        public ActionResult Index()
        {
            return View(from cr in data.CHIEURAPs select cr);
        }
        public ActionResult Details(int id)
        {
            var cr = data.CHIEURAPs.SingleOrDefault(n => n.MaChieuRap == id);
            if (cr == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(cr);
        }
        public CHIEURAP GetCR(int id)
        {
            return (data.CHIEURAPs.OrderBy(n => n.TenChieuRap).Where(n => n.MaChieuRap == id).SingleOrDefault());
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var cr = data.CHIEURAPs.SingleOrDefault(n => n.MaChieuRap == id);
            return View(cr);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f)
        {
            var cr = data.CHIEURAPs.SingleOrDefault(n => n.MaChieuRap == int.Parse(f["iMaChieuRap"]));
            if (ModelState.IsValid)
            {
                cr.TenChieuRap = f["sTenChieuRap"];
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
            return View(GetCR(id));
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection f)
        {
            var cr = GetCR(id);
            if (cr == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            data.CHIEURAPs.DeleteOnSubmit(cr);
            data.SubmitChanges();
            return RedirectToAction("Index");
        }
       
    }
}