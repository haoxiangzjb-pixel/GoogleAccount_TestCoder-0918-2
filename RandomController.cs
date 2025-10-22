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
            var randomValue = new
            {
                Id = Guid.NewGuid(),
                Value = new Random().Next(1, 100),
                Timestamp = DateTime.UtcNow
            };
            return Ok(randomValue);
        }

        // GET: api/random/{id}
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive integer");
            }

            var randomValue = new
            {
                Id = id,
                Value = new Random().Next(1, 100),
                Timestamp = DateTime.UtcNow
            };
            return Ok(randomValue);
        }

        // POST: api/random
        [HttpPost]
        public IActionResult Post([FromBody] RandomRequest request)
        {
            if (request == null)
            {
                return BadRequest("Request body cannot be null");
            }

            var result = new
            {
                RequestedValue = request.Input,
                GeneratedValue = new Random().Next(1, 100),
                ProcessedAt = DateTime.UtcNow
            };
            return Ok(result);
        }

        // PUT: api/random/{id}
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RandomRequest request)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive integer");
            }
            
            if (request == null)
            {
                return BadRequest("Request body cannot be null");
            }

            var result = new
            {
                Id = id,
                UpdatedValue = request.Input,
                ModifiedAt = DateTime.UtcNow
            };
            return Ok(result);
        }

        // DELETE: api/random/{id}
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive integer");
            }

            var result = new
            {
                Id = id,
                Deleted = true,
                DeletedAt = DateTime.UtcNow
            };
            return Ok(result);
        }
    }

    public class RandomRequest
    {
        public string Input { get; set; }
    }
}