//
//  BarChartViewController.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/26.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class BarChartViewController: UIViewController {

    static let storyboardName = "BarChartViewController"
    @IBOutlet weak var barChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  棒グラフ
        self.barChartView.rate = 65;
        self.barChartView.barBackgroundColor = UIColor.lightGray;
        self.barChartView.isAnimation = true
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //  棒グラフ描画        
        self.barChartView.drewBar()
    }
}
