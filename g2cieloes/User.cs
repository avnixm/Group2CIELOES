using System;

namespace g2cieloes
{
    internal class User
    {
        public int user_id { get; internal set; }
        public string user_fname { get; internal set; }
        public DateTime registration_date { get; internal set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int OTPValue { get; set; }
    }
}