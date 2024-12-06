//
//  RoundButtonView.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 07.11.2024.
//

import Foundation
import UIKit



final class RoundedButtonView: UIView {
    
    // MARK: - Properties
    typealias Action = () -> Void
    
    var action: Action?
    
    var image: UIImage = UIImage(systemName: "questionmark")!
    
    var buttonColor: UIColor = .clear
    
    var imageColor: UIColor = .white
    
    var height: CGFloat = 74
    
    
    
    // MARK: - Subviews
    private let button = UIButton()
    private let label = UILabel()
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        configureButton()
    }
    
    convenience init(title: String, image: UIImage, imageColor: UIColor, buttonColor: UIColor, height: CGFloat, action: @escaping Action) {
        self.init(frame: .zero)
        self.image = image
        self.imageColor = imageColor
        self.buttonColor = buttonColor
        self.height = height
        self.action = action
        configureView()
        configureButton()
        configureTitle(title: title)
    }
    
    convenience init(title: String, image: UIImage, imageColor: UIColor, buttonColor: UIColor, action: @escaping Action) {
        self.init(frame: .zero)
        self.image = image
        self.imageColor = imageColor
        self.buttonColor = buttonColor
        self.action = action
        configureView()
        configureButton()
        configureTitle(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Actions
    @objc private func buttonTapped() {
        print("Hello, world!")
        action?()  // Вызываем действие, если оно установлено
    }
    
    
    
    // MARK: - Private
    private func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: height)
        ])
    }
    
    
    private func configureButton() {
        button.setImage(image, for: .normal)
        button.tintColor = imageColor

        let backgroundImage = UIImage.from(color: buttonColor)
        button.setBackgroundImage(backgroundImage, for: .normal)
        button.layer.cornerRadius = height / 2

        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        addSubview(button)

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.widthAnchor.constraint(equalToConstant: height),
            button.heightAnchor.constraint(equalToConstant: height),
        ])
    }
    
    private func configureTitle(title: String) {
        label.text = title
        label.font = .systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: bottomAnchor, constant: 8),
            label.heightAnchor.constraint(equalToConstant: 16),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
