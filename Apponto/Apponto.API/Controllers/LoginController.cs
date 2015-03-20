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
        [HttpGet]
        public HttpResponseMessage GetLogin()
        {
            return Request.CreateResponse((HttpStatusCode)200, "GetLoginSucesso");
        }

        [HttpPost]
        public HttpResponseMessage PostTest(int id)
        {
            return Request.CreateResponse((HttpStatusCode)200, "PostLoginSucesso" + id);
        }

        [HttpPut]
        public HttpResponseMessage PutTest(int id)
        {
            return Request.CreateResponse((HttpStatusCode)200, "PutLoginSucesso" + id);
        }

        [HttpDelete]
        public HttpResponseMessage DeleteTest(int id)
        {
            return Request.CreateResponse((HttpStatusCode)200, "DeleteLoginSucesso" + id);
        }
    }
}
