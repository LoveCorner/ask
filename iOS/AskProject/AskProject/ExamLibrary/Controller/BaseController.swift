//
//  BaseController.swift
//  AskProject
//
//  Created by bjike on 16/9/18.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        //1.移除nav的线，并设置背景图
        
        moveNavBarLine()
        
        
    }
    
    //移除NavBar的线条
    private  func moveNavBarLine(){
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigitionBar"), forBarMetrics: UIBarMetrics.Default)
        
        navigationController?.navigationBar.shadowImage = UIImage.init()
        
    }
    
}
