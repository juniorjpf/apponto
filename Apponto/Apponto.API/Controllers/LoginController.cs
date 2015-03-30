using Apponto.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Apponto.API.Controllers
{
    public class LoginController : ApiController
    {
        //Métodos http: http://www.restapitutorial.com/lessons/httpmethods.html
        //Código http: http://en.wikipedia.org/wiki/List_of_HTTP_status_codes

        //The HTTP GET method is used to retrieve (or read) a representation of a resource
        [HttpGet]
        public HttpResponseMessage Login(String login, String password)
        {
            //TODO: Recuperar ConnectionString do WebConfig.
            UserService userService = new UserService("bla");
            
            if(userService.Authenticate(login, password))
                return Request.CreateResponse((HttpStatusCode)200, "OK");
            else
                return Request.CreateResponse((HttpStatusCode)401, "Unauthorized");
        }

        //The POST verb is most-often utilized for creation of new resources
        [HttpPost]
        public HttpResponseMessage PostTest(int id)
        {
            return Request.CreateResponse((HttpStatusCode)200, "PostLoginSucesso" + id);
        }

        //PUT is most-often utilized for update capabilities
        [HttpPut]
        public HttpResponseMessage PutTest(int id)
        {
            return Request.CreateResponse((HttpStatusCode)200, "PutLoginSucesso" + id);
        }

        //DELETE is used to delete a resource
        [HttpDelete]
        public HttpResponseMessage DeleteTest(int id)
        {
            return Request.CreateResponse((HttpStatusCode)200, "DeleteLoginSucesso" + id);
        }
    }
}
