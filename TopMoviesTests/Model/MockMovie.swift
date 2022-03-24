
import Foundation
@testable import TopMovies

extension Movie {
    static func with(id: Int = 99999,
                     popularity: Float = 9.5,
                     voteCount: Int = 5,
                     voteAverage: Float = 5,
                     title: String = "Conjuring",
                     posterPath: String = "ConjuringPath",
                     originalLanguage: String = "En",
                     originalTitle: String = "Conjuring",
                     adult: Bool = true,
                     overView: String = "Overview",
                     releaseDate: String = "2012-10-1T00 12:10:00") -> Movie {
        return Movie(
            popularity: popularity,
            vote_count: voteCount, id: id,
            vote_average: voteAverage,
            title: title,
            poster_path: posterPath,
            original_language: originalTitle,
            original_title: originalTitle,
            adult: adult,
            overview: overView,
            release_date: releaseDate
        )
    }
}
