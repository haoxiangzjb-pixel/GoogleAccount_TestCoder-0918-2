using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomDataController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        [HttpGet(Name = "GetRandomData")]
        public IEnumerable<string> Get()
        {
            var rng = new Random();
            return Enumerable.Range(1, 5).Select(index => Summaries[rng.Next(Summaries.Length)])
                .ToArray();
        }
    }
}