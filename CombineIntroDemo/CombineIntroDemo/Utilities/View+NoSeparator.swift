//
//  View+NoSeparator.swift
//  CombineIntroDemo
//
//  Created by Pedro Rojas on 04/05/21.
//

import SwiftUI

extension View {
  @ViewBuilder public func noSeparators(
    edgeInsets: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0),
    color: Color
  ) -> some View {
        self
        .padding(edgeInsets)
        .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 44,
          alignment: .leading
        )
        .listRowInsets(EdgeInsets())
        .background(color)
    }
}
