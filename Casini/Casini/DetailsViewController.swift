//
//  DetailsViewController.swift
//  Casini
//
//  Created by Thuy Truong Quang on 12/6/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "image")
        myScrollView.inputView?.addSubview(imageView)
        let rightItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveContext))
        navigationController?.topViewController!.navigationItem.rightBarButtonItem = rightItem
        txtName.text = text?.description
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func saveContext() {
        let alertController = self.storyboard?.instantiateViewController(withIdentifier: "AlertNotification") as! AlertNotificationViewController
        alertController.notificationText = "Successfully"
        alertController.detailsText = "We are setup all done."
        alertController.providesPresentationContextTransitionStyle = true
        alertController.definesPresentationContext = true
        alertController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        alertController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(alertController, animated: true, completion: nil)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

