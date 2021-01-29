//
//  MaxView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

// ViewBuilder is unable to handle more than 10 views in the same stack
struct MaxLimitView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")

            //Uncomment this line and project won't compile!
            //Text("Hello")
        }
    }
}

struct MaxView_Previews: PreviewProvider {
    static var previews: some View {
        MaxLimitView()
    }
}
