//
//  NavigationLinkNoArrow.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/18/21.
//

import SwiftUI

public struct NavigationLinkNoArrow<Content: View, Destination: View>: View {
    
    private var destination: Destination
    private var content: Content
    @State private var isActive = false
    
    public init(
        destination: @autoclosure @escaping () -> Destination,
        content: @autoclosure @escaping () -> Content
    ) {
        self.destination = destination()
        self.content = content()
    }
    
    public var body: some View {
        Button(action: { self.isActive = true }) {
            self.content
                .background(
                    NavigationLink(destination: destination, isActive: self.$isActive) {
                        EmptyView()
                    }.hidden()
                )
        }
    }
}
