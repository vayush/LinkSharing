package linksharing

class Subscription {
    Topic topic
    User user
    Date dateCreated
    Date lastUpdated
    Seriousness seriousness

    static constraints = {
        topic(unique: ['user'])
        user(nullable: false)
        seriousness(nullable: false)
    }

    static belongsTo = [
            user:User,
            topic:Topic
    ]
}
