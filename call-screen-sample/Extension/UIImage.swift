//
//  UIImage.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 08.11.2024.
//

import UIKit



extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let size = CGSize(width: 1, height: 1)
        return UIGraphicsImageRenderer(size: size).image(actions: { (context) in
            context.cgContext.setFillColor(color.cgColor)
            context.fill(.init(origin: .zero, size: size))
        })
    }
}
