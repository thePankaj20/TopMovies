
import Foundation
import Combine
import Alamofire

protocol TopMoviesService {
    var service: ServiceProtocol {get}
    // For requesting movie list
    func getMoviesList() -> AnyPublisher<DataResponse<MovieList, NetworkError>, Never>
}

extension TopMoviesService {
    func getMoviesList() -> AnyPublisher<DataResponse<MovieList, NetworkError>, Never> {
        return try! service.fetchData(with: API.topMoviesList.asURLRequest())
            .eraseToAnyPublisher()
    }
}
