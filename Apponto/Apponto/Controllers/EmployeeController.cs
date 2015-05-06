using Apponto.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Apponto.Controllers
{
    public class EmployeeController : Controller
    {
        public ActionResult Main()
        {
            Employee employee = new Employee()
            {
                Id = 1,
                Name = "teste",
                Role = "tester"
            };

            return View(employee);
        }
    }
}
