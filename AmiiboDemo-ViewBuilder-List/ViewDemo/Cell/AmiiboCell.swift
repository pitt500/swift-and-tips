
import SwiftUI

struct AmiiboCell: View {
    let amiibo: Amiibo
    
    var body: some View {
        HStack {
            Image(amiibo.imageName)
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(amiibo.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}

struct AmiiboCell_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboCell(amiibo: Amiibo.demo[0])
    }
}
