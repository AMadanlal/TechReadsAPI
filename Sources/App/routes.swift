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

  //  tech reads application API calls
  //  get to get headers
  router.get("Headers") { req -> [String : String] in
      //  this is the headers that include the host and the unique key given to a user to access the api
      let headers = ["x-rapidapi-host": "chicken-coop.p.rapidapi.com",
                      "x-rapidapi-key": "20e0c6a126msh31a394fe35837d8p1d97f3jsn9bf6099a1b56"]
      return headers
    }
  //post to process text
  router.post(FormattedText.self, at: "textToFormat") { req, data -> String in
       /* here we will have to create a switch ststement for the different consoles in the format origtext -> apicalltext
                PC -> pc
                PlayStation 4 -> playstation-4
                Xbox One -> xbox-one
                Stadia -> stadia
                Switch -> switch
                3DS -> 3ds
                X360 -> xbox360
                WIIU -> wii-u
                VITA -> playstation-vita
                PSP -> psp
                GBA -> game-boy-advance
                PS2 -> playstation-2
                PS3 -> playstation-3
                DS -> ds
             */
            switch data.text {
             case "PC":
             return "pc"
             case "PS4":
               return "playstation-4"
             case "XONE":
               return "xbox-one"
             case "Stadia":
               return "stadia"
             case "Switch":
               return "switch"
             case "3DS":
               return "3ds"
             case "X360":
               return "xbox360"
             case "WIIU":
               return "wii-u"
             case "VITA":
               return "playstation-vita"
             case "PSP":
               return "psp"
             case "GBA":
               return "game-boy-advance"
             case "PS2":
               return "playstation-2"
             case "PS3":
               return "playstation-3"
             case "DS":
               return "ds"
             case "iOS":
             return "ios"
             default:
              return data.text
      }
    }
  
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
