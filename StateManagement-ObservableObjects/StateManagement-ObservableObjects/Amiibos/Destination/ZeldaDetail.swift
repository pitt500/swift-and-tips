
import SwiftUI

struct ZeldaDetail: View {
    let amiibo: Amiibo
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Image("zelda")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
                .opacity(0.4)
                
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
                            design: .monospaced
                        )
                    )
                    .foregroundColor(.white)
                    .padding(.top, 20)
            }
        }
    }
}

struct ZeldaDetail_Previews: PreviewProvider {
    static var previews: some View {
        ZeldaDetail(amiibo: Amiibo.demo[2])
    }
}



