//
//  ExamDetailController.swift
//  AskProject
//
//  Created by bjike on 16/9/12.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit
import SnapKit

class AnswerDetailController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate {
    
    @IBOutlet weak var answerTableView: UITableView!
    
    
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var widthContraints: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var zanLabel: UILabel!
    
    @IBOutlet weak var starBtn: UIButton!
    
    var backView:UIView!
    
    var placeLabel: UILabel!
    
    
    var recommentTV: UITextView!
    
    
    @IBOutlet weak var smallView: UIView!
    
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
        
        smallView.hidden = true
        
        smallView.layer.cornerRadius = 20
        
        answerTableView.registerNib(UINib.init(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        
        //3.设置阴影
        
        setShadowViewUI(whiteView, size: CGSizeMake(0, 10))
        
        starBtn.setImage(UIImage(named: "star_click"), forState: UIControlState.Selected)
        
        starBtn.setImage(UIImage(named: "star"), forState: UIControlState.Normal)
        
        //4.手势点击回收键盘
        tapUI()
        
        //5.设置表头上图片预览
        
        imageViewUI()
        

        //6.设置评论view
        
        setBottomViewUI()
        
        }
    
    func keyboardWillAppear(nofi: NSNotification){
        
        let dic = nofi.userInfo
        
        let aValue = dic![UIKeyboardFrameEndUserInfoKey]
        
        let rect = aValue?.CGRectValue()
        
        let height = rect?.size.height
        
        backView.frame = CGRectMake(0, ScreenHeight()-height!-56, ScreenWidth(), 56)
        

        
    }
    func keyboardWillDisappear(){
        
        backView.frame = CGRectMake(0, ScreenHeight()-56, ScreenWidth(), 56)
        
    }
    private func setBottomViewUI(){
        
        backView = UIView.init()
        
        backView.frame = CGRectMake(0, ScreenHeight()-56, ScreenWidth(), 56)

        view.addSubview(backView)

        backView.backgroundColor = RGB(0xF6F6F6)
        
        setShadowViewUI(backView, size: CGSizeMake(0, 0))
        
        let imageView = UIImageView.init()
        
        imageView.image = UIImage(named: "comment_head")

        backView.addSubview(imageView)

        imageView.snp_makeConstraints { (make) in
            
            make.top.equalTo(backView).offset(10)
            
            make.left.equalTo(backView).offset(10)
            
            make.width.equalTo(36)
            
            make.height.equalTo(36)
            
        }
        
        
        let rightBtn = UIButton.init(type: UIButtonType.Custom)
        
        backView.addSubview(rightBtn)

        rightBtn.snp_makeConstraints { (make) in
            
            make.right.equalTo(backView).offset(-10)
            
            make.centerY.equalTo(backView)
            
            make.width.equalTo(70)
            
            make.height.equalTo(42)
            
        }
        
        rightBtn.setTitleColor(RGB(0xb8b8b8), forState: UIControlState.Normal)
        
        rightBtn.setTitle("发送", forState: UIControlState.Normal)
        
        rightBtn.backgroundColor = RGB(0xEAEAEA)
        
        rightBtn.addTarget(self, action: #selector(AnswerDetailController.commentAction), forControlEvents: UIControlEvents.TouchUpInside)
        

        recommentTV = UITextView.init()
        
        backView.addSubview(recommentTV)

        recommentTV.snp_makeConstraints { (make) in
            
            make.centerY.equalTo(backView)
            
            make.left.equalTo(imageView.snp_right).offset(10)
            
            make.right.equalTo(rightBtn.snp_left).offset(-10)
            
            make.height.equalTo(42)
            
        }
        
        recommentTV.backgroundColor = UIColor.whiteColor()
        
        recommentTV.delegate = self
        
        recommentTV.font = UIFont.systemFontOfSize(15)
        
        
        placeLabel = UILabel.init()
        
        backView.addSubview(placeLabel)

        placeLabel.snp_makeConstraints { (make) in
            
            make.left.equalTo(recommentTV).offset(10)
            
            make.top.equalTo(recommentTV).offset(11)
            
            make.height.equalTo(20)
            
            make.width.equalTo(100)
            
        }
        placeLabel.text = "我来评论"
        
        placeLabel.textColor = RGB(0x888888)
        
        placeLabel.font = UIFont.systemFontOfSize(15)
        
        
    }
    
    func commentAction(){
        
        print(#function)
        
    }
    private func imageViewUI(){
        //从网络获取图片
        for index in 0..<6 {
            
            let imageView = UIImageView.init(frame: CGRectMake( CGFloat(index) * scrollView.frame.size.width, 0, scrollView.frame.size.width, 120))
            
            imageView.image = UIImage(named: "collect_title")
            
            scrollView.addSubview(imageView)
            
        }
        
        self.widthContraints.constant = scrollView.frame.size.width * 6
        
    }
    private func tapUI(){
        
        let tap =  UITapGestureRecognizer.init(target: self, action: #selector(LoginController.tapAction))
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    func tapAction(){
        
        recommentTV.resignFirstResponder()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AnswerDetailController.keyboardWillDisappear), name: UIKeyboardDidHideNotification, object: nil)
        
        
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

        
        if starBtn.selected {
            
            smallView.hidden = false

            NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(AnswerDetailController.timerClicked), userInfo: nil, repeats: false)
            

        }
    }
    
    func timerClicked(){
        
        smallView.hidden = true
        
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        
        placeLabel.text = ""
        //7.获取键盘高度

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AnswerDetailController.keyboardWillAppear), name: UIKeyboardWillShowNotification, object: nil)

        return true
        
    }
    //懒加载
    
    private lazy var dataArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()
    
}
