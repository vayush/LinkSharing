package linksharing

class LoginController {

    def index() {
        render(view: "/user/loginPage")
    }

    def log(){
        String uname = params.get("userName")
        String pass = params.get("password")
        User user = User.findByUserNameAndPassword(uname,pass)
        if(user) {
            if (user.active) {
                session.setAttribute("user0",user)
                redirect(controller: 'dashboard', action: 'index')
                return
            }

        }
    }

    def logout(){
        session.invalidate()
        redirect(controller: "login",action: "index")
    }

    def register(){


        User user = new User(firstName: params.firstName,lastName: params.lastName,email: params.email,userName: params.userName,password: params.password,confirmPassword: params.confirmPassword,admin:false,active: true)
        user.save(flush:true)
        redirect(url: request.getHeader("Referrer"))
    }

    def forgotPassword(){

        User u = User.findByEmail(params.email)
        def user=User.get(u.id)
//        render(user)
        user.password=params.get("password")

        if(user.admin == true){
            render("ADMIN USER CANNOT CHANGE")
            return
        }


        if(user.password==params.get("confirmPassword")){
            user.confirmPassword=user.password
        }
        else{
            render("PLEASE ENTER SAME PASSWORD")
        }


        user.userName=user.userName
        user.firstName=user.firstName
        user.lastName=user.lastName
        user.email=user.email
        user.confirmPassword=user.password
        user.save(flush:true)
        redirect url: request.getHeader("referrer")
    }
}
