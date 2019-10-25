//
//  BackgroundAnimationViewController.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/26.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class BackgroundAnimationViewController: UIViewController {

    static let storyboardName = "BackgroundAnimationViewController"
    static let animationSpeed = 2.0
    private var backgroundImages = [UIImage]()
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  背景画像
        while let backgroundImage = UIImage(named: "background00\(backgroundImages.count+1)") {
            backgroundImages.append(backgroundImage)
        }
        backgroundImageView.image = backgroundImages[0]
        changeAnimation(imageIndex: 0)
    }
}

extension BackgroundAnimationViewController {
    /// 画像切り替え
    /// - Parameter imageIndex: 画像インデックス
    private func changeAnimation(imageIndex: Int) {
        backgroundImageView.fadeOut(duration: BackgroundAnimationViewController.animationSpeed) { [weak self] in
            guard let maxImageCount = self?.backgroundImages.count else { return }
            var image = 0
            if imageIndex < maxImageCount - 1 {
                image = imageIndex + 1
            }
            
            self?.backgroundImageView.image = self?.backgroundImages[image]
            self?.backgroundImageView.fadeIn(duration: BackgroundAnimationViewController.animationSpeed) { [weak self] in
                //  繰り返し
                self?.changeAnimation(imageIndex: image)
            }
        }
    }
}
