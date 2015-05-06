using Apponto.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Apponto.Model
{
    public class EmployeeContext : DbContext
    {
        public EmployeeContext()
            : base("name=AppontoConnectionString")
        {          
        }

        public DbSet<Employee> Employee { get; set; }
    }
}