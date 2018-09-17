using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MeetUp.Models
{
    public class ViewAppointment
    {
        public DateTime? CreatedOn { get; set; }
        public int? FromEmpId { get; set; }
        public int? ToEmpId { get; set; }
        public int AppointmentId { get; set; }
        public string FromEmpName { get; set; }
        public string FromDate { get; set; }
        public TimeSpan? FromTime { get; set; }
        public TimeSpan? ToTime { get; set; }
        public string Subject { get; set; }
        public string ToMailId { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string StatusName { get; set; }
        public string ToEmplName { get; set; }
        public string FromMailId { get; set; }
        public int? StatusId { get; set; }
    }
}