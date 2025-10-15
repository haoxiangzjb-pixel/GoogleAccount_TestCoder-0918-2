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
            var randomValue = new
            {
                Id = new Random().Next(1, 100),
                Name = "Random Item",
                CreatedAt = DateTime.UtcNow
            };
            
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var randomValue = new
            {
                Id = id,
                Name = $"Random Item {id}",
                CreatedAt = DateTime.UtcNow
            };
            
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            var result = new
            {
                Success = true,
                Message = "Data received successfully",
                ReceivedAt = DateTime.UtcNow
            };
            
            return Ok(result);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            var result = new
            {
                Success = true,
                Message = $"Item {id} updated successfully",
                UpdatedAt = DateTime.UtcNow
            };
            
            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var result = new
            {
                Success = true,
                Message = $"Item {id} deleted successfully",
                DeletedAt = DateTime.UtcNow
            };
            
            return Ok(result);
        }
    }
}