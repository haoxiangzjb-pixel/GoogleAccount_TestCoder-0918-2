using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace MyApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class JPBHXJKPController : ControllerBase
    {
        private static readonly List<string> Items = new List<string>
        {
            "Item 1",
            "Item 2",
            "Item 3"
        };

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return Ok(Items);
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            if (id < 0 || id >= Items.Count)
            {
                return NotFound();
            }
            return Items[id];
        }

        [HttpPost]
        public ActionResult<string> Post([FromBody] string value)
        {
            Items.Add(value);
            return CreatedAtAction(nameof(Get), new { id = Items.Count - 1 }, value);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            if (id < 0 || id >= Items.Count)
            {
                return NotFound();
            }

            Items[id] = value;
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id < 0 || id >= Items.Count)
            {
                return NotFound();
            }

            Items.RemoveAt(id);
            return NoContent();
        }
    }
}