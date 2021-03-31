package linksharing

class UserController {

    def edit(){
        User user = session.getAttribute("user0") as User
        int scount = Subscription.countByUser(user)
        int tcount = Topic.countByCreatedBy(user)
        render(view:"editProfile",model: [user:user, subs:scount, topics:tcount] )
    }

    def updateProfile(){

        User a= session.getAttribute("user0") as User
        def user=User.get(a.id)

        if(params.get("userName") && params.("firstName") && params.("lastName")){

            if(user.admin){
                render("CANNOT CHANGE DETAILS ADMIN USER")
            }
            else{
                user.firstName = params.get("firstName")
                user.lastName = params.get("lastName")
                user.email = params.get("email")
                user.userName = params.get("userName")
                user.password = user.password
                user.confirmPassword = user.password
                user.save(flush: true)
                session.setAttribute("user0", user)
                redirect(controller: "user", action: "edit")

            }
        }
    }

    def updatePassword(){

        User u= session.getAttribute("user0") as User

        def user=User.get(u.id)
        user.password=params.get("password")
        if(user.password==params.get("confirmPassword"))
            user.confirmPassword=user.password

        user.userName = user.userName
        user.firstName = user.firstName
        user.lastName = user.lastName
        user.email = user.email
        user.confirmPassword = user.password
        user.save(flush: true)
        session.setAttribute("user0", user)
        redirect(controller: "user", action: "edit")
    }
}
