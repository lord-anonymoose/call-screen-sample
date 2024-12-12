//
//  CallViewModel.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 08.12.2024.
//


import UIKit
import Combine

final class CallViewModel {

    weak var coordinator: CallCoordinator?
    let name: String
    let image: UIImage
    
    init(coordinator: CallCoordinator, name: String, image: UIImage) {
        self.coordinator = coordinator
        self.name = name
        self.image = image
    }
    
    func goToCall() {
        coordinator?.start()
    }
    
    func acceptCall() {
        
    }
}
