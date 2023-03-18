package hotel_aggregator

class SearchController {

    SearchService searchService
    CountryService countryService

    def index() {
        render (view: "index", model: [countryList: countryService.getAllCounties()])
    }

    // TODO: Получать информацию о стране через countryController
    def search(String prompt, Long country, Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def result = searchService.searchHotelsByNameAndCountryId(prompt, country, params)
        render view: "index", model: [
                result: result,
                resultCount: result.totalCount,
                countryList: countryService.getAllCounties()]
    }
}
