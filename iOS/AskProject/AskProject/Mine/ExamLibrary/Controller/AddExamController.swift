//
//  AddExamController.swift
//  AskProject
//
//  Created by bjike on 16/9/11.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class AddExamController: BaseController,UITextFieldDelegate,UITextViewDelegate {
    
    
    @IBOutlet weak var questionTF: UITextField!
    
    
    @IBOutlet weak var answerTV: UITextView!
    
    
    @IBOutlet weak var placeholderLabel: UILabel!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    
    override func viewDidLoad() {
        
        //1.初始化UI
        
        setUI()
        
        
    }
    
    private func setUI(){
        
        //1.隐藏backView
        
        backView.hidden = true
        
        backView.layer.cornerRadius = 5
        
        leftViewUI(questionTF)
        
        //2.手势隐藏键盘
        
         tapUI()
        
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
    @IBAction func cancleClicked(sender: AnyObject) {
        
        backView.hidden = true

        view.backgroundColor = UIColor.whiteColor()

        view.alpha = 1.0
        
        questionTF.alpha = 1.0
        
        answerTV.alpha = 1.0
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigitionBar"), forBarMetrics: UIBarMetrics.Default)


    }
    
    @IBAction func sureClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
 
        
    }
    
    @IBAction func exitClicked(sender: AnyObject) {
        
        backView.hidden = false
        
        view.backgroundColor = RGBA(157, g: 157, b: 157, a: 0.83)
        
        questionTF.alpha = 0
        
        answerTV.alpha = 0
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "tabBarBackImage"), forBarMetrics: UIBarMetrics.Default)
        
    }
    @IBAction func finishClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
}
