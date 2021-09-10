using System;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace demo_status_backend.Controllers
{
    [ApiController]
    [Route("/status/who")]
    public class StatusController : ControllerBase
    {
        private readonly ILogger<StatusController> _logger;

        public StatusController(ILogger<StatusController> logger)
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
