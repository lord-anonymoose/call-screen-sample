//
//  UISymbolButton.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 13.12.2024.
//

import UIKit

final class UISymbolButton: UIButton {
    required init(image: UIImage, tintColor: UIColor) {
        super.init(frame: .zero)
        setImage(image, for: .normal)
        self.tintColor = tintColor
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
