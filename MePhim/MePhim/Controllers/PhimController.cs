using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MePhim.Models;
using PagedList;
using PagedList.Mvc;

namespace MePhim.Controllers
{
    public class PhimController : Controller
    {
        // GET: Phim
        dbPhimDataContext data = new dbPhimDataContext();


        //PhimHay

        private List<PHIM> LayPhimHay(int count)
        {
            return data.PHIMs.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }
        public ActionResult Index(int ? paged)
        {
            int iSize = 6;
            int iPageNum = (paged ?? 1);
            var listPhimHay = data.PHIMs.OrderByDescending(a => a.NgayCapNhat).ToList(); 
            return View(listPhimHay.ToPagedList(iPageNum, iSize));
            
        }


        //Navbar
        public ActionResult NavbarPartial()
        {
            var listPhim = from cd in data.PHIMs select cd;
            return PartialView(listPhim);
        }



        //PhimLe

        public ActionResult PhimLePartial()
        {
            
            var listPhimLe = from pl in data.PHIMLEs select pl;
            return PartialView(listPhimLe);
        }
        public ActionResult PhimLe( int? page)
        {
           
            int iSize = 6;
            int iPageNum = (page ?? 1);
            var pl = from s in data.PHIMLEs select s;
            return View(pl.ToPagedList(iPageNum, iSize));
        }


        //phim bộ
        public ActionResult PhimBoPartial()
        {
            var listPhimBo = from pb in data.PHIMBOs select pb;
            return PartialView(listPhimBo);
        }
        public ActionResult PhimBo( int? page)
        {

            int iSize = 6;
            int iPageNum = (page ?? 1);
            var pb = from s in data.PHIMBOs select s;
            return View(pb.ToPagedList(iPageNum, iSize));
        }



        // phim hay
        public ActionResult PhimHay( int? page)
        {

            int iSize = 6;
            int iPageNum = (page ?? 1);
            var ph = from s in data.PHIMHAYs select s;
            return View(ph.ToPagedList(iPageNum, iSize));
        }



        //chi tiết phim
        public ActionResult ChiTietPhim(int id)
        {
            var phim = from s in data.PHIMs where s.MaPhim==id select s;
            return View(phim);
        }


        //Phim CHieuRap
        public ActionResult PhimCRPartial()
        {
            var listPhimCR = from cr in data.CHIEURAPs select cr;
            return PartialView(listPhimCR);
        }
        public ActionResult PhimCR(int? page)
        {
            
            int iSize = 6;
            int iPageNum = (page ?? 1);
            var cr = from s in data.CHIEURAPs  select s;
            return View(cr.ToPagedList(iPageNum, iSize));
        }

        //Top Phim
        public ActionResult TopPhimPartial()
        {
            var listTopPhim = from tp in data.PHIMHAYs select tp;
            return PartialView(listTopPhim);
        }
       

        // Phim Xem Nhieu
        public ActionResult PhimXemNhieu()
        {
            
            var list = (from x in data.PHIMs orderby x.LuotXem descending select x).Take(12);
            return View(list);
        }
        private List<PHIMHAY> LayPhimXemNhieu(int count)
        {
            return data.PHIMHAYs.OrderByDescending(a => a.MaPhimHay).Take(count).ToList();
        }
    }
}
