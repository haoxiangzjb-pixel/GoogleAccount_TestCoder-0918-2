namespace java com.example.product
namespace cpp product
namespace py product

struct Product {
  1: i32 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 quantity,
  6: string category,
  7: bool isActive = true,
  8: list<string> tags,
  9: map<string, string> attributes
}

// Example service that uses the Product struct
service ProductService {
  Product getProduct(1: i32 productId),
  list<Product> getAllProducts(),
  bool addProduct(1: Product product),
  bool updateProduct(1: Product product),
  bool deleteProduct(1: i32 productId)
}