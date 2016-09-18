//
//  EditExamController.swift
//  AskProject
//
//  Created by bjike on 16/9/14.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit
class EditExamController: BaseController {
    
    var questionStr: String?
        
    
    @IBOutlet weak var questionTV: UITextView!
  
    
    @IBOutlet weak var answerTV: UITextView!
    
    @IBOutlet weak var linkTF: UITextField!
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBar.hidden = false
    }
    
    override func viewDidLoad() {
        
        //1.初始化ui
        
        setUI()
        
    }
    private func setUI(){
        //回收键盘
        tapUI()
        
    }
    
    private func tapUI(){
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(EditExamController.tapActionClicked))
        
        view.addGestureRecognizer(tap)
        
    }
    
    func tapActionClicked(){
        
        linkTF.resignFirstResponder()
        
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
            
            look.timeStr = timeLabel.text
        }
    }
   
    @IBAction func submitClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
 
    }
    @IBAction func cleanOneClicked(sender: AnyObject) {
        
        linkTF.text = ""
        
    }
    @IBAction func cleanTwoClicked(sender: AnyObject) {
        
        timeLabel.text = ""
        
    }
}
