package hotel_aggregator

// TODO: Посмотреть, какие настройки важно ещё указать для domain-классов
class Country {

    String name
    String capital

    static constraints = {
        name nullable: false, unique: true, size: 3..255
        capital nullable: false, size: 3..128
    }
}
