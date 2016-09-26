//
//  StartAppController.swift
//  AskProject
//
//  Created by bjike on 16/9/24.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class StartAppController: UIViewController {
    
    var backView: UIView!

    override func viewDidLoad() {
        
        startQiGif()
        
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(StartAppController.timerAction), userInfo: nibName, repeats: false)
        
        
    }
    
    private func startQiGif(){
        
        backView = UIView.init(frame: UIScreen.mainScreen().bounds);
        
        backView.backgroundColor = UIColor.clearColor()
        
        var imageArr = [UIImage]()
        
        for  i in 1..<46 {
            
            let image = UIImage(named: NSString(format: "%d",i) as String)
            
            imageArr.append(image!)
            
        }
        let imageView = UIImageView.init(frame: backView.frame)
        
        imageView.animationImages = imageArr
        
        imageView.animationDuration = 5
        
        imageView.animationRepeatCount = 1
        
        imageView.startAnimating()
        
        backView.addSubview(imageView)
        
        UIApplication.sharedApplication().windows.last?.addSubview(backView)
        
    }

    func timerAction(){
        
        backView.hidden = true
        
        let sb = UIStoryboard.init(name: "LoginController", bundle: nil)
        
        let vc = sb.instantiateInitialViewController()
        
        UIApplication.sharedApplication().windows.first!.rootViewController = vc
 
    }
}