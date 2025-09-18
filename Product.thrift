// Product.thrift
// Apache Thrift struct definition for a Product

namespace java com.example.product
namespace py product

struct Product {
  1: required i32 id,
  2: required string name,
  3: optional string description,
  4: required double price,
  5: optional i32 quantity,
  6: optional string category,
  7: optional bool isAvailable,
  8: optional list<string> tags
}