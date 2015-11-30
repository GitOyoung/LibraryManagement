//
//  StudentViewController.swift
//  LibraryManagement
//
//  Created by oyoung on 15/11/30.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

class StudentViewController: UITabBarController {
    
    var homeView:SHomeTableViewController?
    var centerView: SCenterViewController?
    
    var recordButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.3, green: 0.6, blue: 0.7, alpha: 0.8)
        
        homeView = SHomeTableViewController()
        homeView?.tabBarItem = UITabBarItem(title: "主页", image: nil, selectedImage: nil)
        
        centerView = SCenterViewController()
        centerView?.tabBarItem = UITabBarItem(title: "个人中心", image: nil, selectedImage: nil)
        
        recordButton = UIBarButtonItem(title: "记录", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("OnRecordButton:"))
        
        self.addChildViewController(homeView!)
        self.addChildViewController(centerView!)
    }
    
    @IBAction func OnRecordButton(sender: UIBarButtonItem)
    {
        self.showRecord()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func showRecord()
    {
        let recordView: SRecordViewController = SRecordViewController()
        self.navigationController?.pushViewController(recordView, animated: true)
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.navigationItem.title = item.title
        if item.title == "主页"
        {
            self.navigationItem.rightBarButtonItem = recordButton
        }
        else
        {
            self.navigationItem.rightBarButtonItem = nil
        }
    }

}
