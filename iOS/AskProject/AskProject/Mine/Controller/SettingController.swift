//
//  SettingController.swift
//  AskProject
//
//  Created by bjike on 16/9/8.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class SettingController: BaseController,VisitorViewDelegate{
    
    
    @IBOutlet weak var onSwitchMsg: UISwitch!
    
    var alertView: VisitorView?
    
    var window: UIWindow!
    
    override func viewWillAppear(animated: Bool) {
        
        //1.隐藏标签栏
        tabBarController?.tabBar.hidden = true

    }
    override func viewDidLoad() {
        
      //2.设置UI
        
        setUI()
        
    }
    
    private func setUI(){
        
        window = UIApplication.sharedApplication().windows.last

        
    }
   
    @IBAction func backClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    

    @IBAction func notifacationClicked(sender: AnyObject) {
        
        
    }
    
       @IBAction func logoutClicked(sender: AnyObject) {
        //弹框
        let customView = VisitorView()
        
        customView.delegate = self
        
        customView.frame = UIScreen.mainScreen().bounds
                
        customView.setupVisitorInfo("确定退出账号吗？")
        
        alertView = customView
        
        window?.addSubview(alertView!)

    }
    
    func cancelBtnWillClicked(){
        
        alertView?.hidden = true
        
    }
    
    func sureBtnWillClicked(){
        
        alertView?.hidden = true
        //退出  回到登录界面
        self.dismissViewControllerAnimated(false, completion: nil)
        
        
    }
//    @IBAction func personMessageClicked(sender: AnyObject) {
//        
//        pushControllerUI("PersonMessageController")
//        
//    }
//    private func pushControllerUI(name:String){
//        
//        let  story =   UIStoryboard.init(name: name, bundle: nil)
//        
//        let   vc =  story.instantiateViewControllerWithIdentifier(name)
//        
//        navigationController?.pushViewController(vc, animated: true)
//        
//        
//    }
  
    
   }