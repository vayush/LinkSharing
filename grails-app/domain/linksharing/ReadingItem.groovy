package linksharing

class ReadingItem {
    Boolean isRead
    User user
    Resource resource

    static constraints = {
        resource(unique: ['user'])
    }

    static belongsTo = [
            user:User,
            resource:Resource
    ]
}
