using Apponto.Database;
using Apponto.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Apponto.Service
{
    public class UserService
    {
        private UserDatabase userDatabase;

        public UserService(String connectionString) {
            userDatabase = new UserDatabase(connectionString);
        }

        public bool Authenticate(String login, String password)
        {
            User user = userDatabase.GetUser(login);

            //TODO: Tornar campo password criptografado.
            return user.Password == password;
        }
    }
}
