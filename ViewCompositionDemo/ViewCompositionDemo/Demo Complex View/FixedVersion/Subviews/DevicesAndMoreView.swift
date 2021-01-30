//
//  DevicesAndMoreView.swift
//  ViewCompositionDemo
//
//  Created by Pedro Rojas on 29/01/21.
//

import SwiftUI

struct DevicesAndMoreView: View {
    var body: some View {
        HStack (alignment: .bottom){
            Image(systemName: "tv.and.hifispeaker.fill")
            Spacer()
            Image(systemName: "list.triangle")
        }
        .foregroundColor(.white)
    }
}

struct DevicesAndMoreView_Previews: PreviewProvider {
    static var previews: some View {
        DevicesAndMoreView()
    }
}
