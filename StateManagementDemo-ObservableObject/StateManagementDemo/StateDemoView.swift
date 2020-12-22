

import SwiftUI

struct StateDemoView: View {
    @State private var isDay = false
    
    var body: some View {
        ChildView(isDay: $isDay)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ChildView: View {
    @Binding var isDay: Bool
    
    var body: some View {
        ZStack {
            if isDay {
                Color(red: 107/255, green: 136/255, blue: 254/255)
            } else {
                Color.black
            }
            VStack {
                Image(isDay ? "day" : "night")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Toggle("Change time", isOn: $isDay)
                    .frame(width: 300)
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
    }
}

struct StateDemoView_Previews: PreviewProvider {
    static var previews: some View {
        StateDemoView()
    }
}
