//
//  RoundButtonView.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 07.11.2024.
//

import Foundation
import UIKit



final class RoundedButtonView: UIButton {
    
    // MARK: - Properties
    typealias Action = () -> Void
    
    var action: Action?
    
    var image: UIImage = UIImage(systemName: "questionmark")!
    
    var buttonColor: UIColor = .clear
    
    var imageColor: UIColor = .white
    
    var height: CGFloat = 74
    
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureButton()
    }
    
    convenience init(image: UIImage, imageColor: UIColor, buttonColor: UIColor, height: CGFloat, action: @escaping Action) {
        self.init(frame: .zero)
        self.image = image
        self.imageColor = imageColor
        self.buttonColor = buttonColor
        self.height = height
        self.action = action
        configureButton()
    }
    
    convenience init(image: UIImage, imageColor: UIColor, buttonColor: UIColor, action: @escaping Action) {
        self.init(frame: .zero)
        self.image = image
        self.imageColor = imageColor
        self.buttonColor = buttonColor
        self.action = action
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Private
    private func configureButton() {
        setImage(image, for: .normal)
        tintColor = imageColor

        let backgroundImage = UIImage.from(color: buttonColor)
        setBackgroundImage(backgroundImage, for: .normal)
        layer.cornerRadius = height / 2

        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        contentMode = .scaleAspectFill

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: height),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
