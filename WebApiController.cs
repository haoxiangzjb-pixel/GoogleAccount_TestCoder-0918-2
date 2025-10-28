using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleController : ControllerBase
    {
        private readonly ILogger<SampleController> _logger;

        public SampleController(ILogger<SampleController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var sampleData = new
            {
                Message = "Hello from ASP.NET Core Web API",
                Timestamp = DateTime.UtcNow,
                Status = "Success"
            };
            
            return Ok(sampleData);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var sampleItem = new
            {
                Id = id,
                Name = $"Sample Item {id}",
                Description = "This is a sample item from the API"
            };

            return Ok(sampleItem);
        }

        [HttpPost]
        public IActionResult Post([FromBody] dynamic requestData)
        {
            if (requestData == null)
            {
                return BadRequest("Request body cannot be empty");
            }

            var response = new
            {
                Message = "Data received successfully",
                ReceivedData = requestData,
                Id = new Random().Next(1, 1000)
            };

            return Ok(response);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] dynamic requestData)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var response = new
            {
                Message = $"Item {id} updated successfully",
                UpdatedData = requestData
            };

            return Ok(response);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var response = new
            {
                Message = $"Item {id} deleted successfully"
            };

            return Ok(response);
        }
    }
}