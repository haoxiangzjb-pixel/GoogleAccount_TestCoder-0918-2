using Microsoft.AspNetCore.Mvc;

namespace MyApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MyController : ControllerBase
    {
        // GET: api/My
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("Hello from MyController!");
        }

        // GET: api/My/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok($"Hello from MyController with id {id}!");
        }

        // POST: api/My
        [HttpPost]
        public IActionResult Post([FromBody] string value)
        {
            return Ok($"Posted: {value}");
        }

        // PUT: api/My/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            return Ok($"Updated id {id} with: {value}");
        }

        // DELETE: api/My/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return Ok($"Deleted id {id}");
        }
    }
}