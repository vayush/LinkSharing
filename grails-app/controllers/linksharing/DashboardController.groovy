package linksharing

class DashboardController {

    def index() {
        User u = session.getAttribute("user0") as User
        render(view: "../dashboard/dashboard",model:[u:u])
    }




}
