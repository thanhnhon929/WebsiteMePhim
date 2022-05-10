using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MePhim.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;


namespace MePhim.Areas.Admin.Controllers
{
    public class QLPhimController : Controller
    {
        dbPhimDataContext db = new dbPhimDataContext();
     
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(db.PHIMs.ToList().OrderBy(n => n.MaPhim).ToPagedList(iPageNum, iPageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs.ToList().OrderBy(n => n.TenTheLoai), "MaTheLoai", "TenTheLoai");
            ViewBag.MaNSX = new SelectList(db.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(PHIM phim, FormCollection f, HttpPostedFileBase fFileUpLoad)
        {
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs.ToList().OrderBy(n => n.TenTheLoai), "MaTheLoai", "TenTheLoai");
            ViewBag.MaNSX = new SelectList(db.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            if (fFileUpLoad == null)
            {
                ViewBag.ThongBao = "Hãy chọn ảnh bìa.";
                ViewBag.TenPhim = f["sTenSach"];
                ViewBag.MoTa = f["sMoTa"];
                ViewBag.MaTheLoai = new SelectList(db.THELOAIs.ToList().OrderBy(n => n.TenTheLoai), "MaTheLoai", "TenTheLoai", int.Parse(f["MaTheLoai"]));
                ViewBag.MaNSX = new SelectList(db.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX", int.Parse(f["MaNSX"]));
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var sFileName = Path.GetFileName(fFileUpLoad.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images"), sFileName);
                    VIDEO vd = new VIDEO();
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpLoad.SaveAs(path);
                    }
                    phim.MaPhim = int.Parse(f["sMaPhim"]);
                    phim.TenPhim = f["sTenPhim"];
                    phim.MoTa = f["sMoTa"].Replace("<p>", "").Replace("</p>", "\n");
                    phim.AnhBia = sFileName;
                    phim.NgayCapNhat = Convert.ToDateTime(f["dNgayCapNhat"]);
                    phim.MaTheLoai = int.Parse(f["MaTheLoai"]);
                    phim.MaNSX = int.Parse(f["MaNSX"]);
                    phim.PhimVip = int.Parse(f["PhimVip"]);
                    db.PHIMs.InsertOnSubmit(phim);
                    db.SubmitChanges();
                    vd.MaPhim = phim.MaPhim;
                    vd.TenPhim = phim.TenPhim;
                    vd.MoTa = phim.MoTa;
                    vd.AnhBia = phim.AnhBia;
                    vd.NgayCapNhat = phim.NgayCapNhat;
                    vd.VD = f["sVD"];
                    db.VIDEOs.InsertOnSubmit(vd);
                    db.SubmitChanges();
                    return RedirectToAction("Index");
                }
                return View();
            }
        }

        public ActionResult Details(int id)
        {
            var sach = db.PHIMs.SingleOrDefault(n => n.MaPhim == id);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var sach = db.PHIMs.SingleOrDefault(n => n.MaPhim == id);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int id, FormCollection f)
        {
            var phim = db.PHIMs.SingleOrDefault(n => n.MaPhim == id);
            if (phim == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var xp = db.VIDEOs.SingleOrDefault(n=>n.MaPhim==id);
                if (xp!= null)
            {
                db.VIDEOs.DeleteOnSubmit(xp);
                db.SubmitChanges();
            }
               
        
            
            var xoaphim = db.PHIMs.Where(vs => vs.MaPhim == id).ToList();
            if (xoaphim != null)
            {
                db.PHIMs.DeleteAllOnSubmit(xoaphim);
                db.SubmitChanges();
            }
            db.PHIMs.DeleteOnSubmit(phim);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var phim = db.PHIMs.SingleOrDefault(n => n.MaPhim == id);
            if (phim == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs.ToList().OrderBy(n => n.TenTheLoai), "MaTheLoai", "TenTheLoai", phim.MaTheLoai);
            ViewBag.MaNSX = new SelectList(db.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX", phim.MaNSX);
            return View(phim);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var phim = db.PHIMs.SingleOrDefault(n => n.MaPhim == int.Parse(f["iMaPhim"]));
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs.ToList().OrderBy(n => n.TenTheLoai), "MaTheLoai", "TenTheLoai", phim.MaTheLoai);
            ViewBag.MaNSX = new SelectList(db.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX", phim.MaNSX);
            if (ModelState.IsValid)
            {
                if (fFileUpload != null)
                {
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images"), sFileName);
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);

                    }
                    phim.AnhBia = sFileName;
                }
                phim.TenPhim = f["sTenPhim"];
                phim.MoTa = f["sMoTa"].Replace("<p>", "").Replace("</p>", "\n");
                phim.NgayCapNhat = Convert.ToDateTime(f["dNgayCapNhat"]);
                phim.MaTheLoai = int.Parse(f["MaTheLoai"]);
                phim.MaNSX = int.Parse(f["MaNSX"]);
                phim.PhimVip = int.Parse(f["PhimVip"]);
                db.SubmitChanges();
                return RedirectToAction("Index");
            }
            return View(phim);
        }
    }
}