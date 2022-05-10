using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MePhim.Models;

namespace MePhim.Controllers
{
    public class XemController : Controller
    {
        dbPhimDataContext db = new dbPhimDataContext();
        public ActionResult XemNgay(int id)
        {
            int i;
            var phimvip = db.PHIMs.SingleOrDefault(n => n.MaPhim == id && n.PhimVip == 1);
            if (phimvip != null)
            {
                i = 0;
            }
            else
            {
                i = 1;
            }
            var phim = from s in db.VIDEOs where s.MaPhim == id select s;
            if (i == 0 && Session["TaiKhoan"] == null)
            {
                return Redirect("~/User/DangNhap?id=2");
            }
            return View(phim);
        }
    }
}