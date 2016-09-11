//
//  SettingController.swift
//  AskProject
//
//  Created by bjike on 16/9/8.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class SettingController: BaseController{
    
    
    @IBOutlet weak var onSwitchMsg: UISwitch!
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var logView: UIView!
    
    override func viewDidLoad() {
        
      //1.设置UI
        
        setUI()
        
    }
    
    private func setUI(){
        
        backView.hidden = true
        
        logView.hidden = true

        logView.layer.masksToBounds = true
        
        logView.layer.cornerRadius = 5
        
    }
    @IBAction func backClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    

    @IBAction func notifacationClicked(sender: AnyObject) {
        
        
    }
    
    @IBAction func pushMessageClicked(sender: AnyObject) {
        
        
    }
    
    @IBAction func logoutClicked(sender: AnyObject) {
        
        backView.hidden = false

        logView.hidden = false

    }
    
    
    @IBAction func personMessageClicked(sender: AnyObject) {
        
        pushControllerUI("PersonMessageController")
        
    }
    private func pushControllerUI(name:String){
        
        let  story =   UIStoryboard.init(name: name, bundle: nil)
        
        let   vc =  story.instantiateViewControllerWithIdentifier(name)
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @IBAction func cancleClicked(sender: AnyObject) {
        
        backView.hidden = true
        
        logView.hidden = true

        
    }
    
    
    @IBAction func sureClicked(sender: AnyObject) {
        
        //退出  回到登录界面
        self.dismissViewControllerAnimated(false, completion: nil)
        
        
    }
}