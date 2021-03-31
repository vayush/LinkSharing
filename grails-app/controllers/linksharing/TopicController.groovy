package linksharing


class TopicController {

    def topicsShow(){
        User u= session.getAttribute("user0") as User
        def topic=Topic.findById(params.get("id") as long)
        render (view:"topicShow",model:[t:topic,u:u])
    }

    def createTopic(){
        User u= session.getAttribute("user0") as User
        def user = User.get(u.id)
        String v= params.get("visi")

        Topic t=new Topic(name:params.get("name") , createdBy: user)

        if(v=="public")
            t.visibility=Visibility.PUBLIC
        else
            t.visibility=Visibility.PRIVATE

        t.validate()


        if(t.hasErrors())
        {
            t.errors.allErrors.each {
                println it
            }
        }
        else{
            t.save(flush:true)
            user.addToTopics(t)
        }


        Subscription s = new Subscription(user: user, topic: t, seriousness: Seriousness.SERIOUS)
        s.save(flush:true)
        t.addToSubscriptions(s)
        user.addToSubscriptions(s)

        redirect url: request.getHeader("Referer")
    }

    def delete(){
        User u= session.getAttribute("user0") as User
        User user=User.get(u.id)
        Topic top=Topic.findById(params.get("id") as long)

        user.removeFromTopics(top)
        top.delete(flush: true)
        session.setAttribute("user0",user)


        redirect url: request.getHeader("Referer")
    }

    def changePrivacy(){
        User user= session.getAttribute("user0") as User
        def topic=Topic.findById(params.get("id") as long)

        def p=params.get("privacy")
        if(p=="public")
            topic.visibility=Visibility.PUBLIC
        else
            topic.visibility=Visibility.PRIVATE

        topic.validate()
        if(topic.hasErrors())
        {
            topic.errors.allErrors.each {
                println it
            }
        }
        else
            topic.save(flush:true)
        redirect url: request.getHeader("Referer")
    }



}
