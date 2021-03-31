package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ReadingItemController {

    def markRead(){
        User u= session.getAttribute("user0") as User
        User user=User.get(u.id)
        Resource r=Resource.findById(params.get("id") as long)
        ReadingItem rd=ReadingItem.findByUserAndResource(user,r)

        rd.isRead=true
        rd.user=user
        rd.resource=r
        rd.validate()
        if(rd.hasErrors())
        {
            rd.errors.allErrors.each {
                println it
            }
        }
        else
            rd.save(flush:true)

        redirect url: request.getHeader("referer")
    }


}
