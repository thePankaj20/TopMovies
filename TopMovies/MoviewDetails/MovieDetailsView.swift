
import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    var movie: Movie
    var body: some View {
        VStack {
            KFImage(URL(string: "\(Constants.imagebaseUrl)\(movie.poster_path ?? "")"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.gray)
            Text(movie.overview ?? "").lineLimit(nil)
            Spacer()
        }.navigationBarTitle(Text(movie.title ?? ""), displayMode: .inline)
            .padding()
    }
}
