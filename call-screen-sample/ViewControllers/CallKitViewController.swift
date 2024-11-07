//
//  CallKitViewController.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 07.11.2024.
//

//import Foundation
import UIKit
import CallKit

class CallKitViewController: UIViewController, CXProviderDelegate {

    override func viewDidLoad() {
        sleep(5)
        let configuration = CXProviderConfiguration()
        let provider = CXProvider(configuration: configuration)
        provider.setDelegate(self, queue: nil)
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "John Appleseed")
        provider.reportNewIncomingCall(with: UUID(), update: update, completion: { error in })
    }

    func providerDidReset(_ provider: CXProvider) {
    }

    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }

}
