using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace g2cieloes.Admin
{
    public class Admin
    {
        public int AdminId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public DateTime RegistrationDate { get; set; }
        public bool IsActivated { get; set; }
        public string Role { get; set; }
        public DateTime? LastLogin { get; set; }


        public static int LessonID { get; set; }
    }
}