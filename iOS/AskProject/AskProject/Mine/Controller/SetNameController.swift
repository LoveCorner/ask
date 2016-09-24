//
//  SetNameController.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class SetNameController: BaseController {
    
    
    @IBOutlet weak var nameLabel: UITextField!
    
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var successLabel: UILabel!
    
    
    @IBOutlet weak var backImageView: UIImageView!
    
    
    override func viewDidLoad() {
        
      //1.隐藏修改成功
        
        setUI(true)
        
        //2.设置圆角以及左侧视图
        
        setBtnUI()
        
        //3.手势隐藏键盘
        
        tapUI()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBar.hidden = false
        
        tabBarController?.tabBar.hidden = true
    }
    
    private func setBtnUI(){

        saveBtn.layer.cornerRadius = 5
        
        saveBtn.layer.masksToBounds = true
        
        leftViewUI(nameLabel)
        
        
    }
    private func setUI(isShow:Bool){
        
        successLabel.hidden = isShow
        
        backImageView.hidden = isShow
        
        
        
    }
    
    private func tapUI(){
        
        let tap =  UITapGestureRecognizer.init(target: self, action: #selector(LoginController.tapAction))
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    func tapAction(){
        
        
        nameLabel.resignFirstResponder()
        
        
    }
    @IBAction func saveClicked(sender: AnyObject) {
        
        //网络请求成功后显示,定时器
        
        setUI(false)
        
      NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(SetNameController.timerAction), userInfo: nil, repeats: false)

        
    }
    
    
    func timerAction(){
    
        setUI(true)
    
    }
    @IBAction func backClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
        
    }
}