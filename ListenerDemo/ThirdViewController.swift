//
//  ThirdViewController.swift
//  ListenerDemo
//
//  Created by 吴红星 on 2017/4/20.
//  Copyright © 2017年 wuhongxing. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var nameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Third"
        
        UserInfo.name.bindAndFireListener("ThirdViewController.nameButton") { name in
            self.nameButton.setTitle(name, for: .normal)
        }
        
        UserInfo.hairColor.bindAndFireListener("ThirdViewController.backgroundColor") { color in
            self.view.backgroundColor = color
        }
    }
    
    deinit {
        print("deinit third")
    }
    
    @IBAction func changeName(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Change name", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) -> Void in
            textField.placeholder = self.nameButton.titleLabel?.text
        }
        
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
            if let textField = alertController.textFields?.first {
                UserInfo.name.value = textField.text!
                
                let red = CGFloat(arc4random()).truncatingRemainder(dividingBy: 256) / 255.0
                let green = CGFloat(arc4random()).truncatingRemainder(dividingBy: 256) / 255.0
                let blue = CGFloat(arc4random()).truncatingRemainder(dividingBy: 256) / 255.0
                UserInfo.hairColor.value = UIColor(red: red, green: green, blue: blue, alpha: 1)
            }
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}


