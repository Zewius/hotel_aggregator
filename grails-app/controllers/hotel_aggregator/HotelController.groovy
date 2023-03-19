package hotel_aggregator

import grails.validation.ValidationException

// TODO: Зарефачить контроллер
class HotelController {

    HotelService hotelService
    CountryService countryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if (countryService.getAllCounties().empty) {
            flash.message = "Список стран пуст, вы не сможете добавить отель"
        }
        respond hotelService.getAllHotels(params), model: [hotelCount: hotelService.count()]
    }

    def show(Long id) {
        respond hotelService.getHotelById(id)
    }

    def create() {
        List<Country> countries = countryService.getAllCounties()
        if (countries.empty) {
            redirect action: "index", method: "GET"
        }
        [hotel: new Hotel(), countries: countries]
    }

    def save(Hotel hotel) {
        if (hotel == null) {
            notFound()
            return
        }

        try {
            hotelService.saveHotel(hotel)
        } catch (Exception e) {
            respond hotel.errors, view: 'create', model: [countries: countryService.getAllCounties()]
            return
        }

        flash.message = "Отель \"${hotel.name}\" успешно добавлен"
        redirect hotel
    }

    def edit(Long id) {
        [hotel: hotelService.getHotelById(id), countries: countryService.getAllCounties()]
    }

    def update(Hotel hotel) {
        if (hotel == null) {
            notFound()
            return
        }

        try {
            hotelService.saveHotel(hotel)
        } catch (ValidationException e) {
            respond hotel.errors, view: 'edit', model: [countries: countryService.getAllCounties()]
            return
        }

        flash.message = "Отель \"${hotel.name}\" успешно обновлён"
        redirect hotel
    }

    def delete(Hotel hotel) {
        if (hotel == null) {
            notFound()
            return
        }

        hotelService.deleteHotel(hotel)

        flash.message = "Отель успешно удалён"
        redirect action: "index", method: "GET"
    }

    protected void notFound() {
        flash.message = "Отель c ID ${params.id} не найден"
        redirect action: "index", method: "GET"
    }
}
