//
//  SearchController.swift
//  AskProject
//
//  Created by bjike on 16/9/8.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class SearchController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    //传参过来的
    var dataArr: NSMutableArray!
    
    @IBOutlet weak var searchTF: UITextField!
    
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        
        //1.设置标签栏风格
        
        tabBarController?.tabBar.hidden = true
        
    }
    override func viewDidLoad() {
        
        
        //2.设置搜索框左侧视图
        
        leftViewUI(searchTF)
        
        //3.手势回收键盘
        
        tapUI()
        
        //5.表格注册
        showTableViewUI()
        
        
    }
    
    private func showTableViewUI(){
        
        if ((searchTF.text?.isEmpty) != nil){

        searchTableView.registerNib(UINib.init(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        
        }else{
            searchTableView.registerNib(UINib.init(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: "SearchResultCell")
  
            
        }
    }
    @IBAction func leftButtonClicked(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func rightButtonClicked(sender: AnyObject) {
        
        //text内容和模型标题
        searchArr.removeAllObjects()
        
        if ((searchTF.text?.containsString("区别")) != nil) {
            
            searchArr.addObject("区别")
            
        }
        
        searchTableView.reloadData()

        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (searchTF.text?.isEmpty) != nil{
            
            return 1
 
        }else{
            
            return self.searchArr.count
        }
  
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //self.recordArr.count
        if ((searchTF.text?.isEmpty) != nil){

        return 2
            
        }else{
            
            return 1
        }
    }
    //4.设置行高

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if ((searchTF.text?.isEmpty) != nil){

            return 46
        }else{
            
            return 180
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if ((searchTF.text?.isEmpty) != nil)
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchCell")as?SearchCell
            
            return cell!

        }else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultCell")as?SearchResultCell
            
            return cell!

        }
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if ((searchTF.text?.isEmpty) != nil) {
            
            return 32

        }else{
            
            if section == 0 {
                
                return 10
            }else{
                
                return 5
 
            }
        }
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        if ((searchTF.text?.isEmpty) != nil) {

        let view = UIView.init(frame: CGRectMake(0, 0, ScreenWidth(), 27))
        
        let head = UILabel.init(frame: CGRectMake(0, 12, ScreenWidth(), 20))
        
        head.backgroundColor = UIColor.whiteColor()
        
        head.text = "       搜索历史"
        
        head.textColor = RGB(0x666666)
        
        head.font = UIFont.systemFontOfSize(14)
        
        view.addSubview(head)
        
        return view
            
        }else{
            
            let view = UIView.init(frame: CGRectMake(0, 0, ScreenWidth(), 10))
            
            view.backgroundColor = RGB(0xf5f5f5)
            
            return view

            
        }
        
    }
    //tf左侧视图
    private func leftViewUI(tf: UITextField){
        
        let view = UIView.init(frame: CGRectMake(0, 0, 9, 35))
        
        tf.leftView = view
        
        tf.leftViewMode = UITextFieldViewMode.Always
        
    }
    //手势
    private func tapUI(){
        
        let tap =  UITapGestureRecognizer.init(target: self, action: #selector(LoginController.tapAction))
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    func tapAction(){
        
        searchTF.resignFirstResponder()
        
    }
//代理回收键盘
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        searchTF.resignFirstResponder()

        return true
    }
    
    //代理发起搜索
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        //text内容和模型标题
        searchArr.removeAllObjects()
        
        if ((searchTF.text?.containsString("区别")) != nil) {
            
            searchArr.addObject("区别")
            
        }
        
        searchTableView.reloadData()
        
        return true
    }
    //移除NavBar的线条
    private func moveNavBarLine(){
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "tabBarBackImage"), forBarMetrics: UIBarMetrics.Default)
        
        navigationController?.navigationBar.shadowImage = UIImage.init()
        
    }
    
    @IBAction func delectRecordClicked(sender: AnyObject) {
        
        
        
    }
    
    //懒加载
    
    private lazy var searchArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()

    private lazy var recordArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()
    
}