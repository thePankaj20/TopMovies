
import SwiftUI
import Kingfisher

struct MoviesCellView: View {
    let imageName: String?
    var body: some View {
        HStack(alignment: .center) {
            KFImage(URL(string: "\(Constants.imagebaseUrl)\(imageName ?? "")"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.gray)
        }
        .padding(.vertical)
    }
}

struct MoviesCellView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesCellView(imageName: nil)
    }
}
