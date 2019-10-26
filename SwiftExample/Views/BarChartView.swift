//
//  BarChartView.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/26.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class BarChartView: UIView {

    ///  棒グラフ色
    var barColor = UIColor.systemRed
    ///  テキスト色
    var textColor = UIColor.systemGreen
    ///  値のフォントサイズ
    var valueFontSize = CGFloat(18.0)
    ///  パーセントのフォントサイズ
    var percnetFontSize = CGFloat(10.0)
    ///  アニメーションスピード
    var animationTime = CGFloat(2.0)
    ///  値
    var rate = 0
    ///  アニメーションフラグ
    var isAnimation = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// バー描画
    func drewBar() {
        drawAnimation()
        makeLabel()
    }
}

//  MARK: - PrivateMethod
extension BarChartView {
    /// ラベル作成
    private func makeLabel() {
        //  値
        let valueLabel = UILabel()
        valueLabel.backgroundColor = UIColor.clear
        valueLabel.font = UIFont.systemFont(ofSize: valueFontSize)
        valueLabel.text = String(format:"%d", rate)
        valueLabel.textColor = self.textColor
        valueLabel.sizeToFit()
        
        //  パーセント
        let percnetLabel = UILabel()
        percnetLabel.backgroundColor = UIColor.clear
        percnetLabel.font = UIFont.systemFont(ofSize: percnetFontSize)
        percnetLabel.text = "%"
        percnetLabel.textColor = self.textColor
        percnetLabel.sizeToFit()
        percnetLabel.frame = CGRect(
            x: valueLabel.frame.maxX,
            y: valueLabel.frame.maxY - 15,
            width: percnetLabel.frame.size.width,
            height: percnetLabel.frame.size.height)

        //  基底
        let baseView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        baseView.backgroundColor = UIColor.clear
        baseView.addSubview(valueLabel)
        baseView.addSubview(percnetLabel)
        baseView.frame = CGRect(
            x: 0,
            y: 0,
            width: valueLabel.frame.size.width + percnetLabel.frame.size.width,
            height: valueLabel.frame.size.height)
        baseView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)

        self.addSubview(baseView)
    }
    
    /// アニメーション描画
    private func drawAnimation() {
        //  バー
        let barView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.frame.size.height))
        barView.backgroundColor = barColor
        self.addSubview(barView)
        
        //  アニメーション有無
        let endValue = CGFloat(rate) / 100.0
        let width = self.frame.size.width * endValue
        let height = self.frame.size.height

        if isAnimation {
            UIView.animate(
                withDuration: Double(animationTime * endValue),
                delay:0.0,
                options:UIView.AnimationOptions.curveEaseOut,
                animations: {
                    barView.frame = CGRect(x: 0, y: 0, width: width, height: height)
                },
                completion: nil
            )
        } else {
            barView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        }
    }
}
