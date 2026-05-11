using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private static readonly List<Product> Products = new()
    {
        new Product { Id = 1, Name = "Laptop", Price = 999.99m },
        new Product { Id = 2, Name = "Mouse", Price = 29.99m },
        new Product { Id = 3, Name = "Keyboard", Price = 79.99m }
    };

    /// <summary>
    /// Get all products
    /// </summary>
    [HttpGet]
    public ActionResult<IEnumerable<Product>> GetAll()
    {
        return Ok(Products);
    }

    /// <summary>
    /// Get a product by ID
    /// </summary>
    [HttpGet("{id:int}")]
    public ActionResult<Product> GetById(int id)
    {
        var product = Products.FirstOrDefault(p => p.Id == id);
        if (product == null)
        {
            return NotFound();
        }
        return Ok(product);
    }

    /// <summary>
    /// Create a new product
    /// </summary>
    [HttpPost]
    public ActionResult<Product> Create([FromBody] Product product)
    {
        product.Id = Products.Max(p => p.Id) + 1;
        Products.Add(product);
        return CreatedAtAction(nameof(GetById), new { id = product.Id }, product);
    }

    /// <summary>
    /// Update an existing product
    /// </summary>
    [HttpPut("{id:int}")]
    public IActionResult Update(int id, [FromBody] Product product)
    {
        var existingProduct = Products.FirstOrDefault(p => p.Id == id);
        if (existingProduct == null)
        {
            return NotFound();
        }

        existingProduct.Name = product.Name;
        existingProduct.Price = product.Price;

        return NoContent();
    }

    /// <summary>
    /// Delete a product
    /// </summary>
    [HttpDelete("{id:int}")]
    public IActionResult Delete(int id)
    {
        var product = Products.FirstOrDefault(p => p.Id == id);
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
    public string Name { get; set; } = string.Empty;
    public decimal Price { get; set; }
}
