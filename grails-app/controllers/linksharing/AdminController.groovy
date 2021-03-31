package linksharing

class AdminController {

    def adminView(){
        User u= session.getAttribute("user0") as User
        render(view: "adminView", model: [u:u])
    }

    def activate(){
        User u= session.getAttribute("user0") as User

        def u1 = User.get(params.get("id"))
        def u2= User.findById(params.get("id"))
        u1.userName=u2.userName
        u1.password=u2.password
        u1.firstName=u2.firstName
        u1.lastName=u2.lastName
        u1.email=u2.email
        u1.confirmPassword=u2.password
        u1.active=true
        u1.save(flush:true)
        render(view: "adminView", model: [u:u])
    }

    def deactivate() {
        User u= session.getAttribute("user0") as User



        def u1 = User.get(params.get("id"))
        def u2= User.findById(params.get("id"))
        u1.userName=u2.userName
        u1.password=u2.password
        u1.firstName=u2.firstName
        u1.lastName=u2.lastName
        u1.email=u2.email
        u1.confirmPassword=u2.password
        u1.active=false
        u1.save(flush:true)
        render(view: "adminView", model: [u:u])
    }

}
