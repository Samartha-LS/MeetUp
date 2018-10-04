using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MeetUp.Entites;
using MeetUp.Models;

namespace MeetUp.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult Authenticate(MeetUp.Entites.Login loginModel)
        {
            MeetUpEntities db = new MeetUpEntities();
            {
                var userdetails = db.Logins.Where(x => x.EmployeeId == loginModel.EmployeeId && x.Password == loginModel.Password).FirstOrDefault();
                if(userdetails == null)
                {
                    loginModel.LoginErrorMessage = "Wrong Employee Id or Password";
                    return View("Index", loginModel);
                }
                else
                {
                    Session["EmployeeId"] = userdetails.EmployeeId;
                    return RedirectToAction("Index", "Appointment");
                }
            }
        }

        public ActionResult Logout()
        {
            int EmployeeId = (int)Session["EmployeeId"];
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }

        public bool Reset(string EmpId)
        {
            int EmpParse = int.Parse(EmpId);
            return true;
        }
    }
}