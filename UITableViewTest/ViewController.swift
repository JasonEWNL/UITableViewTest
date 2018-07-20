//
//  ViewController.swift
//  UITableViewTest
//
//  Created by JasonEWNL on 2018/7/20.
//  Copyright © 2018年 TWT Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let hero0 = Hero.init(name: "Tonfa", headImage: #imageLiteral(resourceName: "ascension2_ninja_man_tonfa"), desc: "This is Tonfa.")
    let hero1 = Hero.init(name: "Keris", headImage: #imageLiteral(resourceName: "ascension2_ninja_man_keris"), desc: "This is Keris.")
    let hero2 = Hero.init(name: "Swords", headImage: #imageLiteral(resourceName: "ascension2_ninja_girl_swords"), desc: "This is Swords.")
    let hero3 = Hero.init(name: "Nunchaku", headImage: #imageLiteral(resourceName: "ascension2_ninja_man_nunchaku"), desc: "This is Nunchaku.")
    let hero4 = Hero.init(name: "Knives", headImage: #imageLiteral(resourceName: "ascension2_ninja_man_crescent_knives"), desc: "This is Knives.")
    
    var heroesArray = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        heroesArray = [hero0, hero1, hero2, hero3, hero4]
        
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroesArray.count
    }
    
    // 0. 防止反复调用节省空间
    let identifier = "hero"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* 根据 cell 重用原理进行性能优化 */
        // 1. 首先尝试从缓存池中获得相同标识的 cell
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        // 2.1 不存在时创建新的 cell
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        } // 2.2 存在时则使用它
        
        // 3. cell 本身的数据每次更新
        cell!.textLabel?.text = heroesArray[indexPath.row].name
        cell!.imageView?.image = heroesArray[indexPath.row].headImage
        cell!.detailTextLabel?.text = heroesArray[indexPath.row].desc
        cell!.accessoryType = .disclosureIndicator
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // UIAlertView 已经废弃
        // 'UIAlertView' was deprecated in iOS 9.0: UIAlertView is deprecated. Use UIAlertController with a preferredStyle of UIAlertControllerStyleAlert instead
        /*
        let alert = UIAlertView(title: heroesArray[indexPath.row].name, message: heroesArray[indexPath.row].desc, delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "确定")
        alert.show()
        */
        
        let alert = UIAlertController(title: heroesArray[indexPath.row].name, message: heroesArray[indexPath.row].desc, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

