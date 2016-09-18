//
//  HomeAnswerController.swift
//  AskProject
//
//  Created by bjike on 16/9/13.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class HomeAnswerController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var careBtn: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    @IBOutlet weak var headImage: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var blackView: UIView!
    
    @IBOutlet weak var whiteView: UIView!
    
    override func viewWillAppear(animated: Bool) {
        
        //1.隐藏导航栏和标签栏
        tabBarController?.tabBar.hidden = true

        navigationController?.navigationBar.hidden = true
        
    }
    
    override func viewDidLoad() {
        //2.初始化UI
        setUI()
    }
    private func setUI(){
        
        careBtn.setImage(UIImage(named: "focus_click"), forState: UIControlState.Normal)
        
        careBtn.setImage(UIImage(named: "focus"), forState: UIControlState.Selected)
        
        blackView.hidden = true
        
        blackView.layer.cornerRadius = 20
        
        blackView.alpha = 0.9
        
        //2.1.设置阴影
        setShadowViewUI(whiteView, size: CGSizeMake(0, 5))

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        }else{
            
            return 3
  
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
       let backView = UIView.init(frame: CGRectMake(0, 0, ScreenWidth(), 50))
        
        blackView.backgroundColor = RGB(0xF5F5F5)
        
        if section == 0 {
            
            let imageView = UIImageView.init(frame: CGRectMake(20, 15, 17, 17))
            
            imageView.image = UIImage(named: "campion")
            
            backView.addSubview(imageView)
            
            let titleLabel = UILabel.init(frame: CGRectMake(43, 10, 100, 30))
            
            titleLabel.text = "推荐答案"
            
            titleLabel.textColor = UIColor.blackColor()
            
            titleLabel.font = UIFont.systemFontOfSize(16)
            
            backView.addSubview(titleLabel)
            
        }else{
            let titleLabel = UILabel.init(frame: CGRectMake(20, 10, 100, 30))
            
            titleLabel.text = "其他答案"
            
            titleLabel.textColor = RGB(0x666666)
            
            titleLabel.font = UIFont.systemFontOfSize(14)
            
            backView.addSubview(titleLabel)
            
        }
       
        
        
        return backView
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("AnswerCell") as?AnswerCell
        
        return cell!

        
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        pushController("AnswerDetailController")
//    }
//    
//    private func pushController(nameStr: String){
//        
//        let  story =   UIStoryboard.init(name: nameStr, bundle: nil)
//        
//        let   vc =  story.instantiateViewControllerWithIdentifier(nameStr)
//        
//        navigationController?.pushViewController(vc, animated: true)
//        
//    }
    @IBAction func careClicked(sender: AnyObject) {
        
        careBtn.selected = !careBtn.selected
        
        if careBtn.selected {
            
            blackView.hidden = false
            
            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(HomeAnswerController.timerActionUI), userInfo: nil, repeats: false)
        }
       
        
        
    }
    
    func timerActionUI(){
        
        
        blackView.hidden = true
        
    }
    @IBAction func backClicked(sender: AnyObject) {
        
      navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func editContentClicked(sender: AnyObject) {
        
        let  story =   UIStoryboard.init(name: "Home", bundle: nil)
        
        let   vc =  story.instantiateViewControllerWithIdentifier("HomeEditController") as! (HomeEditController)
        
        vc.questionStr = questionLabel.text
                
       navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}