//
//  CareQuestionController.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class CareQuestionController: BaseController,UITableViewDelegate,UITableViewDataSource{
        
    @IBOutlet weak var careTableView: UITableView!
    
    var selectPath: NSIndexPath!

    
    override func viewDidLoad() {
        //1.获取数据源
        self.dataArr.addObjectsFromArray(["在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了",])

        //2.长按删除cell
        tapUI()
        
        
    }
    
     private func tapUI(){
        
        let longPress = UILongPressGestureRecognizer.init(target: self, action:#selector(CareQuestionController.longPressTapAction))
        
        longPress.minimumPressDuration = 1
        
        self.careTableView.addGestureRecognizer(longPress)
    }
    func longPressTapAction(longPress: UILongPressGestureRecognizer){
        
        if  longPress.state == UIGestureRecognizerState.Ended{
            
            
            let point = longPress.locationInView(self.careTableView)
            
            self.selectPath = self.careTableView.indexPathForRowAtPoint(point)
            
            self.careTableView.reloadData()
            
            print(self.selectPath)
            
        }
        
    }

    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBar.hidden = false
        
        tabBarController?.tabBar.hidden = true
        
    }
    
    @IBAction func backClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("CareCell") as?CareCell
        
        cell?.questionLabel.text = self.dataArr[indexPath.row] as? String

       
        if  self.selectPath != nil&&self.selectPath.row == indexPath.row{
            

            cell?.delectBtn.hidden = false
            
            
        }else{
            
            cell?.delectBtn.hidden = true
  
        }
        cell!.delectBlock = { () in
        
            if self.selectPath == nil {
                
                return
            }
        self.dataArr.removeObjectAtIndex(self.selectPath.row)
        
        self.careTableView.deleteRowsAtIndexPaths([self.selectPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        self.careTableView.reloadData()
            
        self.selectPath = nil
        }


        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let  story =   UIStoryboard.init(name: "Home", bundle: nil)
        
        let   detail =  story.instantiateViewControllerWithIdentifier("HomeAnswerController")as!HomeAnswerController
                    
        navigationController?.pushViewController(detail, animated: true)

      
    }
    //懒加载
    
     
    private lazy var dataArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()
    
    
}
