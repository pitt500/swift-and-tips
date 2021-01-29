//
//  BetterView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct BetterView: View {
    @State var value: Float = 0
    var body: some View {
        Slider(value: $value)
            
    }
}

struct BetterView_Previews: PreviewProvider {
    static var previews: some View {
        BetterView()
    }
}
