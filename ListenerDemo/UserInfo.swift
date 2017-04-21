//
//  UserInfo.swift
//  ListenerDemo
//
//  Created by 吴红星 on 2017/4/20.
//  Copyright © 2017年 wuhongxing. All rights reserved.
//

import Foundation
import UIKit

class UserInfo {
    static var name: Listenable<String> = {
        return Listenable<String>("吴红星") { name in
            print("\(name)")
        }
    }()
    
    static var hairColor: Listenable<UIColor> = {
        return Listenable<UIColor>(UIColor.red) { hairColor in
            print("\(hairColor)")
        }
    }()
}
