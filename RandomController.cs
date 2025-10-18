using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        private readonly ILogger<RandomController> _logger;

        public RandomController(ILogger<RandomController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var randomValue = new { 
                Id = new Random().Next(1, 100), 
                Message = "This is a random value from the API" 
            };
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomValue = new { 
                Id = id, 
                Value = new Random().Next(1, 1000),
                Timestamp = DateTime.UtcNow 
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            _logger.LogInformation("POST request received with data");
            return Ok(new { 
                Message = "Data received successfully", 
                ReceivedAt = DateTime.UtcNow 
            });
        }
    }
}