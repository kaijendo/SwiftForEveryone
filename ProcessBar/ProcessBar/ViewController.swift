//
//  ViewController.swift
//  ProcessBar
//
//  Created by Thuy Truong Quang on 6/20/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBarView: ProcessBarView!
    
    var timer: Timer!
    var progressCounter:Float = 0
    let duration:Float = 10.0
    var progressIncrement:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIncrement = 1.0/duration
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showProgress), userInfo: nil, repeats: true)
    }
    @objc func showProgress() {
        if(progressCounter > 1.0){timer.invalidate()}
        progressBarView.progress = progressCounter
        progressCounter = progressCounter + progressIncrement
    }
}


