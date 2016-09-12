//
//  AlertView+Category.swift
//  AskProject
//
//  Created by bjike on 16/9/12.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

extension UIView{
    
    
    class func createBackView(titleName: String) -> UIView{
        
       let backView = UIView.init(frame: CGRectMake(0, 0, ScreenWidth(), ScreenHeight()))
        
        backView.backgroundColor = RGBA(157, g: 157, b: 157, a: 1.0)
        
        let whiteView = UIView.init(frame: CGRectMake((ScreenWidth()-256)/2, (ScreenHeight()-131)/2, ScreenWidth(), ScreenHeight()))
        
        let leftBtn = UIButton()
        
        leftBtn.setBackgroundImage(UIImage(named: "cancel_bottom"), forState: UIControlState.Normal)
        
        whiteView.addSubview(leftBtn)
        
        let rightBtn = UIButton()
        
        rightBtn.setBackgroundImage(UIImage(named: "sure_bottom"), forState: UIControlState.Normal)

        whiteView.addSubview(rightBtn)
        
        backView.addSubview(whiteView)
        
        return backView
        
        
    }
    
    private func createRedButton(imageName: String) -> UIButton{
        
        let btn = UIButton()
        
        btn.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
        
        return btn
        
    }
    
}
