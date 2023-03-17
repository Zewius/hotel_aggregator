package hotel_aggregator

class BootStrap {

    def init = { servletContext ->
        def russia = new Country(name: "Россия", capital: "Москва").save()
        new Hotel(name: "Марриотт Москва Гранд Отель", country: russia, stars: 5, website: "https://moscowgrandhotel.ru/").save()
        new Hotel(name: "Гамма Измайлово", country: russia, stars: 3, website: "https://gamma-izmailovo.ru/").save()
        new Hotel(name: "Cosmos Moscow Vdnh Hotel", country: russia, stars: 3, website: "https://moscowvdnh.cosmosgroup.ru/").save()
        new Hotel(name: "Бета Измайлово", country: russia, stars: 5, website: "https://beta-izmailovo.ru/").save()
        new Hotel(name: "AZIMUT Сити Отель Смоленская Москва", country: russia, stars: 4, website: "https://azimuthotels.com/ru/moscow/azimut-hotel-smolenskaya").save()
        new Hotel(name: "Националь", country: russia, stars: 5).save()
        new Hotel(name: "Славянка", country: russia, stars: 3).save()
        new Hotel(name: "Хилтон Москва Ленинградская", country: russia, stars: 5).save()
        new Hotel(name: "Дельта Измайлово", country: russia, stars: 4).save()
        new Hotel(name: "Холидей Инн Москва Сокольники", country: russia, stars: 4).save()

        def kazakhstan = new Country(name: "Казахстан", capital: "Астана").save()
        new Hotel(name: "Тенгри", country: kazakhstan, stars: 3).save()
        new Hotel(name: "King Hotel Astana", country: kazakhstan, stars: 4).save()
        new Hotel(name: "Казжол Астана", country: kazakhstan, stars: 4).save()
        new Hotel(name: "G Empire Hotel", country: kazakhstan, stars: 4).save()
        new Hotel(name: "Ibis Нур-Султан", country: kazakhstan, stars: 3).save()
        new Hotel(name: "Rixos President Astana", country: kazakhstan, stars: 5).save()
        new Hotel(name: "Astana Saad", country: kazakhstan, stars: 5).save()
        new Hotel(name: "Sheraton Astana Hotel", country: kazakhstan, stars: 5).save()
        new Hotel(name: "YE'S", country: kazakhstan, stars: 4).save()
        new Hotel(name: "Hampton by Hilton Triumphal Arch", country: kazakhstan, stars: 3).save()

        def belarus = new Country(name: "Беларусь", capital: "Минск").save()
        new Hotel(name: "Отель Минск", country: belarus, stars: 4, website: "https://hotelminsk.by/").save()
        new Hotel(name: "Гостиница Беларусь", country: belarus, stars: 3, website: "https://www.hotel-belarus.com/").save()
        new Hotel(name: "East Time", country: belarus, stars: 2, website: "https://easttime-hotel.by/").save()
        new Hotel(name: "Президент-Отель", country: belarus, stars: 5, website: "https://www.president-hotel.by/").save()
        new Hotel(name: "DoubleTree by Hilton Hotel Minsk", country: belarus, stars: 5, website: "https://www.hilton.ru/hotels/doubletree-by-hilton-hotel-minsk/").save()
        new Hotel(name: "Пекин", country: belarus, stars: 5).save()
        new Hotel(name: "Гарни", country: belarus, stars: 3).save()
        new Hotel(name: "Ренессанс Минск Конгресс Отель и СПА центр", country: belarus, stars: 5).save()
        new Hotel(name: "Bon Hotel", country: belarus, stars: 3).save()
        new Hotel(name: "Victoria & SPA", country: belarus, stars: 4).save()
    }
    def destroy = {
    }
}
