//
//  Hero.swift
//  UITableViewTest
//
//  Created by JasonEWNL on 2018/7/20.
//  Copyright © 2018年 TWT Studio. All rights reserved.
//

import UIKit

class Hero {
    var name: String!
    var headImage: UIImage!
    var desc: String!
    
    init(name: String, headImage: UIImage, desc: String) {
        self.name = name
        self.headImage = headImage
        self.desc = desc
    }
}
