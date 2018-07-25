//
//  CustomTableViewLoad.swift
//  CustomTableViewLoad
//
//  Created by Thuy Truong Quang on 7/25/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class CustomTableViewLoad: NSObject {
    // MARK: - Variables
    private var tableView: UITableView!
    private var cellIdentifier: String = ""
    private var gradientMask: CAGradientLayer!
    private var isAnimation: Bool = false
    private var sourceViewController: UIViewController!
    private var heightCell: CGFloat = 50
    
    // MARK: - Life circle
    override init() {
        super.init()
    }
    init(tableView: UITableView, cellIdentifier: String, sourceViewController: UIViewController, heightCell: CGFloat = 50) {
        self.tableView = tableView
        self.cellIdentifier = cellIdentifier
        self.sourceViewController = sourceViewController
        self.heightCell = heightCell
    }
    
    // MARK: - Functions
    func startAnimation() {
        gradientMask = CAGradientLayer()
        gradientMask.frame = self.tableView.bounds
        addGradientToView(view: self.tableView)
        isAnimation = true
        if tableView != nil {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.reloadData()
        } else {
            fatalError("Error to initialize the table view.")
        }
    }
    
    func stopAnimation() {
        gradientMask.removeAllAnimations()
        gradientMask = nil
        isAnimation = false
        if tableView != nil {
            self.tableView.dataSource = self.sourceViewController as? UITableViewDataSource
            self.tableView.delegate = self.sourceViewController as? UITableViewDelegate
            self.tableView.reloadData()
        }
    }
    
    func addGradientToView(view: UIView, transparency:CGFloat = 0.6, gradientWidth:CGFloat = 100) {
        if gradientMask != nil {
            gradientMask.removeAnimation(forKey: "rotation")
        }
        let gradientSize = gradientWidth / view.frame.size.width
        let gradientColor = UIColor(white: 1, alpha: transparency)
        let startLocations = [0, gradientSize / 2, gradientSize]
        let endLocations = [(1 - gradientSize), (1 - gradientSize / 2), 1]
        let animation = CABasicAnimation(keyPath: "locations")
        
        gradientMask.colors = [gradientColor.cgColor, UIColor.white.cgColor, gradientColor.cgColor]
        gradientMask.locations = startLocations as [NSNumber]?
        gradientMask.startPoint = CGPoint(x: 0 - (gradientSize * 2), y: 0.5)
        gradientMask.endPoint = CGPoint(x: 1 + gradientSize, y: 0.5)
        
        view.layer.mask = gradientMask
        animation.fromValue = startLocations
        animation.toValue = endLocations
        animation.repeatCount = HUGE
        animation.duration = 2
        
        gradientMask.add(animation, forKey: "rotation")
        
    }
}

extension CustomTableViewLoad: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        sourceViewController.configrationEmpty(cell, at: indexPath)
        
        return cell
    }
}

extension CustomTableViewLoad: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension UIViewController {
    @objc func configrationEmpty(_ cell: UITableViewCell, at indexPath: IndexPath) {
        print("Custom tableview cell")
    }
}
