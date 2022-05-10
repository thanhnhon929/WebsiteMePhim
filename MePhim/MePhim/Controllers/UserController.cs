using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MePhim.Models;

namespace MePhim.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        dbPhimDataContext data = new dbPhimDataContext();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        ////[HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]

        public ActionResult DangKy(FormCollection f, NGUOIXEM nx)
        {
            var sHoTen = f["HoTen"];
            var sTaiKhoan = f["TaiKhoan"];
            var sMatKhau = f["MatKhau"];
            var sMatKhauNhapLai = f["MatKhauNL"];
            var sDiaChi = f["DiaChi"];
            var sEmail = f["Email"];
            var sDienThoai = f["DienThoai"];
            var dNgaySinh = String.Format("{0:MM/dd/yyyy}", f["NgaySinh"]);
           

            if (String.IsNullOrEmpty(sMatKhauNhapLai))
            {
                ViewData["err4"] = "Phải nhập lại mật khẩu";
            }
            else if (sMatKhau != sMatKhauNhapLai)
            {
                ViewData["err4"] = "Mật khẩu nhập lại không khớp";
            }

            else if (data.NGUOIXEMs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan) != null)
            {
                ViewBag.ThongBao = "Tên đăng nhập đã tồn tại";
            }
            else if (data.NGUOIXEMs.SingleOrDefault(n => n.Email == sEmail) != null)
            {
                ViewBag.ThongBao = "Email đã được sử dụng";
            }
            else if (ModelState.IsValid)
            {
                nx.HoTen = sHoTen;
                nx.TaiKhoan = sTaiKhoan;
                nx.MatKhau = sMatKhau;
                nx.Email = sEmail;
                nx.DiaChi = sDiaChi;
                nx.DienThoai = sDienThoai;
                nx.NgaySinh = DateTime.Parse(dNgaySinh);
                data.NGUOIXEMs.InsertOnSubmit(nx);
                data.SubmitChanges();
                return RedirectToAction("DangNhap");
            }
            return this.DangKy();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            int state = Convert.ToInt32(Request.QueryString["id"]);
            var sTenDN = f["TenDN"];
            var sMatKhau = f["MatKhau"];
            if (String.IsNullOrEmpty(sTenDN))
            {
                ViewData["Err1"] = "Bạn chưa đăng nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(sMatKhau))
            {
                ViewData["Err2"] = "Phải đăng nhập mật khẩu";
            }
            else
            {
               NGUOIXEM nx = data.NGUOIXEMs.SingleOrDefault(n => n.TaiKhoan == sTenDN && n.MatKhau == sMatKhau);
                if (nx != null)
                {
                    ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                    Session["TaiKhoan"] = nx;
                    

                        return RedirectToAction("Index", "Phim");
                   
                }
                else
                {
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }

            }

        
            return this.DangNhap();
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index", "Phim");
        }
        public ActionResult LoginPartial()
        {
            return View();
        }
    }
}