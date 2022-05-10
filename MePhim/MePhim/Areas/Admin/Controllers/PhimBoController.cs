using MePhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace MePhim.Areas.Admin.Controllers
{
    public class PhimBoController : Controller
    {

        dbPhimDataContext data = new dbPhimDataContext();

        public ActionResult Index()
        {
            return View(from pb in data.PHIMBOs select pb);
        }
        public ActionResult Details(int id)
        {
            var pb = data.PHIMBOs.SingleOrDefault(n => n.MaPhimBo == id);
            if (pb == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(pb);
        }
        public PHIMBO GetPB(int id)
        {
            return (data.PHIMBOs.OrderBy(n => n.TenPhimBo).Where(n => n.MaPhimBo == id).SingleOrDefault());
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var pb = data.PHIMBOs.SingleOrDefault(n => n.MaPhimBo == id);
            return View(pb);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f )
        {
            var pb = data.PHIMBOs.SingleOrDefault(n => n.MaPhimBo == int.Parse(f["iMaPhimBo"]));
            if (ModelState.IsValid)
            {
                pb.TenPhimBo = f["sTenPhimBo"];
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
            return View(GetPB(id));
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection f)
        {
            var pb = GetPB(id);
            if (pb == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            data.PHIMBOs.DeleteOnSubmit(pb);
            data.SubmitChanges();
            return RedirectToAction("Index");
        }
        
       
    }
}