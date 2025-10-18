using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class JsBPtGEpCqController : ControllerBase
    {
        private static readonly List<string> SampleData = new List<string>
        {
            "Sample Item 1",
            "Sample Item 2",
            "Sample Item 3"
        };

        // GET: api/jsbptgepcq
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return SampleData;
        }

        // GET: api/jsbptgepcq/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            if (id < 0 || id >= SampleData.Count)
            {
                return NotFound();
            }
            
            return SampleData[id];
        }

        // POST: api/jsbptgepcq
        [HttpPost]
        public ActionResult<string> Post([FromBody] string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return BadRequest("Value cannot be null or empty");
            }
            
            SampleData.Add(value);
            return CreatedAtAction(nameof(Get), new { id = SampleData.Count - 1 }, value);
        }

        // PUT: api/jsbptgepcq/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            if (id < 0 || id >= SampleData.Count)
            {
                return NotFound();
            }
            
            if (string.IsNullOrEmpty(value))
            {
                return BadRequest("Value cannot be null or empty");
            }
            
            SampleData[id] = value;
            return NoContent();
        }

        // DELETE: api/jsbptgepcq/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id < 0 || id >= SampleData.Count)
            {
                return NotFound();
            }
            
            SampleData.RemoveAt(id);
            return NoContent();
        }
    }
}