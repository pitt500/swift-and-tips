
import SwiftUI

struct TipView: View {
    
    var body: some View {
        List(0..<12) { index in
            renderView(index)
        }
    }
    
    func renderView(_ n: Int) -> some View {
        if n % 2 == 0 {
            return AnyView(Color.red)
        } else {
            return AnyView(Color.blue)
        }
        
    }
}

struct TipView_Previews: PreviewProvider {
    static var previews: some View {
        TipView()
    }
}
