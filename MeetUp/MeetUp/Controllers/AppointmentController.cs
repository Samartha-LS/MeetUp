using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MeetUp.Models;
using MeetUp.Entites;
using System.Net.Mail;
using System.Net;

namespace MeetUp.Controllers
{
    public class AppointmentController : Controller
    {

        MeetUpEntities dbcontext = new MeetUpEntities();
        // GET: Appointment
        public ActionResult Index()
        {
            return View();
        }

        public bool ReserveMeet(string empid, string date, string fromtime, string totime, string Remark)
        {
            DateTime dateparse = DateTime.Parse(date);
            TimeSpan fromtimeparse = TimeSpan.Parse(fromtime);
            TimeSpan totimeparse = TimeSpan.Parse(totime);
            int EmployeeId = (int)Session["EmployeeId"];
            int emp = int.Parse(empid);
            var result = dbcontext.Appointments.Where(a => (a.ToEmployeeId == emp || a.FromEmployeeId == EmployeeId) && (a.StatusId == 1 || a.StatusId == 2 || a.StatusId == 5) && a.Date == dateparse && ((a.FromTime <= fromtimeparse && a.ToTime >= fromtimeparse) || (a.FromTime <= totimeparse && a.ToTime >= totimeparse) || (a.FromTime >= fromtimeparse && a.ToTime <= totimeparse))).ToList();
            if (result.Count() == 0)
            {
                var time = DateTime.Now;
                Appointment a = new Appointment();
                a.FromEmployeeId = EmployeeId;
                a.ToEmployeeId = emp;
                a.Date = dateparse;
                a.FromTime = fromtimeparse;
                a.ToTime = totimeparse;
                a.Remark = Remark;
                a.CreatedOn = time;
                a.ModifiedOn = time;
                a.StatusId = 1;
                dbcontext.Appointments.Add(a);
                dbcontext.SaveChanges();
                var name = (from e in dbcontext.EmployeeDetails
                            where e.EmployeeId == EmployeeId
                            select e).FirstOrDefault();
                var mail = (from e in dbcontext.EmployeeDetails
                            where e.EmployeeId == emp
                            select e).FirstOrDefault();
                var reciever = mail.EmployeeMailId;
                var senderEmail = new MailAddress("cabbieptt@gmail.com", "MeetUp");
                var receiverEmail = new MailAddress(reciever, "Receiver");
                var password = "cabbie123";
                var sub = "Appointment Request from " + name.EmployeeName;
                var body = "Hey " + mail.EmployeeName + ", there is an Appointment request from " + name.EmployeeName + "\n\nDate: " + date + "\nTime: " + fromtime + " to: " + totime + "\n\nSubject of meet : " + Remark +"\n\nTo accept or decline please visit our MeetUp application";
                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(senderEmail.Address, password)
                };
                MailMessage mailMessage = new MailMessage();
                mailMessage.Subject = sub;
                mailMessage.Body = body;
                smtp.Send("cabbieptt@gmail.com", reciever, sub, body);
                return true;
            }
            else
            {
                return false;
            }
        }

        public ActionResult Reserve()
        {
            try
            {
                int EmployeeId = (int)Session["EmployeeId"];
                ViewBag.EmpId = new SelectList(dbcontext.EmployeeDetails.Where(e => e.EmployeeId != EmployeeId), "EmployeeId", "EmployeeName");
            }
            catch { }
            return PartialView();
        }

        public ActionResult ViewAppoinement()
        {
            DateTime dt = DateTime.Today;
            int Emp = (int)Session["EmployeeId"];
            List<ViewAppointment> ViewMeetUp = (from a in dbcontext.Appointments
                                                join e in dbcontext.EmployeeDetails on a.FromEmployeeId equals e.EmployeeId
                                                join e2 in dbcontext.EmployeeDetails on a.ToEmployeeId equals e2.EmployeeId
                                                join s in dbcontext.Status on a.StatusId equals s.StatusId
                                                where ((a.ToEmployeeId == Emp || a.FromEmployeeId == Emp) && a.Date >= dt && (a.StatusId == 1 || a.StatusId == 2 || a.StatusId == 5))
                                                select new ViewAppointment {StatusId=a.StatusId, StatusName=s.Status1, FromEmpId = a.FromEmployeeId, FromMailId = e.EmployeeMailId ,FromEmpName = e.EmployeeName, FromDate = a.Date.ToString(), FromTime = a.FromTime, ToTime = a.ToTime, Subject = a.Remark, AppointmentId = a.AppointmentId, ToMailId = e2.EmployeeMailId, ToEmpId = a.ToEmployeeId ,ToEmplName = e2.EmployeeName}).OrderBy(a=>a.FromDate).ToList();
            return PartialView(ViewMeetUp);
        }

