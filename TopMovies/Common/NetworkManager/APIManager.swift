
import Foundation

enum API {
    case topMoviesList
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .topMoviesList:
            return try urlRequestForGET()
        }
    }
    
    private func urlRequestForGET() throws -> URLRequest {
        let url = URL(string: Constants.apiBaseUrl)
        var requestObject = URLRequest(url: url!)
        
        do {
            let (path, _) : (String, [String: Any]) = {
                switch self {
                case .topMoviesList:
                    return ("\(APIEndpints.topMovies)api_key=\(Constants.apiKey)" , [String: Any]())
                }
            }()
            requestObject = URLRequest(url: URL(string: path, relativeTo: url!)!)
            requestObject.httpMethod = "GET"
            return requestObject
        }
    }
}
