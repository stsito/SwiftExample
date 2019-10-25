//
//  UIView.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/26.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

extension UIView {
    /// フェードイン
    ///
    /// - Parameters:
    ///   - duration: アニメーション時間
    ///   - completed: 終了時のクロージャー
    func fadeIn(duration: TimeInterval, completed: (() -> ())? = nil) {
        alpha = 0
        isHidden = false
        UIView.animate(
            withDuration: duration,
            animations: {
                self.alpha = 1
        }) { finished in
            completed?()
        }
    }
    
    /// フェードアウト
    ///
    /// - Parameters:
    ///   - duration: アニメーション時間
    ///   - completed: 終了時のクロージャー
    func fadeOut(duration: TimeInterval, completed: (() -> ())? = nil) {
        UIView.animate(
            withDuration: duration,
            animations: {
                self.alpha = 0
        }) { [weak self] finished in
            self?.isHidden = true
            self?.alpha = 1
            completed?()
        }
    }
}