        public string Cancel(string EmpName, string appointmentid, string MailId, string reason, string FromEmp, string ToEmp, string Date, string From, string To, string Subject)
        {
            var time = DateTime.Now;
            int Emp = (int)Session["EmployeeId"];
            int fromempid = int.Parse(FromEmp);
            int toempid = int.Parse(ToEmp);
            int appid = int.Parse(appointmentid);
            string Result = "Failed";
            Appointment existing = dbcontext.Appointments.Where(e => e.AppointmentId == appid).FirstOrDefault();
            existing.StatusId = 4;
            existing.Remark = reason;
            existing.ModifiedOn = time;
            var res = dbcontext.SaveChanges();
            var name = (from e in dbcontext.EmployeeDetails
                        where e.EmployeeId == Emp
                        select e).FirstOrDefault();
            var reciever = MailId;
            var senderEmail = new MailAddress("cabbieptt@gmail.com", "MeetUp");
            var receiverEmail = new MailAddress(reciever, "Receiver");
            var password = "cabbie123";
            var sub = "Appointment cancelled by " + name.EmployeeName;
            var body = "Hey " + EmpName + ", your Appointment was cancelled by " + name.EmployeeName + "\nReason for Cancellation: " + reason + "\n\nWhich was scheduled on: " + Date + "\nFrom Time: " + From + " to: " + To + "\n\nSubject of meet was: " + Subject;
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(senderEmail.Address, password)
            };
            MailMessage mailMessage = new MailMessage();
            mailMessage.Subject = sub;
            mailMessage.Body = body;
            smtp.Send("cabbieptt@gmail.com", reciever, sub, body);
            if (res > 0)
            {
                return (EmpName);
            }
            return (Result);
        }

        public string Decline(string EmpName, string appointmentid, string MailId, string reason, string FromEmp, string ToEmp, string Date, string From, string To, string Subject)
        {
            var time = DateTime.Now;
            int Emp = (int)Session["EmployeeId"];
            int fromempid = int.Parse(FromEmp);
            int toempid = int.Parse(ToEmp);
            int appid = int.Parse(appointmentid);
            string Result = "Failed";
            Appointment existing = dbcontext.Appointments.Where(e => e.AppointmentId == appid).FirstOrDefault();
            existing.StatusId = 3;
            existing.Remark = reason;
            existing.ModifiedOn = time;
            var res = dbcontext.SaveChanges();
            var name = (from e in dbcontext.EmployeeDetails
                        where e.EmployeeId == Emp
                        select e).FirstOrDefault();
            var reciever = MailId;
            var senderEmail = new MailAddress("cabbieptt@gmail.com", "MeetUp");
            var receiverEmail = new MailAddress(reciever, "Receiver");
            var password = "cabbie123";
            var sub = "Appointment declined by " + name.EmployeeName;
            var body = "Hey " + EmpName + ", your Appointment was declined by " + name.EmployeeName + "\nReason for Cancellation: " + reason + "\n\nWhich was scheduled on: " + Date + "\nFrom Time: " + From + " to: " + To + "\n\nSubject of meet was: " + Subject;
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(senderEmail.Address, password)
            };
            MailMessage mailMessage = new MailMessage();
            mailMessage.Subject = sub;
            mailMessage.Body = body;
            smtp.Send("cabbieptt@gmail.com", reciever, sub, body);
            if (res > 0)
            {
                return (EmpName);
            }
            return (Result);
        }

        public string Accept(string EmpName, string appointmentid, string MailId, string FromEmp, string ToEmp, string Date, string From, string To, string Subject)
        {
            var time = DateTime.Now;
            int Emp = (int)Session["EmployeeId"];
            int fromempid = int.Parse(FromEmp);
            int toempid = int.Parse(ToEmp);
            int appid = int.Parse(appointmentid);
            string Result = "Failed";
            Appointment existing = dbcontext.Appointments.Where(e => e.AppointmentId == appid).FirstOrDefault();
            existing.StatusId = 2;
            existing.ModifiedOn = time;
            var res = dbcontext.SaveChanges();
            var name = (from e in dbcontext.EmployeeDetails
                        where e.EmployeeId == Emp
                        select e).FirstOrDefault();
            var reciever = MailId;
            var senderEmail = new MailAddress("cabbieptt@gmail.com", "MeetUp");
            var receiverEmail = new MailAddress(reciever, "Receiver");
            var password = "cabbie123";
            var sub = "Appointment Accepted by " + name.EmployeeName;
            var body = "Hey " + EmpName + ", your Appointment was accepted by " + name.EmployeeName + "\n\nScheduled on: " + Date + "\nFrom Time: " + From + " to: " + To + "\n\nSubject of meeting: " + Subject;
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(senderEmail.Address, password)
            };
            MailMessage mailMessage = new MailMessage();
            mailMessage.Subject = sub;
            mailMessage.Body = body;
            smtp.Send("cabbieptt@gmail.com", reciever, sub, body);
            if (res > 0)
            {
                return (EmpName);
            }
            return (Result);
        }

        public ActionResult ViewPastAppointment()
        {
            DateTime dt = DateTime.Today;
            int Emp = (int)Session["EmployeeId"];
            List<ViewAppointment> ViewMeetUp = (from a in dbcontext.Appointments
                                                join e in dbcontext.EmployeeDetails on a.FromEmployeeId equals e.EmployeeId
                                                join e2 in dbcontext.EmployeeDetails on a.ToEmployeeId equals e2.EmployeeId
                                                join s in dbcontext.Status on a.StatusId equals s.StatusId
                                                where ((a.ToEmployeeId == Emp || a.FromEmployeeId == Emp) && a.Date < dt && (a.StatusId == 2 || a.StatusId == 5))
                                                select new ViewAppointment { StatusId = a.StatusId, StatusName = s.Status1, FromEmpId = a.FromEmployeeId, FromMailId = e.EmployeeMailId, FromEmpName = e.EmployeeName, FromDate = a.Date.ToString(), FromTime = a.FromTime, ToTime = a.ToTime, Subject = a.Remark, AppointmentId = a.AppointmentId, ToMailId = e2.EmployeeMailId, ToEmpId = a.ToEmployeeId, ToEmplName = e2.EmployeeName }).OrderBy(a => a.FromDate).ToList();
            return PartialView(ViewMeetUp);
        }

        public ActionResult ViewCancelledAppointment()
        {
            int Emp = (int)Session["EmployeeId"];
            List<ViewAppointment> ViewMeetUp = (from a in dbcontext.Appointments
                                                join e in dbcontext.EmployeeDetails on a.FromEmployeeId equals e.EmployeeId
                                                join e2 in dbcontext.EmployeeDetails on a.ToEmployeeId equals e2.EmployeeId
                                                join s in dbcontext.Status on a.StatusId equals s.StatusId
                                                where ((a.ToEmployeeId == Emp || a.FromEmployeeId == Emp) && (a.StatusId == 3 || a.StatusId == 4))
                                                select new ViewAppointment { StatusId = a.StatusId, StatusName = s.Status1, FromEmpId = a.FromEmployeeId, FromMailId = e.EmployeeMailId, FromEmpName = e.EmployeeName, FromDate = a.Date.ToString(), FromTime = a.FromTime, ToTime = a.ToTime, Subject = a.Remark, AppointmentId = a.AppointmentId, ToMailId = e2.EmployeeMailId, ToEmpId = a.ToEmployeeId, ToEmplName = e2.EmployeeName }).OrderBy(a => a.FromDate).ToList();
            return PartialView(ViewMeetUp);
        }

        public ActionResult WriteMail()
        {
            try
            {
                int EmployeeId = (int)Session["EmployeeId"];
                ViewBag.EmpId = new SelectList(dbcontext.EmployeeDetails.Where(e => e.EmployeeId != EmployeeId), "EmployeeId", "EmployeeName");
            }
            catch { }
            return PartialView();
        }

        public bool SendMail(string To, string Subject, string Body)
        {
            int Emp = (int)Session["EmployeeId"];
            int ToParse = int.Parse(To);
            var mail = (from e in dbcontext.EmployeeDetails
                        where e.EmployeeId == ToParse
                        select e).FirstOrDefault();
            var name = (from e in dbcontext.EmployeeDetails
                        where e.EmployeeId == Emp
                        select e).FirstOrDefault();
            var reciever = mail.EmployeeMailId;
            var senderEmail = new MailAddress("cabbieptt@gmail.com", "MeetUp");
            var receiverEmail = new MailAddress(reciever, "Receiver");
            var password = "cabbie123";
            var sub = Subject;
            var body = Body + "\n\nRegards,\n" + name.EmployeeName + "\n" + name.EmployeeMailId;
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(senderEmail.Address, password)
            };
            MailMessage mailMessage = new MailMessage();
            mailMessage.Subject = sub;
            mailMessage.Body = body;
            smtp.Send("cabbieptt@gmail.com", reciever, sub, body);
            return true;
        }
    }
}
        