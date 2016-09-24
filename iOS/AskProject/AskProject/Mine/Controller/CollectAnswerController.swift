//
//  CollectAnswerController.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class CollectAnswerController: BaseController,UITableViewDelegate,UITableViewDataSource{
    
    
    
    @IBOutlet weak var collectTableView: UITableView!
    
    var selectIndex: NSIndexPath!

    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBar.hidden = false
        
        tabBarController?.tabBar.hidden = true
        
    }
    override func viewDidLoad() {
   //1.获取数据源
     self.dataArr.addObjectsFromArray(["在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了"])
       
        //2.长按删除cell
        tapUI()
        
    }
    private func tapUI(){
        
        let longPress = UILongPressGestureRecognizer.init(target: self, action:#selector(CollectAnswerController.longPressTapAction))
        
        longPress.minimumPressDuration = 1
        
        self.collectTableView.addGestureRecognizer(longPress)
    }
    func longPressTapAction(longPress: UILongPressGestureRecognizer){
        
        if  longPress.state == UIGestureRecognizerState.Ended
        {
            let point = longPress.locationInView(self.collectTableView)
            
            self.selectIndex = self.collectTableView.indexPathForRowAtPoint(point)
            
            self.collectTableView.reloadData()
            
            print(self.selectIndex)

          
            
        }
        
    }
    
       func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("CollectQuestionCell") as?CollectQuestionCell
        
        cell?.questionLabel.text = self.dataArr[indexPath.row] as? String
       
        if  self.selectIndex != nil&&self.selectIndex.row == indexPath.row{
            
            
            cell?.delectBtn.hidden = false
            
            
        }else{
            
            cell?.delectBtn.hidden = true
            
        }
        
        cell?.dltBlock = { () in
            
            if self.selectIndex == nil {
                
                return
            }
            self.dataArr.removeObjectAtIndex(self.selectIndex.row)
            
            self.collectTableView.deleteRowsAtIndexPaths([self.selectIndex], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.collectTableView.reloadData()
            
            self.selectIndex = nil
        }
        return cell!
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let  story =   UIStoryboard.init(name: "Home", bundle: nil)
        
        let   detail =  story.instantiateViewControllerWithIdentifier("AnswerDetailController")as!AnswerDetailController
        
        navigationController?.pushViewController(detail, animated: true)

        
    }

    @IBAction func backClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    //懒加载
    
    private lazy var dataArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()

    
}
