
import Foundation
import Combine

class MovieListViewModel: ObservableObject, TopMoviesService {
    var service: ServiceProtocol
    var cancellables = Set<AnyCancellable>()
    @Published var movieList: [Movie]?
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }

    func getMoviesList() {
        let cancellableBankDetails = self.getMoviesList()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            }, receiveValue: { response in
                if let list = response.value?.results, list.count > 0 {
                    self.movieList = list
                }
            })
        cancellables.insert(cancellableBankDetails)
    }
}
