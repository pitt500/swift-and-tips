//
//  GesturesDemo.swift
//  DragGesture_SwiftUI
//
//  Created by Pedro Rojas on 10/01/22.
//

import SwiftUI

struct GesturesDemo: View {
    //@GestureState var location = CGPoint(x: 100, y: 100)
    @State var location = CGPoint(x: 100, y: 100)

    var body: some View {
        Circle()
            .fill(.red)
            .frame(width: 100, height: 100)
            .position(location)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.location = value.location
                    }
                    .onEnded { value in
                        withAnimation {
                            self.location = CGPoint(x: 100, y: 100)

                        }

                    }
//                    .updating(
//                        self.$location
//                    ) { value, location, transaction in
//                        location = value.location
//                    }

            )
    }
}

struct GesturesDemo_Previews: PreviewProvider {
    static var previews: some View {
        GesturesDemo()
    }
}
