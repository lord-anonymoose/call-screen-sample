//
//  CallActionBoxView.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 13.12.2024.
//

import UIKit

final class CallActionBoxView: UIView {
    
    let buttonColor = UIColor.systemGray.withAlphaComponent(0.5)
        
    private lazy var audioButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold)
        let image = UIImage(systemName: "speaker.wave.2.fill")!.withConfiguration(configuration)
        let button = RoundedButtonView(title: "Audio", image: image, imageColor: .white, buttonColor: buttonColor, action: {
            print("audioButton Tapped")
        })
        return button
    }()
    
    private lazy var faceTimeButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold)
        let image = UIImage(systemName: "questionmark.video.fill")!.withConfiguration(configuration)
        let button = RoundedButtonView(title: "FaceTime", image: image, imageColor: .white, buttonColor: buttonColor, action: {
            print("faceTimeButton Tapped")
        })
        return button
    }()
    
    private lazy var muteButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold)
        let image = UIImage(systemName: "mic.slash.fill")!.withConfiguration(configuration)
        let button = RoundedButtonView(title: "Mute", image: image, imageColor: .white, buttonColor: buttonColor, action: {
            print("muteButton Tapped")
        })
        return button
    }()
    
    private lazy var addButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold)
        let image = UIImage(systemName: "person.crop.circle")!.withConfiguration(configuration)
        let button = RoundedButtonView(title: "Add", image: image, imageColor: .white, buttonColor: buttonColor, action: {
            print("addButton Tapped")
        })
        return button
    }()
    
    lazy var endButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold)
        let image = UIImage(systemName: "phone.down.fill")!.withConfiguration(configuration)
        let color = UIColor(hex: "EB5545")!
        let button = RoundedButtonView(title: "Decline", image: image, imageColor: .white, buttonColor: color, action: { print("No cry")})
        return button
    }()
    
    private lazy var keypadButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 27, weight: .bold)
        let image = UIImage(systemName: "circle.grid.3x3.fill")!.withConfiguration(configuration)
        let button = RoundedButtonView(title: "Keypad", image: image, imageColor: .white, buttonColor: buttonColor, action: {
            print("keypadButton Tapped")
        })
        return button
    }()

    
    required init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(audioButton)
        addSubview(faceTimeButton)
        addSubview(muteButton)
        addSubview(addButton)
        addSubview(endButton)
        addSubview(keypadButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            audioButton.topAnchor.constraint(equalTo: topAnchor),
            audioButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            faceTimeButton.topAnchor.constraint(equalTo: topAnchor),
            faceTimeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            muteButton.topAnchor.constraint(equalTo: topAnchor),
            muteButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            endButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            endButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            keypadButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            keypadButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

