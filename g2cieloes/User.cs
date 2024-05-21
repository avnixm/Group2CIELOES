using System;

namespace g2cieloes
{
    internal class User
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int UserXP { get; set; }
        public int UserHearts { get; set; }
        public DateTime RegistrationDate { get; set; }
        public int OTPValue { get; set; }
    }
}