// F#记录类型定义 - 图书信息
type Book = {
    Id: int
    Title: string
    Author: string
    ISBN: string
    PublishYear: int
    Price: decimal
    Genre: string
}

// 示例图书数据
let sampleBook = {
    Id = 1
    Title = "F# Programming"
    Author = "John Doe"
    ISBN = "978-1234567890"
    PublishYear = 2023
    Price = 29.99m
    Genre = "Programming"
}

// 打印图书信息的辅助函数
let printBook (book: Book) =
    printfn "ID: %d" book.Id
    printfn "Title: %s" book.Title
    printfn "Author: %s" book.Author
    printfn "ISBN: %s" book.ISBN
    printfn "Publish Year: %d" book.PublishYear
    printfn "Price: %.2f" book.Price
    printfn "Genre: %s" book.Genre
    printfn "---"

// 示例使用
printBook sampleBook