//
//  NavigationLinkNoArrow.swift
//  AwesomeQuotes
//
//  Created by Pedro Rojas on 1/18/21.
//

import SwiftUI

public struct NavigationLinkNoArrow<Content: View, Destination: View, V: Hashable>: View {
    
    private var destination: Destination
    private var content: Content
    @Binding private var selected: V?
    private let tag: V
    
    
    public init(
        destination: @autoclosure @escaping () -> Destination,
        content: @autoclosure @escaping () -> Content,
        selected: Binding<V?>,
        tag: V
    ) {
        self.destination = destination()
        self.content = content()
        self._selected = selected
        self.tag = tag
    }
    
    public var body: some View {
        self.content
            .background(
                NavigationLink(destination: destination, tag: tag, selection: $selected, label: { EmptyView() })
            )
    }
}
