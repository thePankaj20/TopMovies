
import XCTest
@testable import TopMovies

class MovieListTests: XCTestCase {
    func testSuccessParser() {
        let json = """
        {
            "results": [
                {
                    "id": 99999,
                    "popularity": 9.5,
                    "vote_count": 5,
                    "vote_average": 5,
                    "title": "Conjuring",
                    "poster_path": "ConjuringPath",
                    "original_language": "En",
                    "original_title": "Conjuring",
                    "adult": true,
                    "overview": "Overview",
                    "release_date": "2012-10-1T00 12:10:00"
                }
            ]
        }
        """.data(using: .utf8)!
        
        let movies = try! JSONDecoder().decode(MovieList.self, from: json)
        
        XCTAssertNotNil(movies)
        XCTAssertEqual(movies.results?.first?.id, Movie.with().id)
        
    }
}
