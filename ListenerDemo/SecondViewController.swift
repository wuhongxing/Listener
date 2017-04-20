//
//  SecondViewController.swift
//  ListenerDemo
//
//  Created by 吴红星 on 2017/4/20.
//  Copyright © 2017年 wuhongxing. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Second"
        
        UserInfo.name.bindAndFireListener("SecondViewController.nameButton") { name in
            self.nameButton.setTitle(name, for: UIControlState())
        }
        
        UserInfo.hairColor.bindListener("SecondViewController.backgroundColor") { color in
            self.view.backgroundColor = color
        }
    }
    
    deinit {
        print("deinit second")
    }
}

