//
//  HomeEditController.swift
//  AskProject
//
//  Created by bjike on 16/9/18.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class HomeEditController: UIViewController {
    
    var questionStr: String?
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerTV: UITextView!
    
    @IBOutlet weak var linkTF: UITextField!
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
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
        
        questionLabel.text = questionStr
        
        //1.1设置导航条
        
        setNaviUI()
        
    }
    
    private func setNaviUI(){
        
        self.title = "回答"
        
       navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("darkcancel", target: self, action: #selector(HomeEditController.leftButtonClicked))
        
        let lookItem = UIBarButtonItem.createTitleBarButtonItem("预览", target: self, action: #selector(HomeEditController.lookClicked))
        
        let submitItem = UIBarButtonItem.createTitleBarButtonItem("提交", target: self, action: #selector(HomeEditController.submitClicked))
    
        let items = [submitItem,lookItem]
        
        navigationItem.rightBarButtonItems = items
                
    }
    
    func lookClicked(){

        let  story =   UIStoryboard.init(name: "Home", bundle: nil)
        
        let   vc =  story.instantiateViewControllerWithIdentifier("HomeLook") as! (HomeLookController)
        
        vc.questionStr = questionLabel.text
                
        vc.answerStr = answerTV.text
        
        vc.linkStr = linkTF.text
        
        vc.timeStr = timeLabel.text

        navigationController?.pushViewController(vc, animated: true)

        
    }
    
    func submitClicked(){
        
        navigationController?.popViewControllerAnimated(true)

        
    }
    func leftButtonClicked(){
        
       navigationController?.popViewControllerAnimated(true)
        
    }
    private func tapUI(){
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(HomeEditController.tapActionClicked))
        
        view.addGestureRecognizer(tap)
        
    }
    
    func tapActionClicked(){
        
        linkTF.resignFirstResponder()
        
    }
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Look" {
            
            let look = segue.destinationViewController as! LookController
            
            look.questionStr = questionLabel.text
            
            look.answerStr = answerTV.text
            
            look.linkStr = linkTF.text
            
            look.timeStr = timeLabel.text
        }
    }
    
    @IBAction func cleanOneClicked(sender: AnyObject) {
        
        linkTF.text = ""
        
    }
    @IBAction func cleanTwoClicked(sender: AnyObject) {
        
        timeLabel.text = ""
        
    }
 
    
    
}

