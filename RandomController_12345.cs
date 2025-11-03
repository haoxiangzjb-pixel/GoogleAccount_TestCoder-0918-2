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
            var result = new
            {
                Message = "Hello from the Random Controller!",
                Timestamp = DateTime.UtcNow,
                RandomValue = new Random().Next(1, 100)
            };
            
            return Ok(result);
        }

        // GET: api/random/5
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var result = new
            {
                Id = id,
                Name = $"Item {id}",
                Description = $"This is a sample item with ID {id}"
            };
            
            return Ok(result);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            var result = new
            {
                Success = true,
                Message = "Data received successfully",
                ReceivedData = data,
                Id = new Random().Next(1, 1000)
            };
            
            return CreatedAtAction(nameof(GetById), new { id = result.Id }, result);
        }

        // PUT: api/random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            var result = new
            {
                Success = true,
                Message = $"Item {id} updated successfully",
                Id = id,
                UpdatedData = data
            };
            
            return Ok(result);
        }

        // DELETE: api/random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = new
            {
                Success = true,
                Message = $"Item {id} deleted successfully"
            };
            
            return Ok(result);
        }
    }
}