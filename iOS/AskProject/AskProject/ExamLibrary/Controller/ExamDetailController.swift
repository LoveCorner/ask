//
//  ExamDetailController.swift
//  AskProject
//
//  Created by bjike on 16/9/12.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class ExamDetailController: UIViewController,UITableViewDelegate,UITableViewDataSource,VisitorViewDelegate {
    
    var alertView: VisitorView?
    
    var window: UIWindow!

    @IBOutlet weak var examTableView: UITableView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var uploadImageView: UIImageView!
    
    
    @IBOutlet weak var zanLabel: UILabel!
    
    
    @IBOutlet weak var blackView: UIView!
      
    override func viewWillAppear(animated: Bool) {
        
        //1.隐藏导航栏和标签栏
        navigationController?.navigationBar.hidden = true
        
        tabBarController?.tabBar.hidden = true
        
    }
    
    override func viewDidLoad() {
        //2.初始化UI
       setUI()
        
    }
    
    private func setUI(){
        
        //2.1弹框设置
        window = UIApplication.sharedApplication().windows.last

        examTableView.registerNib(UINib.init(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")

        //2.2设置阴影
        
        setShadowViewUI(whiteView, size: CGSizeMake(0, 10))
        
        setShadowViewUI(bottomView, size: CGSizeMake(0, 0))
        
        blackView.hidden = true
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view1 = UIView.init(frame: CGRectMake(0, 0, ScreenWidth(), 30))
        
       let label = UILabel.init(frame: CGRectMake(0, 10, ScreenWidth(), 20))
        
        label.textColor = RGB(0x999999)
        
        label.font = UIFont.systemFontOfSize(12)
        
        label.text = "      评论（1）"
        
        label.backgroundColor = RGB(0xF5F5F5)
        
        view1.addSubview(label)
        
        return view1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
       return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("CommentCell") as?CommentCell
        
        return cell!
        
    }
    @IBAction func enlargeClicked(sender: AnyObject) {
        
        
    }
    
    
    @IBAction func backClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editExam" {
            
            let edit = segue.destinationViewController as! EditExamController
            
            edit.questionStr = questionLabel.text
            
           
        }
    }
//    @IBAction func editClicked(sender: AnyObject) {
//       
//      pushControllerUI("EditExamController")
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
    @IBAction func recommentClicked(sender: AnyObject) {
        
        //弹框
        let customView = VisitorView()
        
        customView.delegate = self
        
        customView.frame = UIScreen.mainScreen().bounds
        
        customView.setupVisitorInfo("确定推荐首页吗？")
        
        alertView = customView
        
        window?.addSubview(alertView!)

       
        
    }
    func cancelBtnWillClicked(){
        
        alertView?.hidden = true
        
    }
    
    func sureBtnWillClicked(){
        
        alertView?.hidden = true

        blackView.hidden = false
        
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(ExamDetailController.timerAction), userInfo: nil, repeats: false)
               
    }
   func timerAction(){
    
       blackView.hidden = true
    
    }
    
    //懒加载
    
    private lazy var dataArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()
    
}
