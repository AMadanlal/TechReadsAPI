import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

  router.post(Article.self, at: "NewsArticleFormatter") { req, data -> String in
    let articleDescription: String = data.content ?? "No description available"
    let author: String = data.author ?? "Unknown"
    let sourceName: String = data.source.name ?? "Unknown"
    let publishedAt: String = data.publishedAt ?? "Unknown"
    var formattedText :String? = ""
    formattedText = articleDescription + "\n \n"
    formattedText = formattedText! + "\n" + "Author: " + author
    formattedText = formattedText! + "\n" + "Published At: " + publishedAt
    formattedText = formattedText! + "\n" + "Source: " + sourceName
    return formattedText ?? "Nothing to display"
  }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
