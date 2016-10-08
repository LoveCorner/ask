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
        
        let imageName = ["tab_bottom","jing","xing","jian","hao","dot","photo","vico","link"]
        
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
        
        func keyboardButtonClicked(btn: UIButton){
            
            switch  btn.tag {
            case 100:
               
                
                break
            case 101:
  
                
                break
            case 102:

                
                break
            case 103:

                break
            case 104:

                break
            case 105:

                break
            case 106:

                break
            case 107:

                
                break
            case 108:

                break
            default:
                
                break
            }
            
        }
    
        return backView
        
        
    }
    
}
