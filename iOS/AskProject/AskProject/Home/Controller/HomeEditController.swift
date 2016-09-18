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
        self.title = "回答"
        
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
        
        navigationController?.navigationBar.tintColor = RGB(0x333333)
        
        
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("darkcancel", target: self, action: #selector(HomeEditController.leftButtonClicked))
        
        
//        let lookBtn = UIButton.createButtonItem("预览", target: self, action: #selector(HomeEditController.lookClicked))
//        
//        lookBtn.frame = CGRectMake(60, 5, 40, 30)
//        
//        let submitBtn = UIButton.createButtonItem("提交", target: self, action: #selector(HomeEditController.submitClicked))
//        
//        submitBtn.frame = CGRectMake(110, 5, 40, 30)
        
       let lookItem = UIBarButtonItem.init(title: "预览", style: UIBarButtonItemStyle.Done, target: self, action:#selector(HomeEditController.lookClicked))
        
        let submitItem = UIBarButtonItem.init(title: "提交", style: UIBarButtonItemStyle.Done, target: self, action:#selector(HomeEditController.submitClicked))

        
//        let rightView = UIView.init(frame: CGRectMake(0, 0, 140, 40))
//        
//        rightView.addSubview(lookBtn)
//        
//        rightView.addSubview(submitBtn)
        
        let items = [submitItem,lookItem]
        
//       let rightItem = UIBarButtonItem.init(customView: rightView)
        
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

