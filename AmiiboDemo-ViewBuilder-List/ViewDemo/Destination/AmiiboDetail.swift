
import SwiftUI

struct AmiiboDetail: View {
    let amiibo: Amiibo
    
    var body: some View {
        VStack {
            Image(amiibo.imageName)
                .resizable()
                .frame(maxWidth: 350, maxHeight: 350)
                .aspectRatio(contentMode: .fill)
            Text(amiibo.name)
                .font(
                    .system(
                        size: 40,
                        weight: .light,
                        design: .rounded
                    )
                )
        }
    }
}

struct AmiiboDetail_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboDetail(amiibo: Amiibo.demo[6])
    }
}



