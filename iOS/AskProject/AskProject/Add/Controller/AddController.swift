//
//  AddController.swift
//  AskProject
//
//  Created by bjike on 16/9/5.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class AddController: UIViewController,UITextViewDelegate,VisitorViewDelegate {
    
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var contentTV: UITextView!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    var alertView: VisitorView?
    
    var window: UIWindow!

    
    override func viewWillAppear(animated: Bool) {
        
        tabBarController?.tabBar.hidden = true
        
    }
    
    override func viewDidLoad() {
        
        //1.设置弹框
        
        backViewUI()
        
        //2.手势回收键盘
        tapUI()
        //3.设置键盘
        contentTV.inputAccessoryView = UIView.createBoardView(self, action: #selector(AddController.boardClicked(_:)))
        
        
    }
    
    func boardClicked(btn: UIButton){
        
        print(#function)
        
    }
    
    private func backViewUI(){
        
        window = UIApplication.sharedApplication().windows.last

        
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
        
               
        //弹框
        let customView = VisitorView()
        
        customView.delegate = self
        
        customView.frame = UIScreen.mainScreen().bounds
        
        customView.setupVisitorInfo("确定退出编辑吗？")
        
        alertView = customView
        
        window?.addSubview(alertView!)

        
    }
    
    func cancelBtnWillClicked(){
        
        alertView?.hidden = true
        
    }
    
    func sureBtnWillClicked(){
        
        alertView?.hidden = true
        //返回上一界面
        self.dismissViewControllerAnimated(false, completion: nil)
        
        
    }
   
    
    @IBAction func releaseClicked(sender: AnyObject) {
        
        //网络提交请求
        
        self.dismissViewControllerAnimated(false, completion: nil)

        
    }
    
    
    
}