using System;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace demo_status_backend.Controllers
{
    [ApiController]
    [Route("/status")]
    public class HomeController : ControllerBase
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public String Get()
        {
            return String.Concat("Greetings from ", Dns.GetHostName());
        }
    }
}
