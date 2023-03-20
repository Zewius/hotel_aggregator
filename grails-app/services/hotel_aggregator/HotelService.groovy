package hotel_aggregator

import grails.gorm.transactions.ReadOnly
import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

class HotelService {

    @ReadOnly
    Hotel getHotelById(Long id) {
        return Hotel.get(id)
    }

    @ReadOnly
    List<Hotel> getAllHotels() {
        return Hotel.list()
    }

    @ReadOnly
    List<Hotel> getAllHotels(Map params) {
        return Hotel.list(params)
    }

    @ReadOnly
    Long count() {
        return Hotel.count()
    }

    @Transactional
    Hotel saveHotel(Hotel hotel) {
        return hotel.save(failOnError: true)
    }

    @Transactional
    void deleteHotel(Hotel hotel) {
        hotel.delete()
    }
}
