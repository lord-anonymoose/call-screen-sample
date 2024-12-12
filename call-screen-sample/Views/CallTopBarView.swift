//
//  CallTopBarView.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 13.12.2024.
//

import UIKit

final class CallTopBarView: UIView {
        
    lazy var recordButton: UISymbolButton = {
        let config = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let image = UIImage(systemName: "waveform.badge.plus", withConfiguration: config)!
        let button = UISymbolButton(image: image, tintColor: .white)
        return button
    }()
    
    lazy var infoButton: UISymbolButton = {
        let config = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold, scale: .large)
        let image = UIImage(systemName: "info.circle", withConfiguration: config)!
        let button = UISymbolButton(image: image, tintColor: .white)
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
        addSubview(recordButton)
        addSubview(infoButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            recordButton.topAnchor.constraint(equalTo: topAnchor),
            recordButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            recordButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            recordButton.widthAnchor.constraint(equalToConstant: 50),
            
            infoButton.topAnchor.constraint(equalTo: topAnchor),
            infoButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            infoButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
