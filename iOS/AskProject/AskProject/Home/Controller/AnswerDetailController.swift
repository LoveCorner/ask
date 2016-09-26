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
    
    private func setBottomViewUI(){
        
        backView = UIView.init(frame: CGRectMake(0, ScreenHeight()-56, ScreenWidth(), 56))
        
//        backView.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: self.view, size: CGSize(width: ScreenWidth(),height: 56))
        
        backView.backgroundColor = RGB(0xF5F5F5)
        
        setShadowViewUI(backView, size: CGSizeMake(0, 0))

        let imageView = UIImageView.init(frame:CGRectMake(10, 10, 36, 36))
        //frame: CGRectMake(10, 10, 36, 36)
//        imageView.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: backView, size: CGSize(width: 36,height: 36), offset:CGPoint( x : 10,y : -10))
        
        imageView.image = UIImage(named: "comment_head")
        
        backView.addSubview(imageView)
        
        recommentTV = UITextView.init(frame: CGRectMake(56, 7, ScreenHeight()-56-90, 42))
        
//        recommentTV.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: backView, size: CGSize(width: ScreenWidth()-56-80,height: 42), offset:CGPoint( x : 56,y : 7))
        
        recommentTV.backgroundColor = UIColor.whiteColor()
        
        recommentTV.delegate = self
        
        recommentTV.font = UIFont.systemFontOfSize(14)
        
        backView.addSubview(recommentTV)
        
        placeLabel = UILabel.init(frame: CGRectMake(14, 10, 100, 20))
        
//        placeLabel.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: recommentTV, size: CGSize(width: 100,height: 20), offset:CGPoint( x : 10,y : 10))
        
        placeLabel.text = "我来评论"
        
        placeLabel.textColor = RGB(0x888888)
        
        placeLabel.font = UIFont.systemFontOfSize(15)
        
        recommentTV.addSubview(placeLabel)
        
        let rightBtn = UIButton.init(type: UIButtonType.Custom)
        
        rightBtn.frame = CGRectMake(ScreenWidth()-80, 7, 70, 42)
        
//        rightBtn.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: recommentTV, size: CGSize(width: 70,height: 42), offset:CGPoint( x : 10,y : 7))
        
        rightBtn.setTitle("发送", forState: UIControlState.Normal)
        
        rightBtn.backgroundColor = RGB(0xB8B8B8)
        
        rightBtn.addTarget(self, action: #selector(AnswerDetailController.commentAction), forControlEvents: UIControlEvents.TouchUpInside)
        
        backView.addSubview(rightBtn)
        
        self.view.addSubview(backView)
    }
    
    func commentAction(){
        
        
        
    }
    private func imageViewUI(){
        //从网络获取图片
        for index in 0..<6 {
            
            let imageView = UIImageView.init(frame: CGRectMake( CGFloat(index) * scrollView.frame.size.width, 0, scrollView.frame.size.width, 120))
            
            imageView.image = UIImage(named: "")
            
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
        
        backView.frame = CGRectMake(0, -400, ScreenWidth(), 56)
        
        return true
        
    }
    //懒加载
    
    private lazy var dataArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()
    
}
