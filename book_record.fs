// F# Record Type for Book Information
type Book = {
    Title: string
    Author: string
    ISBN: string
    PublicationYear: int
    Genre: string
    PageCount: int
    Price: decimal
    InStock: bool
}

// Example usage:
let sampleBook = {
    Title = "The F# Programming Language"
    Author = "Microsoft"
    ISBN = "978-1234567890"
    PublicationYear = 2023
    Genre = "Technical"
    PageCount = 350
    Price = 29.99m
    InStock = true
}

printfn "Book: %s by %s" sampleBook.Title sampleBook.Author