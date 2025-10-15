using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
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
                Name = "Random Item", 
                Timestamp = DateTime.UtcNow 
            };
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomValue = new { 
                Id = id, 
                Name = $"Random Item {id}", 
                Value = new Random().NextDouble() 
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object value)
        {
            _logger.LogInformation("POST request received");
            return CreatedAtAction(nameof(Get), new { id = new Random().Next(1, 100) }, value);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            _logger.LogInformation($"PUT request received for id: {id}");
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation($"DELETE request received for id: {id}");
            return NoContent();
        }
    }
}