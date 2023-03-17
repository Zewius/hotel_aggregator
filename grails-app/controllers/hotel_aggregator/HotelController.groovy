package hotel_aggregator

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

// TODO: Зарефачить контроллер
class HotelController {

    HotelService hotelService
    CountryService countryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond hotelService.list(params), model: [hotelCount: hotelService.count()]
    }

    def show(Long id) {
        respond hotelService.get(id)
    }

    def create() {
        [hotel: new Hotel(), countries: countryService.list()]
    }

    def save(Hotel hotel) {
        if (hotel == null) {
            notFound()
            return
        }

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            respond hotel.errors, view: 'create'
            return
        }

        flash.message = "Отель \"${hotel.name}\" успешно добавлен"
        redirect hotel
    }

    def edit(Long id) {
        [hotel: hotelService.get(id), countries: countryService.list()]
    }

    def update(Hotel hotel) {
        if (hotel == null) {
            notFound()
            return
        }

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            respond hotel.errors, view: 'edit'
            return
        }

        flash.message = "Отель \"${hotel.name}\" успешно обновлён"
        redirect hotel
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        hotelService.delete(id)

        flash.message = "Отель успешно удалён"
        redirect action: "index", method: "GET"

    }

    protected void notFound() {
        flash.message = "Отель c ID ${params.id} не найден"
        redirect action: "index", method: "GET"
    }
}
