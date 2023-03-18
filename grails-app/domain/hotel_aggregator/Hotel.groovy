package hotel_aggregator

// TODO: Посмотреть, какие настройки важно ещё указать для domain-классов
class Hotel {

    String name
    Integer stars
    String website

    // TODO: Разобраться с конфигурацией связи Один-ко-многим
    static belongsTo = [country: Country]

    // TODO: Применить RegEX для поля website (http:// или https://)
    static constraints = {
        name nullable: false, unique: 'country', size: 2..255
        stars nullable: false, min: 1, max: 5
        website nullable: true
    }
}
