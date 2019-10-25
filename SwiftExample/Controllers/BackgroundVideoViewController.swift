//
//  BackgroundVideoViewController.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/26.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit
import AVFoundation

class BackgroundVideoViewController: UIViewController {

    static let storyboardName = "BackgroundVideoViewController"
    private var player: AVPlayer?
    private var observer: NSObjectProtocol?
    
    deinit {
        // 画面が破棄された時に監視をやめる
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player?.play()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player?.pause()
    }
}

extension BackgroundVideoViewController {
    private func setupVideo() {
        guard let path = Bundle.main.path(forResource: "sample", ofType: "mp4") else { return }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        player?.actionAtItemEnd = .none
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspect
        view.layer.insertSublayer(playerLayer, at: 0)

        //  最後まで再生したら最初から再生する
        observer = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player?.currentItem,
            queue: .main) { [weak playerLayer] _ in
                playerLayer?.player?.seek(to: CMTime.zero)
                playerLayer?.player?.play()
        }
    }
}
