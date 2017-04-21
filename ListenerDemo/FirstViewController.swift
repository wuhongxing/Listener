//
//  ViewController.swift
//  ListenerDemo
//
//  Created by 吴红星 on 2017/4/20.
//  Copyright © 2017年 wuhongxing. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var nameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "First"
        
        UserInfo.name.bindAndFireListener("FirstViewController.nameButton") { [weak self] name in
            self?.nameButton.setTitle(name, for: UIControlState())
        }
        
        UserInfo.hairColor.bindAndFireListener("FirstViewController.backgroundColor") { [weak self] color in
            self?.view.backgroundColor = color
        }
    }


}

