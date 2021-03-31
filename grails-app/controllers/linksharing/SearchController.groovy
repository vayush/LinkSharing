package linksharing

class SearchController {

    def index() { }

    def search(){
        User u=session.getAttribute("user0") as User
//        render "${params.get("search")}"


        render (view:"search" ,model: [searchElement:params.get("search"),u:u])
    }
}
