//
//  ExamDetailController.swift
//  AskProject
//
//  Created by bjike on 16/9/12.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class ExamDetailController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var uploadImageView: UIImageView!
    
    
    @IBOutlet weak var zanLabel: UILabel!
    
    @IBOutlet weak var backImageView: UIImageView!

    @IBOutlet weak var recomentLabel: UILabel!
    
    
    @IBOutlet weak var showView: UIView!
    
    @IBOutlet weak var bigView: UIView!
    
    @IBOutlet weak var lineView: UIView!
    
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
        
        setBackColorUI(true, backColor: UIColor.whiteColor())
        
        showView.layer.cornerRadius = 5
        //3.设置阴影
        
        setShadowViewUI(whiteView, size: CGSizeMake(0, 20))
        
        setShadowViewUI(bottomView, size: CGSizeMake(0, 0))
        
        isHideOrNot(true)
    }
    
    private func setShadowViewUI(backView: UIView,size: CGSize){
        
        backView.layer.shadowOffset = size
        
        backView.layer.shadowOpacity = 1
        
        backView.layer.shadowColor = RGBA(239, g: 239, b: 239, a: 1.0).CGColor
        
        backView.layer.shadowRadius = 4
        
        
    }
    private func isHideOrNot(isHide: Bool){
        
        backImageView.hidden = isHide
        
        recomentLabel.hidden = isHide

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
       let label = UILabel.init(frame: CGRectMake(0, 0, ScreenWidth(), 40))
        
        label.textColor = RGB(0x999999)
        
        label.font = UIFont.systemFontOfSize(12)
        
        label.text = "      评论（1）"
        
        label.backgroundColor = RGB(0xF5F5F5)
        
        return label
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
       return 40
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
    @IBAction func editClicked(sender: AnyObject) {
        
        
    }
    
    @IBAction func cancleClicked(sender: AnyObject) {
        
        
        setBackColorUI(true, backColor: UIColor.whiteColor())

    }
    @IBAction func sureClicked(sender: AnyObject) {
        
        setBackColorUI(true, backColor: UIColor.whiteColor())
        
        isHideOrNot(false)
        
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(SetNameController.timerAction), userInfo: nil, repeats: false)
        

        
    }
    @IBAction func recommetClicked(sender: AnyObject) {
        
     setBackColorUI(false, backColor: RGBA(173, g: 173, b: 173, a: 1.0))
    }
    
    private func setBackColorUI(isHiden: Bool,backColor: UIColor){
        
        bigView.hidden = isHiden
        
        bottomView.backgroundColor = backColor

    }
    
    func timerAction(){
        
        isHideOrNot(true)
        
    }
    //懒加载
    
    private lazy var dataArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()
    
}
