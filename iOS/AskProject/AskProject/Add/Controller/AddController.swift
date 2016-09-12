//
//  AddController.swift
//  AskProject
//
//  Created by bjike on 16/9/5.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class AddController: UIViewController,UITextViewDelegate {
    
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var contentTV: UITextView!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    
    override func viewWillAppear(animated: Bool) {
        
        tabBarController?.tabBar.hidden = true
        
    }
    
    override func viewDidLoad() {
        
        //1.隐藏backView
        
        backViewUI()
        
        //2.手势回收键盘
        tapUI()
        
    }
    
    private func backViewUI(){
        
        backView.hidden = true
        
        backView.layer.cornerRadius = 5
        
        
    }
    private func tapUI(){
        
        let tap =  UITapGestureRecognizer.init(target: self, action: #selector(LoginController.tapAction))
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    func tapAction(){
        
        
        contentTV.resignFirstResponder()
        
        
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        if contentTV.text != nil {
            
            placeLabel.text = ""
        }else{
            
            placeLabel.text = "在这里输入问题描述"
  
        }
        
        return true
    }
    @IBAction func cancleClicked(sender: AnyObject) {
        
               
        backColorUI(false, viewBackColor: RGBA(157, g: 157, b: 157, a: 0.83), lineColor: RGBA(157, g: 157, b: 157, a: 1), contentAlpha: 0)
        
        
    }
    
    @IBAction func exitClicked(sender: AnyObject) {
        
       
        backColorUI(true, viewBackColor: UIColor.whiteColor(), lineColor: RGB(0xededed), contentAlpha: 1)

    }
    
    private func backColorUI(isHide: Bool,viewBackColor: UIColor, lineColor: UIColor,contentAlpha: CGFloat){
        
        backView.hidden = isHide
        
        view.backgroundColor = viewBackColor
        
        contentTV.alpha = contentAlpha
        
        lineView.backgroundColor = lineColor

        
    }
    
    @IBAction func sureClicked(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    @IBAction func releaseClicked(sender: AnyObject) {
        
        //网络提交请求
        
        self.dismissViewControllerAnimated(false, completion: nil)

        
    }
    
    
    
}