using System.IO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace Company.Function
{
    public static class RandomFunction
    {
        [FunctionName("RandomFunction")]
        public static IActionResult Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", "put", "delete", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("Randomly named C# HTTP trigger function processed a request.");

            string name = req.Query["name"];
            string action = req.Query["action"] ?? req.Method;

            string requestBody = new StreamReader(req.Body).ReadToEnd();
            
            string responseMessage = $"The randomly named function processed a {action} request";
            
            if (!string.IsNullOrEmpty(name))
            {
                responseMessage += $" for {name}";
            }

            responseMessage += ". This demonstrates the HTTP triggered function is working correctly.";

            return new OkObjectResult(responseMessage);
        }
    }
}