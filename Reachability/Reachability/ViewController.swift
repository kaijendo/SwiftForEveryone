//
//  ViewController.swift
//  Reachability
//
//  Created by Thuy Truong Quang on 12/4/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
<<<<<<< Updated upstream
    /// Variables
    var reachability: Reachability? = Reachability.networkReachabilityForInternetConnection()
    /// Outlets
    @IBOutlet weak var notificationView: UIView! {
        didSet {
            return notificationView.backgroundColor = UIColor.white
        }
    }
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var lblNotificationView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let reachability = Reachability(hostName: "www.apple.com")
        
        // Do any additional setup after loading the view, typically from a nib.
=======
    @IBOutlet weak var notificationView: Reachable!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Da vao man hinh 1")
>>>>>>> Stashed changes
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
<<<<<<< Updated upstream
        // Dispose of any resources that can be recreated.
    }
    
    @objc func reachabilityDidChange(_ notification: Notification) {
        checkReachability()
    }
    
    func checkReachability() {
        guard let r = reachability else { return }
        if r.isReachable  {

            lblNotificationView.text = "Connected"
            notificationView.backgroundColor = UIColor.green
        } else {
            lblNotificationView.text = "No internet connect"
            notificationView.backgroundColor = UIColor.red
        }
=======

>>>>>>> Stashed changes
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
        reachability?.stopNotifier()
    }
}


