using MePhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace MePhim.Areas.Admin.Controllers
{
    public class PhimLeController : Controller
    {

        dbPhimDataContext data = new dbPhimDataContext();

        public ActionResult Index()
        {
            return View(from pl in data.PHIMLEs select pl);
        }
        public ActionResult Details(int id)
        {
            var pl = data.PHIMLEs.SingleOrDefault(n => n.MaPhimLe == id);
            if (pl == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(pl);
        }
        public PHIMLE GetPL(int id)
        {
            return (data.PHIMLEs.OrderBy(n => n.TenPhimLe).Where(n => n.MaPhimLe == id).SingleOrDefault());
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var pl = data.PHIMLEs.SingleOrDefault(n => n.MaPhimLe == id);
            return View(pl);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f)
        {
            var pl = data.PHIMLEs.SingleOrDefault(n => n.MaPhimLe == int.Parse(f["iMaPhimLe"]));
            if (ModelState.IsValid)
            {
                pl.TenPhimLe = f["sTenPhimLe"];
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
            return View(GetPL(id));
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection f)
        {
            var pl = GetPL(id);
            if (pl == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            data.PHIMLEs.DeleteOnSubmit(pl);
            data.SubmitChanges();
            return RedirectToAction("Index");
        }
        
    }
}