package linksharing

enum Visibility {
    PRIVATE("private"),
    PUBLIC("public")

    String name
    Visibility(String name){
        this.name = name
    }
}