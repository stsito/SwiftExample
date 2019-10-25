//
//  BarChartView.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/26.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class BarChartView: UIView {

    var barColor: UIColor!
    var barBackgroundColor: UIColor!
    var textColor: UIColor!
    var valueFontSize: CGFloat!
    var unitFontSize: CGFloat!
    var animationTime: CGFloat!
    var rate: Int!
    var isAnimation: Bool!
    
    private var endValueString: String!
    private var endValue: CGFloat!
    private var barView: UIView!
    private var baseView: UIView!
    private var valueLabel: UILabel!
    private var percnetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.settingInit()
    }
    
    /// バー描画
    func drewBar() {
        self.endValue = CGFloat(self.rate) / 100.0
        self.endValueString = String(format:"%d", self.rate)
        self.backgroundColor = self.barBackgroundColor;
        self.drawAnimation()
        self.makeLabel()
    }

    
    //  MARK: - PrivateMethod
    /// 初期設定
    private func settingInit() {
        self.barColor = UIColor.init(red: 0.8, green: 0.1, blue: 0.28, alpha: 1.0)
        self.barBackgroundColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        self.textColor = UIColor.black
        self.valueFontSize = 18.0
        self.unitFontSize = 10.0
        self.animationTime = 2.0
    }

    /// ラベル作成
    private func makeLabel() {
        //  基底ビュー
        if self.baseView != nil {
            self.baseView.removeFromSuperview()
        }
        self.baseView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        self.baseView.backgroundColor = UIColor.clear
        
        //  値ビュー
        if self.valueLabel != nil {
            self.valueLabel.removeFromSuperview()
        }
        self.valueLabel = UILabel()
        self.valueLabel.backgroundColor = UIColor.clear
        self.valueLabel.font = UIFont.systemFont(ofSize: self.valueFontSize)
        self.valueLabel.text = self.endValueString
        self.valueLabel.textColor = self.textColor
        self.valueLabel.sizeToFit()
        self.baseView.addSubview(self.valueLabel)
        
        //  パーセント
        if self.percnetLabel != nil {
            self.percnetLabel.removeFromSuperview()
        }
        self.percnetLabel = UILabel()
        self.percnetLabel.backgroundColor = UIColor.clear;
        self.percnetLabel.font = UIFont.systemFont(ofSize: self.unitFontSize)
        self.percnetLabel.text = "%"
        self.percnetLabel.textColor = self.textColor
        self.percnetLabel.sizeToFit()
        self.percnetLabel.frame = CGRect(x: valueLabel.frame.maxX, y: valueLabel.frame.maxY - 15, width: percnetLabel.frame.size.width, height: percnetLabel.frame.size.height);
        self.baseView.addSubview(self.percnetLabel)

        self.baseView.frame  = CGRect(x: 0, y: 0, width: valueLabel.frame.size.width + percnetLabel.frame.size.width, height: valueLabel.frame.size.height);
        self.baseView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2);
        self.addSubview(self.baseView)
    }
    
    /// アニメーション描画
    private func drawAnimation() {
        //  バー
        if self.barView != nil {
            self.barView.removeFromSuperview()
        }
        self.barView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.frame.size.height))
        self.barView.backgroundColor = self.barColor;
        self.addSubview(self.barView)
        
        //  アニメーション有無
        if self.isAnimation == true {
            UIView.animate(
                withDuration: Double(self.animationTime * self.endValue),
                delay:0.0,
                options:UIView.AnimationOptions.curveEaseOut,
                animations: {() -> Void in
                    self.barView.frame = CGRect(x: 0, y: 0, width: (self.frame.size.width * self.endValue), height: self.frame.size.height);
                },
                completion: nil
            );
        }else {
            self.barView.frame = CGRect(x: 0, y: 0, width: (self.frame.size.width * self.endValue), height: self.frame.size.height);
        }
    }
}
