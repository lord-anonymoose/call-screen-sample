//
//  ViewController.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 05.11.2024.
//

import UIKit

class ButtonCallViewController: UIViewController {

    // MARK: - Subviews
    private lazy var backgroundImageView: UIImageView = {
        let image = UIImage(named: "userImage") ?? UIImage(systemName: "pencil")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var declineButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 32, weight: .bold)
        let image = UIImage(systemName: "phone.down.fill")!.withConfiguration(configuration)
        let color = UIColor.red //UIColor(hex: "EB5545")!
        let button = RoundedButtonView(image: image, imageColor: .white, buttonColor: color, action: {})
        return button
    }()
    
    private lazy var acceptButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 32, weight: .bold)
        let image = UIImage(systemName: "phone.fill")!.withConfiguration(configuration)
        let color = UIColor.green//UIColor(hex: "67CE67")!
        let button = RoundedButtonView(image: image, imageColor: .white, buttonColor: color, action: {})
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addSubviews()
        setupConstraints()
    }

    // MARK: - Private
    private func setupUI() {
        //view.backgroundColor = .green
    }
    
    private func addSubviews() {
        // Добавляем backgroundImageView на view и задаем его ограничения
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        view.addSubview(acceptButton)
    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            acceptButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -37),
            acceptButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 37),
        ])
    }
}
