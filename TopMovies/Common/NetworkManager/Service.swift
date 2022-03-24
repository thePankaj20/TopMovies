
import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
    func fetchData<T: Decodable>(with builder: URLRequest) -> AnyPublisher<DataResponse<T, NetworkError>, Never>
}

struct Service: ServiceProtocol {
    func fetchData<T: Decodable>(with builder: URLRequest) -> AnyPublisher<DataResponse<T, NetworkError>, Never> {
        return AF.request(builder)
            .validate()
            .publishDecodable(type: T.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
