//
//  NagivationBar.category.swift
//  SwiftWeiBo
//
//  Created by bjike on 16/9/2.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    //如果在func前面加上class 相当于 OC中的+（类方法）
    class func createBarButtonItem(imageName:String,target:AnyObject?,action:Selector) -> UIBarButtonItem {
        let btn = UIButton()

        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal);
        
        //相当于设置frame 大小自适应
        btn.sizeToFit()
        
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return UIBarButtonItem(customView:btn)
  
        
    }
    
    class func createTitleBarButtonItem(titleName:String,target:AnyObject?,action:Selector) -> UIBarButtonItem {
        
        let btn = UIButton()
        
        btn.setTitle(titleName, forState: UIControlState.Normal)
        
        btn.setTitleColor(RGB(0x333333), forState: UIControlState.Normal)
        
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        //相当于设置frame 大小自适应
        btn.sizeToFit()
        
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return UIBarButtonItem(customView:btn)
        
        
    }

    
}