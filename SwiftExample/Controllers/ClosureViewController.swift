//
//  ClosureViewController.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/25.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {

    static let storyboardName = "ClosureViewController"

    var testClosure: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        testClosure?("ButtonTapped!")
    }
}
