package hotel_aggregator

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "search", action: "index")
        "/search"(controller: "search", action: "search")

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
