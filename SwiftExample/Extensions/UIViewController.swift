//
//  UIViewController.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/25.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

extension UIViewController {
    /// アラート表示
    ///
    /// - Parameters:
    ///   - title: タイトル
    ///   - message: メッセージ
    ///   - buttonTitle: ボタンタイトル
    ///   - action: ボタンアクション
    func showAlert(title: String = "", message: String, buttonTitle: String = "OK", action: ((UIAlertAction) -> Void)? = nil) {
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: action)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(action)
        present(ac, animated: true, completion: nil)
    }
    
    /// アラート表示（キャンセルあり）
    ///
    /// - Parameters:
    ///   - title: タイトル
    ///   - message: メッセージ
    ///   - buttonTitle: ボタンタイトル
    ///   - cancelTitle: キャンセルタイトル
    ///   - action: ボタンアクション
    ///   - cancel: キャンセルアクション
    func showAlertWithCancel(title: String = "", message: String, buttonTitle: String = "OK", cancelTitle: String = "キャンセル", action: ((UIAlertAction) -> Void)? = nil, cancel: ((UIAlertAction) -> Void)? = nil) {
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: action)
        let cencelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancel)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(okAction)
        ac.addAction(cencelAction)
        present(ac, animated: true, completion: nil)
    }
}
