using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleDataController : ControllerBase
    {
        private readonly ILogger<SampleDataController> _logger;

        public SampleDataController(ILogger<SampleDataController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var sampleData = new[] {
                new { Id = 1, Name = "Sample 1", Value = 100 },
                new { Id = 2, Name = "Sample 2", Value = 200 },
                new { Id = 3, Name = "Sample 3", Value = 300 }
            };
            return Ok(sampleData);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be greater than zero");
            }

            var item = new { Id = id, Name = $"Sample {id}", Value = id * 100 };
            return Ok(item);
        }

        [HttpPost]
        public IActionResult Post([FromBody] dynamic data)
        {
            _logger.LogInformation("Creating new sample data");
            
            var result = new { 
                Success = true, 
                Message = "Sample data created successfully",
                CreatedAt = DateTime.UtcNow,
                Data = data
            };
            return Ok(result);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] dynamic data)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be greater than zero");
            }

            _logger.LogInformation($"Updating sample data with ID: {id}");
            
            var result = new { 
                Success = true, 
                Message = $"Sample data {id} updated successfully",
                UpdatedAt = DateTime.UtcNow,
                Data = data
            };
            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be greater than zero");
            }

            _logger.LogInformation($"Deleting sample data with ID: {id}");
            
            var result = new { 
                Success = true, 
                Message = $"Sample data {id} deleted successfully",
                DeletedAt = DateTime.UtcNow
            };
            return Ok(result);
        }
    }
}