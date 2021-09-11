using System;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace demo_status_backend.Controllers
{
    [ApiController]
    [Route("/")]
    public class RootHomeController : ControllerBase
    {
        private readonly ILogger<RootHomeController> _logger;

        public RootHomeController(ILogger<RootHomeController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public String Get()
        {
            return String.Concat("Greetings from ", Dns.GetHostName(), " under /");
        }
    }
}
