//
//  MainAmiiboView.swift
//  StateManagement-ObservableObjects
//
//  Created by Pedro Rojas on 12/23/20.
//

import SwiftUI

enum TabSelection: Hashable {
    case list
    case settings
}

struct MainAmiiboView: View {
    @State private var tabSelection: TabSelection = .list
    @StateObject private var user = User()
    
    var body: some View {
        TabView(selection: $tabSelection) {
            AmiiboList(user: user)
                .tabItem {
                    Image(systemName: "star")
                    Text("List")
                }
                .tag(TabSelection.list)
            Settings(user: user)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Settings")
                }
                .tag(TabSelection.settings)
        }
    }
}

struct MainAmiiboView_Previews: PreviewProvider {
    static var previews: some View {
        MainAmiiboView()
    }
}
