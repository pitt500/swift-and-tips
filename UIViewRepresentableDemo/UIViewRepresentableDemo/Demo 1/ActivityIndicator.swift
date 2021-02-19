//
//  ActivityIndicator.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 19/02/21.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    // never create properties related to the actual UIKit Object
    // Remember: Views will be recreated once we got an update.

    typealias UIViewType = UIActivityIndicatorView
    var isLoading: Bool
    var style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isLoading ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
