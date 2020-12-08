
import SwiftUI

struct MarioDetail: View {
    let amiibo: Amiibo
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Image("mario")
                .resizable()
                .opacity(0.7)
            VStack {
                Text(amiibo.name)
                    .font(
                        .system(
                            size: 50,
                            weight: .bold
                        )
                    )
                    .foregroundColor(.white)
                    .padding(.top, 20)
                Image(amiibo.imageName)
                    .resizable()
                    .frame(maxWidth: 350, maxHeight: 350)
                    .aspectRatio(contentMode: .fill)
                Spacer()
            }
        }
    }
}

struct MarioDetail_Previews: PreviewProvider {
    static var previews: some View {
        MarioDetail(amiibo: Amiibo.demo[5])
    }
}

