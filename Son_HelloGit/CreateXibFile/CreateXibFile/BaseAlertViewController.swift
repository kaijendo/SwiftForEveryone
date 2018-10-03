//
//  BaseAlertViewController.swift
//  CreateXibFile
//
//  Created by Thuy Truong Quang on 10/3/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class BaseAlertViewController: UIViewController {
    // MARK: - Properties
    /// Check valid of textfiled, if texfied is valid then enable button or else.
    var isValid: Bool = false {
        didSet {
            isValid ? (myButton.isUserInteractionEnabled = true) : (myButton.isUserInteractionEnabled = false)
        }
    }

    // MARK: - Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myButton: UIButton! {
        didSet {
            myButton.isUserInteractionEnabled = false
        }
    }
    
    // MARK: - IBActions
    @IBAction func myButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
     // 1 - Registraion xib file
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func prepareUI() {
        // Add action of text Field.
        textField.addTarget(self, action: Selector.textFieldDidChanged, for: .editingChanged)
    }
    
    /// Check valid of textField when tex filed changed value
    ///
    /// - Parameter textField: textfiled master.
    @objc
    fileprivate func handeTextFieldDidChanged(_ textField: UITextField) {
        guard textField.text != "" else {
            isValid = false
            return
        }
        isValid = !isValid
    }
}

// MARK: - Define a action when BaseViewController running.
fileprivate extension Selector {
    static let textFieldDidChanged = #selector(BaseAlertViewController.handeTextFieldDidChanged(_:))
}
