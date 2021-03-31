package linksharing

class User {
    String email
    String userName
    String password
    String confirmPassword
    String firstName
    String lastName

//    Byte[] photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    String fullName = "${firstName} ${lastName}"


    static transients = ['confirmPassword','fullName']

    static constraints = {
        email(unique: true,email: true,blank: false)
        userName(size: 5..10,unique: true,blank: false)
        password(size: 5..15,blank: false)
        admin(nullable: true)
        active(nullable: true)
        firstName(blank: false)
        lastName(blank: false)
        confirmPassword(bindable: true,nullable: true,blank: true)
    }

    static hasMany = [
            topics: Topic,
            subscriptions: Subscription,
            resources: Resource,
            readingItems: ReadingItem,
    ]
}
