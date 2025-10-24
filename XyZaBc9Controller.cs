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
                Name = "Random Item",
                Timestamp = DateTime.UtcNow 
            };
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var randomValue = new { 
                Id = id, 
                Name = $"Random Item {id}",
                Value = new Random().NextDouble() * 100 
            };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] RandomInputModel model)
        {
            if (model == null)
            {
                return BadRequest("Model cannot be null");
            }

            var result = new {
                Id = new Random().Next(1, 1000),
                Name = model.Name,
                ProcessedAt = DateTime.UtcNow,
                Success = true
            };

            return CreatedAtAction(nameof(GetById), new { id = result.Id }, result);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RandomInputModel model)
        {
            if (id <= 0 || model == null)
            {
                return BadRequest("Invalid parameters");
            }

            var result = new {
                Id = id,
                Name = model.Name,
                UpdatedAt = DateTime.UtcNow,
                Success = true
            };

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            // In a real application, you would delete the actual resource
            var result = new {
                Id = id,
                Deleted = true,
                DeletedAt = DateTime.UtcNow
            };

            return Ok(result);
        }
    }

    public class RandomInputModel
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
    }
}