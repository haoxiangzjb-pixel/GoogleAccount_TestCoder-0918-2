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

        // GET: api/random
        [HttpGet]
        public IActionResult Get()
        {
            var randomValue = new { 
                id = new Random().Next(1, 100), 
                message = "This is a random value from the API", 
                timestamp = DateTime.UtcNow 
            };
            return Ok(randomValue);
        }

        // GET: api/random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomValue = new { 
                id = id, 
                value = new Random().Next(1, 100), 
                description = $"Random value for ID {id}" 
            };
            return Ok(randomValue);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] RandomInputModel input)
        {
            var result = new { 
                id = new Random().Next(1, 100), 
                input = input,
                processedAt = DateTime.UtcNow
            };
            return CreatedAtAction(nameof(Get), new { id = result.id }, result);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RandomInputModel input)
        {
            var updatedValue = new { 
                id = id, 
                input = input,
                updated = true,
                modifiedAt = DateTime.UtcNow
            };
            return Ok(updatedValue);
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = new { 
                id = id, 
                deleted = true,
                deletedAt = DateTime.UtcNow
            };
            return Ok(result);
        }
    }

    public class RandomInputModel
    {
        public string? Name { get; set; }
        public int Value { get; set; }
        public string? Description { get; set; }
    }
}