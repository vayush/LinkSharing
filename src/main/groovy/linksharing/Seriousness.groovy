package linksharing

enum Seriousness {
    SERIOUS("serious"),
    VERY_SERIOUS("very serious"),
    CASUAL("casual")

    String name
    Seriousness(String name){
        this.name = name
    }
}