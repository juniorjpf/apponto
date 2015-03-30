using Apponto.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Apponto.Database
{
    public class UserDatabase
    {
        private string ConnectionString { get; set; }

        public UserDatabase(String connectionString)
        {
            this.ConnectionString = connectionString;
        }

        public User GetUser(String login)
        {
            //TODO: Criar conexao com banco.
            return new User() { Login = "Bruna", Password = "123" };
        }
    }
}
