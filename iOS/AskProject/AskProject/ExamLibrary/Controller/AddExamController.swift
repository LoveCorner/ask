//
//  AddExamController.swift
//  AskProject
//
//  Created by bjike on 16/9/11.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class AddExamController: BaseController,UITextFieldDelegate,UITextViewDelegate,VisitorViewDelegate {
    
    
    @IBOutlet weak var questionTF: UITextField!
    
    
    @IBOutlet weak var answerTV: UITextView!
    
    
    @IBOutlet weak var placeholderLabel: UILabel!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    
    var alertView: VisitorView?
    
    var window: UIWindow!
    

    override func viewDidLoad() {
        
        //1.初始化UI
        
        setUI()
        
        
    }
    
    private func setUI(){
        
        //1.1弹框设置
        window = UIApplication.sharedApplication().windows.last

        leftViewUI(questionTF)
        //1.2设置键盘
        questionTF.inputAccessoryView = UIView.createBoardView(self, action: #selector(AddExamController.boardButtonClicked))
        
        answerTV.inputAccessoryView = UIView.createBoardView(self, action: #selector(AddExamController.boardButtonClicked))
        //1.3手势隐藏键盘
        
         tapUI()
        
    }
    
    func boardButtonClicked(){
        
        print(#function)
        
    }
    private func tapUI(){
        
      let tap =  UITapGestureRecognizer.init(target: self, action: #selector(AddExamController.tapAction))
        
        view.addGestureRecognizer(tap)
        
    }
    
    func tapAction(){
        
        questionTF.resignFirstResponder()

        answerTV.resignFirstResponder()
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        placeholderLabel.hidden = true
        
        return true
        
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        placeLabel.hidden = true
        
        return true
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        questionTF.resignFirstResponder()
        
        return true
    }
    
    
    @IBAction func exitClicked(sender: AnyObject) {
        
              
        questionTF.resignFirstResponder()
        
        answerTV.resignFirstResponder()
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
        navigationController?.popViewControllerAnimated(true)
        
        
    }
    

    @IBAction func finishClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
}
