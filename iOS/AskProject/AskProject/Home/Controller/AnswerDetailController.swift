//
//  ExamDetailController.swift
//  AskProject
//
//  Created by bjike on 16/9/12.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class AnswerDetailController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate {
    
    @IBOutlet weak var answerTableView: UITableView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var uploadImageView: UIImageView!
    
    
    @IBOutlet weak var zanLabel: UILabel!
    
    @IBOutlet weak var starBtn: UIButton!
    
    @IBOutlet weak var placeLabel: UILabel!
    
    
    @IBOutlet weak var recommentTV: UITextView!
    
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
        
        
        answerTableView.registerNib(UINib.init(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        
        //3.设置阴影
        
        setShadowViewUI(whiteView, size: CGSizeMake(0, 10))
        
        setShadowViewUI(bottomView, size: CGSizeMake(0, 0))
        
        starBtn.setImage(UIImage(named: "star_click"), forState: UIControlState.Selected)
        
        starBtn.setImage(UIImage(named: "star"), forState: UIControlState.Normal)
        
        //4.手势点击回收键盘
        tapUI()
        
    }
    private func tapUI(){
        
        let tap =  UITapGestureRecognizer.init(target: self, action: #selector(LoginController.tapAction))
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    func tapAction(){
        
        recommentTV.resignFirstResponder()
        
        view.frame = CGRectMake(0, 0, ScreenWidth(), ScreenHeight())
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view1 = UIView.init(frame: CGRectMake(0, 0, ScreenWidth(), 30))

       let label = UILabel.init(frame: CGRectMake(0, 10, ScreenWidth(), 20))
        
        label.textColor = RGB(0x999999)
        
        label.font = UIFont.systemFontOfSize(12)
        
        label.text = "      评论（2）"
        
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
    
    
    @IBAction func starClicked(sender: AnyObject) {
        
        starBtn.selected = !starBtn.selected

        
    }
    
    @IBAction func sendClicked(sender: AnyObject) {
        
        
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        placeLabel.text = ""
        //view  frame变化简单 获取键盘高度 bottonView没有上去
        
        view.frame = CGRectMake(0, -500, ScreenWidth(), ScreenHeight()+500)
        
        return true
        
    }
    //懒加载
    
    private lazy var dataArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()
    
}
