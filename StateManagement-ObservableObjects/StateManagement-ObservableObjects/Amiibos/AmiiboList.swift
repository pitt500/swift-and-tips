//
//  AmiiboList.swift
//  StateManagement-ObservableObjects
//
//  Created by Pedro Rojas on 12/23/20.
//

import SwiftUI

struct AmiiboList: View {
    
    @ObservedObject var user: User
    private let amiibos = Amiibo.demo
    
    var body: some View {
        NavigationView {
            List(amiibos) { amiibo in
                NavigationLink (
                    destination: destination(amiibo: amiibo),
                    label: { AmiiboCell(amiibo: amiibo) }
                )
            }
            .listStyle(PlainListStyle())
            .navigationBarItems(
                trailing:
                    Button(
                        action: { user.itemCounter += 1 },
                        label: {
                            Text("Add to Cart")
                        }
                    )
            )
            
            .navigationTitle("Amiibos")
        }
    }
    
    @ViewBuilder func destination(amiibo: Amiibo) -> some View {
        switch amiibo.series {
        case .zelda:
            ZeldaDetail(amiibo: amiibo)
        case .mario:
            MarioDetail(amiibo: amiibo)
        case .metroid, .other:
            AmiiboDetail(amiibo: amiibo)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AmiiboList(user: User())
    }
}
