package linksharing

class Resource {
    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    static constraints = {
        description(blank: false)
    }

//    static transients = ['description']

    static mapping = {tablePerHierarchy:true}

    static hasMany = [
            readingItems: ReadingItem,
            ratings : ResourceRating
    ]
    static belongsTo = [

            topic: Topic
    ]
}
