package hotel_aggregator

class Country {

    String name
    String capital

    static hasMany = [hotels: Hotel]

    static constraints = {
        name nullable: false, unique: true, size: 3..255
        capital nullable: false, size: 3..128
    }
}
