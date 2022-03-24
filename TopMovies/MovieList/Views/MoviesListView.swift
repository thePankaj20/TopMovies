
import SwiftUI

struct MoviesListView: View {
    @ObservedObject var viewModel = MovieListViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if let arr = viewModel.movieList, arr.count > 0 {
                    List (arr) { movie in
                        NavigationLink(destination: MovieDetailsView(movie: movie)){
                            MoviesCellView(imageName: movie.poster_path)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getMoviesList()
            }
            .navigationBarTitle(Text(Constants.topMoviesScreenTitle))
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
