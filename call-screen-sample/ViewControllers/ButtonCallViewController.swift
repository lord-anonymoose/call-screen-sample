//
//  ViewController.swift
//  call-screen-sample
//
//  Created by Philipp Lazarev on 05.11.2024.
//

import UIKit
import AVFoundation

class ButtonCallViewController: UIViewController {

    
    
    // MARK: Properties
    var player: AVAudioPlayer?

    var hideStatusBar: Bool = false {
        didSet {
            self.navigationController?.setNavigationBarHidden(hideStatusBar, animated: false)
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var prefersStatusBarHidden: Bool {
        return hideStatusBar
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return hideStatusBar
    }
    
    
    // MARK: Subviews
    private lazy var hideView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        let color = UIColor(hex: "EB5545")!
        let button = RoundedButtonView(title: "Decline", image: image, imageColor: .white, buttonColor: color, action: { print("No cry")})
        return button
    }()
    
    private lazy var acceptButton: RoundedButtonView = {
        let configuration = UIImage.SymbolConfiguration(pointSize: 32, weight: .bold)
        let image = UIImage(systemName: "phone.fill")!.withConfiguration(configuration)
        let color = UIColor(hex: "67CE67")!
        let button = RoundedButtonView(title: "Accept", image: image, imageColor: .white, buttonColor: color, action: { let vc = UIViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        })
        return button
    }()

    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addSubviews()
        setupConstraints()
        setupNotificationObservers()
        hideCall()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.showCall()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed {
            // TODO: Do your stuff here.
            print("Dismissed")
        }
    }
    
    
    // MARK: Private
    private func setupUI() {
    }
    
    private func addSubviews() {
        view.addSubview(hideView)
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        view.addSubview(declineButton)
        view.addSubview(acceptButton)
    }
    
    private func setupConstraints() {
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            hideView.topAnchor.constraint(equalTo: view.topAnchor),
            hideView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hideView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hideView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            declineButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -74),
            declineButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 37),
            
            acceptButton.bottomAnchor.constraint(equalTo: declineButton.bottomAnchor),
            acceptButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -37)
        ])
    }
    
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleDidEnterBackground),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
    }
    
    private func showCall() {
        playRingtone()
        hideView.isHidden = true
        backgroundImageView.isHidden = false
        declineButton.isHidden = false
        acceptButton.isHidden = false
        self.hideStatusBar = false
    }
    
    private func hideCall() {
        stopRingtone()
        self.hideStatusBar = true
        hideView.isHidden = false
        backgroundImageView.isHidden = true
        declineButton.isHidden = true
        acceptButton.isHidden = true
        self.hideStatusBar = true
    }
    
    private func playRingtone() {
        guard let url = Bundle.main.url(forResource: "Marimba", withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            self.player = try AVAudioPlayer(contentsOf: url)  // Используем свойство класса player
            player?.play()  // Воспроизводим звук
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func stopRingtone() {
        player?.stop()
    }
    
    @objc private func handleDidEnterBackground() {
        stopRingtone()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
