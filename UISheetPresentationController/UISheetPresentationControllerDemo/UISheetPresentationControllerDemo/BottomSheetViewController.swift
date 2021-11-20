//
//  BottomSheetViewController.swift
//  UISheetPresentationControllerDemo
//
//  Created by Pedro Rojas on 19/11/21.
//

import UIKit

class BottomSheetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let presentation = presentationController as? UISheetPresentationController {
            presentation.detents = [
                .medium(),
                .large()
            ]
            presentation.prefersGrabberVisible = true
        }
    }
}
