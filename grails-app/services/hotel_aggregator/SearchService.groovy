package hotel_aggregator

import grails.gorm.transactions.ReadOnly

class SearchService {

    @ReadOnly
    List<Hotel> searchHotelsByNameAndCountryId(String prompt, Long countryId, Map params) {
        def criteria = Hotel.createCriteria()
        def result = criteria.list (params) {
            if (prompt != null && !prompt.empty) {
                ilike("name", "%${prompt}%")
            }
            if (countryId != null && countryId != 0) {
                country {
                    idEq(countryId)
                }
            }
            order("stars", "desc")
            order("name", "asc")
        }
        return result
    }
}
