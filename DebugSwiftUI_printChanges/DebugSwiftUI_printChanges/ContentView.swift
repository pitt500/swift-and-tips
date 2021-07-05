//
//  ContentView.swift
//  DebugSwiftUI_printChanges
//
//  Created by Pedro Rojas on 05/07/21.
//

import SwiftUI

enum FrequencyNotification: String, CaseIterable {
    case always = "Always"
    case onlyWhenUnlocked = "When Unlocked"
    case never = "Never"
}

struct ContentView: View {
    @State private var notificationEnabled = true
    @State private var frequency = FrequencyNotification.always
    @State private var description = ""

    var body: some View {
        let _ = Self._printChanges()

        /// In this example, frequency is not producing a new render because
        /// is not been called in the view, however, if you simply uncomment the print
        /// below, you will see that now view is rendered again, because frequency
        /// variable is changing in the view's body 🤓!
        //print(frequency)

        return NavigationView {
            Form {

                //MARK: - Profile
                Section {
                    HStack {
                        Image("Pitt")
                            .resizable()
                            .frame(width: 100, height: 100)
                        VStack(alignment: .leading) {
                            Text("Pitt")
                                .font(.largeTitle.bold())
                            Text("Swift && Tips")
                                .font(.caption.italic())
                        }
                    }

                } header: {
                    Text("Profile")
                }

                //MARK: - Description
                Section {
                    TextField(
                        "Enter your description here",
                        text: $description
                    )
                } header: {
                    Text("Description")
                }

                //MARK: - Notifications
                Section {
                    Toggle(isOn: $notificationEnabled) {
                        Text("Enable Notifications")
                    }

                    Picker(selection: $frequency, label: Text("Show Previews")) {
                        ForEach(FrequencyNotification.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .disabled(notificationEnabled == false)

                } header: {
                    Text("Notifications")
                }

                //MARK: - About
                Section {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.1")
                    }
                } header: {
                    Text("About")
                }

            }
            .navigationTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
