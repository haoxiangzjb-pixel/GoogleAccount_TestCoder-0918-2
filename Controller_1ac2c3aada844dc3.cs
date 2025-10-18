using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class Controller_1ac2c3aada844dc3 : ControllerBase
    {
        private readonly ILogger<Controller_1ac2c3aada844dc3> _logger;

        public Controller_1ac2c3aada844dc3(ILogger<Controller_1ac2c3aada844dc3> logger)
        {
            _logger = logger;
        }

        // GET: api/controller_1ac2c3aada844dc3
        [HttpGet]
        public IActionResult Get()
        {
            var data = new { 
                id = new Random().Next(1, 100), 
                message = "Random data from randomly named controller", 
                timestamp = DateTime.UtcNow 
            };
            return Ok(data);
        }

        // GET: api/controller_1ac2c3aada844dc3/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var item = new { 
                id = id, 
                value = new Random().Next(1, 100), 
                info = $"Information for item {id}" 
            };
            return Ok(item);
        }

        // POST: api/controller_1ac2c3aada844dc3
        [HttpPost]
        public IActionResult Post([FromBody] InputDataModel model)
        {
            var result = new { 
                id = new Random().Next(1, 100), 
                model = model,
                created = DateTime.UtcNow
            };
            return CreatedAtAction(nameof(Get), new { id = result.id }, result);
        }

        // PUT: api/controller_1ac2c3aada844dc3/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] InputDataModel model)
        {
            var updated = new { 
                id = id, 
                model = model,
                updated = true,
                modified = DateTime.UtcNow
            };
            return Ok(updated);
        }

        // DELETE: api/controller_1ac2c3aada844dc3/5
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

    public class InputDataModel
    {
        public string? Title { get; set; }
        public int Number { get; set; }
        public bool IsActive { get; set; }
    }
}