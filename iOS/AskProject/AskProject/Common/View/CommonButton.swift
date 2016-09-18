//
//  CommonButton.swift
//  AskProject
//
//  Created by bjike on 16/9/18.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

extension  UIButton {
    
    class func createButtonItem(titleName:String,target:AnyObject?,action:Selector) -> UIButton {
        
        let btn = UIButton()
        
        btn.setTitle(titleName, forState: UIControlState.Normal)
                
        btn.setTitleColor(RGB(0x333333), forState: UIControlState.Normal)
        
        btn.titleLabel?.font = UIFont.systemFontOfSize(15)
        
        return btn
        
    }
    

    
}

