package hotel_aggregator

// TODO: Посмотреть, какие настройки важно ещё указать для domain-классов
class Hotel {

    String name
    Integer stars
    String website

    // TODO: Разобраться с конфигурацией связи Один-ко-многим
    static belongsTo = [country: Country]

    // TODO: Сделать ограничение на уникальность в пределах страны (или это обязанность service-класса?)
    // TODO: Применить RegEX для поля website (http:// или https://)
    static constraints = {
        name nullable: false, size: 1..255
        stars nullable: false, min: 1, max: 5
        website nullable: true
    }
}
