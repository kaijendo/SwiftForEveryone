//
//  ViewController.swift
//  ExtensionSelector
//
//  Created by Thuy Truong Quang on 10/1/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        }
    }
    var characters: [Charactor] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.Account.set(true, forKey: .isUserLogged)
        
        let _  = UserDefaults.Account.bool(forKey: .isUserLogged)
        
        prepareUI()
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        print("Thuy")
    }
    
    private func prepareUI() {
        guard let path = Bundle.main.path(forResource: "ListCharacters", ofType: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let result = jsonResult as? JSON {
                if let characters = result["characters"] as? [JSON] {
                    characters.forEach { (json) in
                        let character = Charactor(dict: json)
                        self.characters.append(character!)
                    }
                }
            }
            
        } catch(let error) {
            fatalError(error.localizedDescription)
        }
        
        defer {
            characters.forEach { (character) in
                switch character {
                case .hero(let hero):
                    print(hero.power)
                case .pricess(let pricess):
                    print(pricess.kingdom)
                case .civilian(let civilian):
                    print(civilian.name)
                }
            }
        }
    }
}

// MARK: - Define all Selector
fileprivate extension Selector {
    static let buttonTapped = #selector(ViewController.buttonTapped(_:))
    
}



// FIXME: - Note for project
/*
 Remember:
 - final class == static :), that's great.
 */

