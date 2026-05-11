using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UsersController : ControllerBase
{
    private static readonly List<User> Users = new()
    {
        new User { Id = 1, Name = "Alice", Email = "alice@example.com" },
        new User { Id = 2, Name = "Bob", Email = "bob@example.com" }
    };

    /// <summary>
    /// Get all users
    /// </summary>
    [HttpGet]
    public ActionResult<IEnumerable<User>> Get()
    {
        return Ok(Users);
    }

    /// <summary>
    /// Get a user by ID
    /// </summary>
    [HttpGet("{id:int}")]
    public ActionResult<User> GetById(int id)
    {
        var user = Users.FirstOrDefault(u => u.Id == id);
        if (user == null)
        {
            return NotFound();
        }
        return Ok(user);
    }

    /// <summary>
    /// Create a new user
    /// </summary>
    [HttpPost]
    public ActionResult<User> Create([FromBody] User newUser)
    {
        newUser.Id = Users.Max(u => u.Id) + 1;
        Users.Add(newUser);
        return CreatedAtAction(nameof(GetById), new { id = newUser.Id }, newUser);
    }

    /// <summary>
    /// Update an existing user
    /// </summary>
    [HttpPut("{id:int}")]
    public IActionResult Update(int id, [FromBody] User updatedUser)
    {
        var user = Users.FirstOrDefault(u => u.Id == id);
        if (user == null)
        {
            return NotFound();
        }

        user.Name = updatedUser.Name;
        user.Email = updatedUser.Email;

        return NoContent();
    }

    /// <summary>
    /// Delete a user
    /// </summary>
    [HttpDelete("{id:int}")]
    public IActionResult Delete(int id)
    {
        var user = Users.FirstOrDefault(u => u.Id == id);
        if (user == null)
        {
            return NotFound();
        }

        Users.Remove(user);
        return NoContent();
    }
}

public class User
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
}
