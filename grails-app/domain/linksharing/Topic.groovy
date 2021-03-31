package linksharing
class Topic {
    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static constraints = {
        name(blank: false, unique: ['createdBy'])
        visibility(inList: Visibility.values().toList())
        createdBy(blank: false)
    }
    static hasMany = [
            subscriptions:Subscription,
            resources: Resource
    ]
    static belongsTo = [
            createdBy: User
    ]

}
