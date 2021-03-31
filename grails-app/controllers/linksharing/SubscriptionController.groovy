package linksharing

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SubscriptionController {

    def topPostService


    def changeSeriousness(){
        User u= session.getAttribute("user0") as User
        def top=Topic.findById(params.get("id") as long)
        def sub=Subscription.findByTopicAndUser(top,u)
        def s=params.get("serious")
        if(s=="serious")
            sub.seriousness=Seriousness.SERIOUS
        else if(s=="Casual" || s=="CASUAL" || s=="casual")
            sub.seriousness=Seriousness.CASUAL
        else
            sub.seriousness=Seriousness.VERY_SERIOUS
        sub.validate()
        if(sub.hasErrors())
        {
            sub.errors.allErrors.each {
                println it
            }
        }
        else
            sub.save(flush:true)

        redirect url: request.getHeader("Referer")
    }

    def unsubscribe(){
        User u= session.getAttribute("user0") as User
        User user=User.get(u.id)
        Topic top=Topic.findById(params.get("id") as long)
        Subscription sub= Subscription.findByTopicAndUser(top,user)
        user.removeFromSubscriptions(sub)
        top.removeFromSubscriptions(sub)
        sub.delete(flush: true)
        topPostService.deletereadingitems(top,user)
        session.setAttribute("user0",user)
        redirect url: request.getHeader("Referer")
    }
    def subscribe(){
        User u= session.getAttribute("user0") as User
        User user=User.get(u.id)
        Topic top=Topic.findById(params.get("id") as long)
        Subscription s = new Subscription(user: user,topic: top,seriousness: Seriousness.SERIOUS)
        top.addToSubscriptions(s)
        user.addToSubscriptions(s)
        s.save(flush: true)
        topPostService.createreadingitems(top,user)
        session.setAttribute("user0",user)
        redirect url: request.getHeader("Referer")
    }


    def viewAll(){
        User u = session.getAttribute("user0") as User
        render(view: "viewAll",model:[u:u])
    }

    def invite(){


        User user=User.findByEmail(params.email)
        Topic topic=Topic.findByName(params.topic)

        if(user && !Subscription.findByTopicAndUser(topic,user))
        {

            Subscription s = new Subscription(user: user, topic: topic, seriousness: Seriousness.SERIOUS)
            s.save(flush:true)
            topPostService.createreadingitems(topic,user)
            topic.addToSubscriptions(s)
            user.addToSubscriptions(s)
            redirect(url: request.getHeader("referer"),params:[user:session.getAttribute("user0")])
        }
        else
            render("IT IS AN ERROR")
    }


}
