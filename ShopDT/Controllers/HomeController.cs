using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopDT.Controllers
{// gio minh keu voi thay chi co lam front-end tham khao tu source code nay thoi, chuc nang javascrips minh se chuyen hoa lai viet thanh c# sau trong controller, la minh se doi cau truc va them razor trong cshtml, em hieu dc no k?, hieu hieu a
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult tintuc()
        {
            return View();
        }
        public ActionResult chitietsanpham()
        {
            return View();
        }
        public ActionResult giohang()
        {
            return View();
        }
        public ActionResult lienhe()
        {
            return View();
        }
        public ActionResult nguoidung()
        {
            return View();
        }
        public ActionResult tuyendung()
        {
            return View();
        }
        public ActionResult trungtambaohanh()
        {
            return View();
        }
        public ActionResult gioithieu()
        {
            return View();
        }
        [HttpGet]
        [HttpPost]
        public ActionResult Login()
        {
            DatabasePhone db = new DatabasePhone();
            return View();
        }
    }
}