package hotel_aggregator

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

// TODO: Зарефачить контроллер
class CountryController {

    CountryService countryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond countryService.list(params), model:[countryCount: countryService.count()]
    }

    def show(Long id) {
        respond countryService.get(id)
    }

    def create() {
        respond new Country(params)
    }

    def save(Country country) {
        if (country == null) {
            notFound()
            return
        }

        try {
            countryService.save(country)
        } catch (ValidationException e) {
            respond country.errors, view:'create'
            return
        }

        flash.message = "Страна \"${country.name}\" успешно добавлена"
        redirect country
    }

    def edit(Long id) {
        respond countryService.get(id)
    }

    def update(Country country) {
        if (country == null) {
            notFound()
            return
        }

        try {
            countryService.save(country)
        } catch (ValidationException e) {
            respond country.errors, view:'edit'
            return
        }

        flash.message = "Страна \"${country.name}\" успешно обновлена"
        redirect country
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }
        countryService.delete(id)

        flash.message = "Страна успешно удалена"
        redirect action:"index", method:"GET"
    }

    protected void notFound() {
        flash.message = "Страна c ID ${params.id} не найдена"
        redirect action: "index", method: "GET"
    }
}
