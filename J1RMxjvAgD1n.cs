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
                Name = $"Random Item {new Random().Next(1, 1000)}",
                Timestamp = DateTime.UtcNow 
            };
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
                return BadRequest("ID must be a positive number");

            var randomValue = new { 
                Id = id, 
                Name = $"Random Item {id}",
                Value = new Random().NextDouble() * 100 
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            var response = new { 
                Message = "Data received successfully",
                ReceivedAt = DateTime.UtcNow,
                Processed = true
            };
            return CreatedAtAction(nameof(GetById), new { id = new Random().Next(1, 100) }, response);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            if (id <= 0)
                return BadRequest("ID must be a positive number");

            var response = new { 
                Message = $"Item {id} updated successfully",
                UpdatedAt = DateTime.UtcNow,
                Id = id
            };
            return Ok(response);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
                return BadRequest("ID must be a positive number");

            var response = new { 
                Message = $"Item {id} deleted successfully",
                DeletedAt = DateTime.UtcNow
            };
            return Ok(response);
        }
    }
}