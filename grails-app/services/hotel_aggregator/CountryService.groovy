package hotel_aggregator

import grails.gorm.transactions.ReadOnly
import grails.gorm.transactions.Transactional

class CountryService {

    @ReadOnly
    Country getCountryById(Long id) {
        return Country.get(id)
    }

    @ReadOnly
    List<Country> getAllCounties() {
        return Country.list()
    }

    @ReadOnly
    List<Country> getAllCounties(Map params) {
        return Country.list(params)
    }

    @ReadOnly
    Long count() {
        return Country.count()
    }

    @Transactional
    Country saveCountry(Country country) {
        return country.save()
    }

    @Transactional
    void deleteCountry(Country country) {
        country.delete()
    }
}
