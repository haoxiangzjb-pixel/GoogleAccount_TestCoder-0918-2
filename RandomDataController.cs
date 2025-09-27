using Microsoft.AspNetCore.Mvc;

namespace RandomApi.Controllers
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
            return Enumerable.Range(1, 5).Select(index => Summaries[Random.Shared.Next(Summaries.Length)])
                .ToArray();
        }
    }
}