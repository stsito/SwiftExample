//
//  PieChartViewController.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/26.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class PieChartViewController: UIViewController {

    static let storyboardName = "PieChartViewController"
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  円グラフ
        self.pieChartView.rate = 60
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //  円グラフ描画
        self.pieChartView.drawPie()
    }
}
