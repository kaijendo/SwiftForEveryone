//
//  ProcessBarView.swift
//  ProcessBar
//
//  Created by Thuy Truong Quang on 6/20/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ProcessBarView: UIView {
    // MARK: - Variables
    var bgPath: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var progrecessLayer: CAShapeLayer!
    var progress: Float = 0 {
        willSet(newValue)
        {
            progrecessLayer.strokeEnd = CGFloat(newValue)
        }
    }
    // MARK: - Functions
    private func createCirclePath() {
        let x = self.frame.width
        let y = self.frame.height
        let center = CGPoint(x: x, y: y)
        print(x,y,center)
        bgPath.addArc(withCenter: center, radius: x / CGFloat(2), startAngle: CGFloat(2 * Double.pi), endAngle: 0, clockwise: true)
        bgPath.close()
    }
    
    private func createShape() {
        // 1
        createCirclePath()
        // 2
        shapeLayer = CAShapeLayer()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.lineWidth = 15
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        
        // 3
        progrecessLayer = CAShapeLayer()
        progrecessLayer.path = bgPath.cgPath
        progrecessLayer.lineCap = kCALineCapRound
        shapeLayer.lineWidth = 15
        progrecessLayer.fillColor = nil
        progrecessLayer.strokeColor = UIColor.red.cgColor
        progrecessLayer.strokeEnd = 0.0
        
        // 4
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(progrecessLayer)
    }
    
    // MARK: - Life Circle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createShape()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        bgPath = UIBezierPath()
        self.createShape()
    }
    
}
