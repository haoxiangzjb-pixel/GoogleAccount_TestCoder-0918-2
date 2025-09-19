// Product.thrift
// Apache Thrift struct definition for a Product

namespace java com.example.product
namespace py product

struct Product {
  1: i32 id,
  2: string name,
  3: string description,
  4: double price,
  5: i32 quantity,
  6: string category,
  7: bool isAvailable,
  8: optional string imageUrl
}