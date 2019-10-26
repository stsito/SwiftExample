//
//  PieChartView.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/26.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class PieChartView: UIView, CAAnimationDelegate {
    ///  円グラフ色
    var pieColor = UIColor.systemRed
    ///  円グラフ背景色
    var pieBackgroundColor = UIColor.systemGray
    ///  テキスト色
    var textColor = UIColor.systemGreen
    ///  アニメーションスピード
    var animationTime = CGFloat(2.0)
    ///  値のフォントサイズ
    var valueFontSize = CGFloat(18.0)
    ///  パーセントのフォントサイズ
    var percnetFontSize = CGFloat(10.0)
    ///  円グラフ幅
    var pielineWidth = CGFloat(12.0)
    ///  値
    var rate = 0
    /// アニメーションフラグ
    var isAnimation = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// 円グラフ描画
    func drawPie() {
        if self.rate > 100 {
            return
        }
        self.makeLabel()
        self.drawAnimation()
    }
}

// MARK: - PrivateMethod
extension PieChartView {
    /// ラベル作成
    private func makeLabel() {
        //  値ラベル
        let valueLabel = UILabel()
        valueLabel.backgroundColor = UIColor.clear
        valueLabel.font = UIFont.systemFont(ofSize: valueFontSize)
        valueLabel.text = String(format:"%d", rate)
        valueLabel.textColor = UIColor.darkGray
        valueLabel.sizeToFit()
        valueLabel.center = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2 - 5)
        self.addSubview(valueLabel)
        
        //  パーセントラベル
        let percnetLabel = UILabel()
        percnetLabel.backgroundColor = UIColor.clear
        percnetLabel.font = UIFont.systemFont(ofSize: percnetFontSize)
        percnetLabel.text = "%"
        percnetLabel.textColor = UIColor.darkGray
        percnetLabel.sizeToFit()
        percnetLabel.frame = CGRect(
            x: valueLabel.frame.minX + ((valueLabel.frame.size.width - percnetLabel.frame.size.width) / 2),
            y: valueLabel.frame.maxY - 4,
            width: percnetLabel.frame.size.width,
            height: percnetLabel.frame.size.height)
        self.addSubview(percnetLabel)
    }

    /// アニメーション描画
    private func drawAnimation() {
        //  背景色
        self.backgroundColor = UIColor.clear

        // 半径
        let radius = self.frame.size.width / 2 - pielineWidth / 2

        // 背景の円を生成
        let backRect = CGRect(x: pielineWidth / 2, y: pielineWidth / 2, width: 2.0 * radius, height: 2.0 * radius)
        let backCircle = CAShapeLayer()
        backCircle.path = UIBezierPath(roundedRect: backRect, cornerRadius: radius).cgPath
        backCircle.fillColor = UIColor.clear.cgColor
        backCircle.strokeColor = pieBackgroundColor.cgColor
        backCircle.lineWidth = pielineWidth
        self.layer.addSublayer(backCircle)
        
        // 円グラフを生成
        let circleRect = CGRect(x: pielineWidth / 2, y: pielineWidth / 2, width: 2.0 * radius, height: 2.0 * radius)
        let circle = CAShapeLayer()
        circle.path = UIBezierPath(roundedRect: circleRect, cornerRadius: radius).cgPath
        circle.fillColor = UIColor.clear.cgColor
        circle.strokeColor = pieColor.cgColor
        circle.lineWidth = pielineWidth
        self.layer.addSublayer(circle)
        
        //  アニメーション
        var endValue = CGFloat(rate) / 100.0
        if endValue > 1.0 {
            endValue = 1.0
        }
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        if !isAnimation {
            drawAnimation.beginTime = 1
        }
        drawAnimation.delegate = self
        drawAnimation.duration = CFTimeInterval(animationTime * endValue)
        drawAnimation.fromValue = NSNumber(value: 0.0)
        drawAnimation.toValue = NSNumber(value: Float(endValue))
        drawAnimation.fillMode = CAMediaTimingFillMode.forwards
        drawAnimation.isRemovedOnCompletion = false
        drawAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

        circle.add(drawAnimation, forKey: "drawCircleAnimation")
    }
}
