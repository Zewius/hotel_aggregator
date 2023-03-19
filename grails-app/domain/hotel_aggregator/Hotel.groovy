package hotel_aggregator

class Hotel {

    String name
    Integer stars
    String website

    static belongsTo = [country: Country]

    static constraints = {
        name nullable: false, unique: "country", size: 3..255
        stars nullable: false, min: 1, max: 5
        website nullable: true, matches: /^(https?:\/\/).*/
    }
}
