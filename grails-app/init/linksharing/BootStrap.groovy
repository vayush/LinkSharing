package linksharing

class BootStrap {

    def init = { servletContext ->

        createUser()
        createTopics()
        createSubscriptions()
        createResources()
        createReadingItems()
        createResourceRatings()
    }
    def destroy = {
    }

    def createUser(){
        User admin = new User(firstName: "Ayush", password: "Ayush123", userName: "vayush967",
                lastName: "Verma", email: "vayush967@gmail.com",admin: "true",active: "true",
                confirmPassword: "Ayush123")
        admin.save()

        User user1 = new User(firstName: "Rahul", password: "Rahul123", userName: "vrahul9818",
                lastName: "Verma", email: "vrahul9818@gmail.com",admin: "false",active: "true",
                confirmPassword : "Rahul123" )

        user1.save()
    }


    def createTopics(){
        List<String> l=["Table","Fan","AirCon","Remote","Laptop","TV","Wifi","Fiber","Plant"
                        ,"Cap","Gel","Car","LED","Charger","Book","Mobile","Machine Learning",
                        "Jersey","Bag","Earphone"]
        int i=0
        if(Topic.count==0){
            User.list().each{
                user-> (1..5).each {
                    it ->
                        if(i%4==0)
                        {
                            new Topic(name: "${l[i]}", createdBy: user, visibility: Visibility.PRIVATE).save()
                        }
                        else
                        {
                            new Topic(name: "${l[i]}", createdBy: user, visibility: Visibility.PUBLIC).save()
                        }
                        i++
                }
            }
        }
    }

    def createSubscriptions(){
        User.list().each{
            User user-> Topic.list().each{
                Topic topic->
                    if(Subscription.findByTopicAndUser(topic,user)==null) {
                        if(user.admin)
                        {
                            Subscription s = new Subscription(createdBy: user, topic: topic, seriousness: Seriousness.SERIOUS)
                            topic.addToSubscriptions(s)
                            user.addToSubscriptions(s)

                        }
                        else
                        {
                            Subscription s = new Subscription(createdBy: user, topic: topic, seriousness: Seriousness.CASUAL)
                            topic.addToSubscriptions(s)
                            user.addToSubscriptions(s)
                        }

                    }
            }

        }
    }

    def createResources() {

        Topic.list().each { Topic topic ->

            File file = new File("/home/ayush/Downloads/DocResource/abc.txt")
            String path=file.getAbsolutePath()


            1.times {
                Resource documentResource = new DocumentResource(description: "Document for ${topic.name}", createdBy: topic
                        .createdBy, filePath: path, topic: topic)

                Resource linkResource = new LinkResource(description: "Link for ${topic.name}", createdBy: topic
                        .createdBy, url: "https://www.google.co.in", topic: topic)

                documentResource.save(flush:true)
                topic.addToResources(documentResource)
                topic.createdBy.addToResources(documentResource)

                linkResource.save(flush:true)
                topic.addToResources(linkResource)
                topic.createdBy.addToResources(linkResource)
            }

        }

    }

    def createReadingItems() {

        User.list().each { User user ->
            Topic.list().each { Topic topic ->

                if (Subscription.findByUserAndTopic(user, topic)) {
                    Resource.findAllByTopic(topic).each { resource ->
                        if (resource.createdBy != user )
                        {
                            ReadingItem r = new ReadingItem(user: user, resource: resource, isRead: false)
                            r.validate()
                            if (r.hasErrors())
                            {
                                r.errors.allErrors.each {
                                    println it
                                }
                            }
                            else {
                                r.save(flush: true)
                                resource.addToReadingItems(r)
                                user.addToReadingItems(r)
                            }
                        }
                        else
                        {
                            ReadingItem r = new ReadingItem(user: user, resource: resource, isRead: true)
                            r.validate()
                            if (r.hasErrors())
                            {
                                r.errors.allErrors.each {
                                    println it
                                }
                            }
                            else {
                                r.save(flush: true)
                                resource.addToReadingItems(r)
                                user.addToReadingItems(r)
                            }
                        }
                    }
                }
            }
        }
    }

    def createResourceRatings() {

        User.list().each { User user ->
            ReadingItem.findAllByUser(user).each{ ReadingItem readingItem ->

                ResourceRating resourceRating = new ResourceRating(score: (Math.random()*4+1),
                        user: readingItem.user,
                        resource: readingItem.resource)
                resourceRating.validate()
                if (resourceRating.hasErrors())
                {
                    resourceRating.errors.allErrors.each {
                        println it
                    }
                }
                else {
                    resourceRating.save(flush: true)
                    readingItem.resource.addToRatings(resourceRating)
                }
            }
        }
    }

}
