//
//  InputAccessoryView.swift
//  AskProject
//
//  Created by bjike on 16/9/22.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

extension UIView{
    
    
    class func createBoardView(target:AnyObject?,action:Selector) -> UIView{
        
        let backView = UIView.init(frame: CGRectMake(0, 0, ScreenWidth(), 46))
        
        backView.backgroundColor = RGBA(199, g: 203, b: 211, a: 0.9)
        
        let imageName = ["tab_bottom","jian","hao","jian","hao","dot","photo","vico","link"]
        
        for  index in 0..<9 {
            
            let leftBtn = UIButton.init()
            
            if ScreenWidth()==320 {
                
                leftBtn.frame = CGRectMake(CGFloat(index)*(ScreenWidth()/9)+2.5, 5, 30, 30)

                
            }else{
                
                leftBtn.frame = CGRectMake(CGFloat(index)*(ScreenWidth()/9)+2.5, 5, 36, 36)
  
            }
            
            leftBtn.setBackgroundImage(UIImage(named: imageName[index]), forState: UIControlState.Normal)

            leftBtn.tag = index+100
            
            leftBtn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
            
            backView.addSubview(leftBtn)

        }
        
    
        return backView
        
        
    }
    
}
