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
        public IEnumerable<RandomDataItem> Get()
        {
            return Enumerable.Range(1, 5).Select(index => new RandomDataItem
            {
                Id = index,
                Name = Summaries[Random.Shared.Next(Summaries.Length)],
                Date = DateTime.Now.AddDays(index)
            })
            .ToArray();
        }
    }

    public class RandomDataItem
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public DateTime Date { get; set; }
    }
}