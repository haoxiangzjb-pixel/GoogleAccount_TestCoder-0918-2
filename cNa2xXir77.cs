using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleController : ControllerBase
    {
        private static readonly List<Product> Products = new List<Product>
        {
            new Product { Id = 1, Name = "Sample Product 1", Price = 19.99m },
            new Product { Id = 2, Name = "Sample Product 2", Price = 29.99m }
        };

        // GET: api/sample
        [HttpGet]
        public ActionResult<IEnumerable<Product>> GetProducts()
        {
            return Ok(Products);
        }

        // GET: api/sample/5
        [HttpGet("{id}")]
        public ActionResult<Product> GetProduct(int id)
        {
            var product = Products.Find(p => p.Id == id);
            
            if (product == null)
            {
                return NotFound();
            }

            return Ok(product);
        }

        // POST: api/sample
        [HttpPost]
        public ActionResult<Product> PostProduct(Product product)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            product.Id = Products.Count > 0 ? Products.Max(p => p.Id) + 1 : 1;
            Products.Add(product);

            return CreatedAtAction(nameof(GetProduct), new { id = product.Id }, product);
        }

        // PUT: api/sample/5
        [HttpPut("{id}")]
        public IActionResult PutProduct(int id, Product product)
        {
            var existingProduct = Products.Find(p => p.Id == id);
            
            if (existingProduct == null)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            existingProduct.Name = product.Name;
            existingProduct.Price = product.Price;

            return NoContent();
        }

        // DELETE: api/sample/5
        [HttpDelete("{id}")]
        public IActionResult DeleteProduct(int id)
        {
            var product = Products.Find(p => p.Id == id);
            
            if (product == null)
            {
                return NotFound();
            }

            Products.Remove(product);
            return NoContent();
        }
    }

    public class Product
    {
        public int Id { get; set; }
        
        [Required]
        [StringLength(100)]
        public string Name { get; set; }
        
        [Range(0.01, double.MaxValue)]
        public decimal Price { get; set; }
    }
}