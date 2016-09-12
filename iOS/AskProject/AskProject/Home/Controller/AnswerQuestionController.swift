//
//  AnswerQuestionController.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class AnswerQuestionController: BaseController,UITextViewDelegate {
    
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBOutlet weak var answerTV: UITextView!
    

    override func viewDidLoad() {
        
        //1.初始化UI
        setUI()
        
    }
    
    private func setUI(){
        
        backView.hidden = true
        
        whiteView.layer.cornerRadius = 5
        //2.回收键盘
        tapUI()
        
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
    @IBAction func backClicked(sender: AnyObject) {
        
        backView.hidden = false
    }
    @IBAction func submitClicked(sender: AnyObject) {
        
        
    }
    
    @IBAction func sureClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)

        
    }
    @IBAction func cancleClicked(sender: AnyObject) {
        
        backView.hidden = true

    }
}
