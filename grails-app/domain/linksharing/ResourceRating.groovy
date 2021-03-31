package linksharing

class ResourceRating {
    Resource resource
    User user
    Integer score

    static constraints = {
        score(min: 1,max: 5,nullable: false)
        user(nullable: false)
        resource(nullable: false,unique: ['user'])
    }
    static belongsTo = [
            user:User,
            resource: Resource
    ]
}
