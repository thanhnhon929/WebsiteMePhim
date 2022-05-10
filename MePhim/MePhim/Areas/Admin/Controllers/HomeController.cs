using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MePhim.Models;
namespace MePhim.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        dbPhimDataContext db = new dbPhimDataContext();
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("IndexCheck", "Home");
            }
            return View();
        }

        public ActionResult IndexCheck()
        {
            return View();
        }
        public ActionResult IndexView()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            return View();
        }
        public ActionResult LoginCheckPartial()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            var sTenDN = f["UserName"];
            var sMatKhau = f["Password"];
            ADMIN ad = db.ADMINs.SingleOrDefault(n => n.TenDN == sTenDN && n.MatKhau == sMatKhau);
            if (ad != null)
            {
                Session["Admin"] = ad;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng!";

            }
            return View();
        }
        public ActionResult LoginAdminPartial()
        {
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["Admin"] = null;
            return RedirectToAction("Login", "Home");
        }
    }
}