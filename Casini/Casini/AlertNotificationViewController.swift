//
//  AlertNotificationViewController.swift
//  Casini
//
//  Created by Thuy Truong Quang on 12/7/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class AlertNotificationViewController: UIViewController {
    // MARK: - Properties
    /// Variables
    var notificationText = ""
    var detailsText = ""
    /// Outlets
    @IBOutlet weak var lblNotofication: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var btnDismiss: UIButton!
    @IBOutlet weak var viewAlert: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAlert.layer.cornerRadius = 20
        btnDismiss.addTarget(self, action: #selector(dismissVC), for: .allEvents)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.lblDetails.text = detailsText
        self.lblNotofication.text = notificationText
    }
    
    // MARK: - Function
    @objc
    func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc
    func didTappedOnBackgroundView() {
        self.dismiss(animated: true, completion: nil)
    }
}
