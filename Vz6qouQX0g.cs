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
            var sampleData = new
            {
                Message = "Hello from the randomly named ASP.NET Core Web API controller",
                Timestamp = DateTime.UtcNow,
                Status = "Success",
                RandomName = "Vz6qouQX0g"
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
                Name = $"Random Item {id}",
                Description = "This is a sample item from the random controller"
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
                Message = "Data received successfully in random controller",
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
                Message = $"Item {id} updated successfully in random controller",
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
                Message = $"Item {id} deleted successfully from random controller"
            };

            return Ok(response);
        }
    }
}