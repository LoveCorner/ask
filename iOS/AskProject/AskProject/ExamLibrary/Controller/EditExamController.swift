//
//  EditExamController.swift
//  AskProject
//
//  Created by bjike on 16/9/14.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit
class EditExamController: UIViewController {
    
    var questionStr: String?
        
    
    @IBOutlet weak var questionTV: UITextView!
  
    
    @IBOutlet weak var answerTV: UITextView!
    
    @IBOutlet weak var linkTF: UITextField!
    
    
    
    @IBOutlet weak var timeTF: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBar.hidden = false
        
        moveNavBarLine()
        
    }
    //移除NavBar的线条
    private func moveNavBarLine(){
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navigitionBar"), forBarMetrics: UIBarMetrics.Default)
        
        navigationController?.navigationBar.shadowImage = UIImage.init()
        
    }
    override func viewDidLoad() {
        
        //1.初始化ui
        
        setUI()
        
    }
    private func setUI(){
        //回收键盘
        tapUI()
        
        questionTV.text = questionStr
        //设置键盘
        questionTV.inputAccessoryView = UIView.createBoardView(self, action: #selector(EditExamController.boardClicked(_:)))
        
        answerTV.inputAccessoryView = UIView.createBoardView(self, action: #selector(EditExamController.boardClicked(_:)))

        linkTF.inputAccessoryView = UIView.createBoardView(self, action: #selector(EditExamController.boardClicked(_:)))
        
        timeTF.inputAccessoryView = UIView.createBoardView(self, action: #selector(EditExamController.boardClicked(_:)))


    }
    
    func boardClicked(btn: UIButton){
        
        print(#function)
        
    }
    private func tapUI(){
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(EditExamController.tapActionClicked))
        
        view.addGestureRecognizer(tap)
        
    }
    
    func tapActionClicked(){
        
        questionTV.resignFirstResponder()
        
        answerTV.resignFirstResponder()

        linkTF.resignFirstResponder()

        timeTF.resignFirstResponder()

        
    }
    @IBAction func closeClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
        
    }
    
//    @IBAction func lookClicked(sender: AnyObject) {
//               
//        if let look = self.storyboard?.instantiateViewControllerWithIdentifier("Look") {
//            
//            let vc = look as! LookController
//            
//            vc.questionStr = questionTV.text
//            
//            vc.answerStr = answerTV.text
//            
//            vc.linkStr = linkTF.text
//            
//            vc.timeStr = timeLabel.text
//            
//            navigationController?.pushViewController(look, animated: true)
//
//        }
//        
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Look" {
            
            let look = segue.destinationViewController as! LookController
            
            look.questionStr = questionTV.text
            
            look.answerStr = answerTV.text
            
            look.linkStr = linkTF.text
            
            look.timeStr = timeTF.text
        }
    }
   
    @IBAction func submitClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
 
    }
    @IBAction func cleanOneClicked(sender: AnyObject) {
        
        linkTF.text = ""
        
    }
    @IBAction func cleanTwoClicked(sender: AnyObject) {
        
        timeTF.text = ""
        
    }
}
