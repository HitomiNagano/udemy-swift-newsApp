//
//  LoginMovieViewController.swift
//  Swift5IntroApp1
//
//  Created by Hitomi Nagano on 2021/04/14.
//

import UIKit
import AVFoundation

class LoginMovieViewController: UIViewController {
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "bg_movie", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        // AVPlayer 用の layer を生成
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        view.layer.insertSublayer(playerLayer, at: 0)
        
        // 動画をループ再生させる
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { (_) in
            self.player.seek(to: .zero)
            self.player.play()
        }
        player.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func login(_ sender: Any) {
        player.pause()
    }
}
