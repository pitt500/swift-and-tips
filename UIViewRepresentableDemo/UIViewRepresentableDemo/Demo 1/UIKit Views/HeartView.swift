//
//  HeartView.swift
//  UIViewRepresentableDemo
//
//  Created by Pedro Rojas on 17/02/21.
//

import UIKit

class HeartButton: UIButton {

    override var isSelected: Bool {
        didSet {
            setImage(
                UIImage(
                    systemName: isSelected ? "heart.fill" : "heart"
                ),
                for: .normal
            )
        }
    }

    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        setTitle("Like", for: .normal)
        setImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = .white
        backgroundColor = .red
        semanticContentAttribute = .forceRightToLeft
        contentMode = .scaleAspectFill
        //imageEdgeInsets = .init(top: 100, left: 100, bottom: 100, right: 100)

//        translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            .init(item: self, attribute: .height, relatedBy: <#T##NSLayoutConstraint.Relation#>, toItem: <#T##Any?#>, attribute: <#T##NSLayoutConstraint.Attribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>)
//        ])

        // Add anything else for your setup ...
    }
}
