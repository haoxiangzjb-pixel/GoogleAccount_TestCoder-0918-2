// TypeScript class for a Product
class Product {
    id: number;
    name: string;
    price: number;

    constructor(id: number, name: string, price: number) {
        this.id = id;
        this.name = name;
        this.price = price;
    }
}

// Example usage:
// const product = new Product(1, "Laptop", 999.99);
// console.log(product);