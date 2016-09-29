//
//  AnswerQuestionController.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class AnswerQuestionController: BaseController,UITextViewDelegate,VisitorViewDelegate {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var answerTV: UITextView!
    
    var alertView: VisitorView?
    
    var window: UIWindow!


    override func viewDidLoad() {
        
        //1.初始化UI
        setUI()
        
    }
    
    private func setUI(){
        
        self.title = "回答"
        
        //设置弹框
        window = UIApplication.sharedApplication().windows.last
        

        //2.回收键盘
        tapUI()
        
        //3.初始化导航条
        setNaviUI()
        
        //设置键盘
        
        answerTV.inputAccessoryView = UIView.createBoardView(self, action: #selector(AnswerQuestionController.boardClicked(_:)))
        
        
        
    }
    
    func boardClicked(btn: UIButton){
        
        print(#function)
        
    }

    private func setNaviUI(){
    
            navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("darkcancel",target: self,action: #selector(AnswerQuestionController.leftButtonClicked))
    
            navigationItem.rightBarButtonItem = UIBarButtonItem.createTitleBarButtonItem("提交",target: self,action: #selector(AnswerQuestionController.rightButtonClicked))
    
    
            
        }

    func leftButtonClicked(){
        
 
        //弹框
        let customView = VisitorView()
        
        customView.delegate = self
        
        customView.frame = UIScreen.mainScreen().bounds
        
        customView.setupVisitorInfo("确定退出编辑吗？")
        
        alertView = customView
        
        window?.addSubview(alertView!)
        
        

    }
    
    func rightButtonClicked(){
        
        navigationController?.popViewControllerAnimated(true)
 
        
    }
    
    func cancelBtnWillClicked(){
        
        alertView?.hidden = true
        
    }
    
    func sureBtnWillClicked(){
        
        alertView?.hidden = true
        //返回上一界面
        navigationController?.popViewControllerAnimated(true)
        
        
    }

    private func tapUI(){
        
        let tap =  UITapGestureRecognizer.init(target: self, action: #selector(LoginController.tapAction))
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    func tapAction(){
        
        answerTV.resignFirstResponder()
        
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        placeLabel.text = ""
        return true
    }
  

    
  
}
