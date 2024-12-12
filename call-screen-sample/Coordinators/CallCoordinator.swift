//
//  FakeCallCoordinatoe.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 07.12.2024.
//

import Foundation
import UIKit


protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}

extension Coordinator {
    func childDidFinish(_ coordinator : Coordinator) {
        
        for (index, child) in children.enumerated() {
            if child === coordinator {
                children.remove(at: index)
                break
            }
        }
    }
    
    func popToRootViewController() {
        navigationController.popToRootViewController(animated: true)
    }
}



final class CallCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CallViewModel(coordinator: self, name: "Name", image: UIImage(named: "userImage")!)
        let viewController = CallViewController(viewModel: viewModel)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func accepCall() {
        let viewModel = CallViewModel(coordinator: self, name: "Name", image: UIImage(named: "userImage")!)
        //let viewController = CallViewController(viewModel: <#T##CallViewModel#>)
    }
    
    func rejectCall() {
        
    }
}
