using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            var random = new Random();
            var sampleData = Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Date = DateTime.Now.AddDays(index),
                TemperatureC = random.Next(-20, 55),
                Summary = Summaries[random.Next(Summaries.Length)]
            })
            .ToArray();

            return Ok(sampleData);
        }

        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return Ok($"Value with ID: {id}");
        }

        [HttpPost]
        public ActionResult Post([FromBody] WeatherForecast forecast)
        {
            if (forecast == null)
            {
                return BadRequest("Forecast data is null");
            }

            // Process the forecast data here
            return CreatedAtAction(nameof(Get), new { id = 1 }, forecast);
        }

        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] WeatherForecast forecast)
        {
            if (forecast == null || id != forecast.Date.Day)
            {
                return BadRequest("Invalid data");
            }

            // Update logic here
            return NoContent();
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            // Delete logic here
            return NoContent();
        }
    }

    public class WeatherForecast
    {
        public DateTime Date { get; set; }
        public int TemperatureC { get; set; }
        public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
        public string Summary { get; set; }
    }
}