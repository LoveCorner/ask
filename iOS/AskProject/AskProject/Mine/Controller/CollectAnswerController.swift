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
    
    override func viewDidLoad() {
   //1.获取数据源
 self.dataArr.addObjectsFromArray(["在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了"])
       
    }
    
       func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("CollectQuestionCell") as?CollectQuestionCell
        
        cell?.questionLabel.text = self.dataArr[indexPath.row] as? String
       
        cell?.dltBlock = { () in
            
            if cell?.selectIndex == nil {
                
                return
            }
            self.dataArr.removeObjectAtIndex(cell!.selectIndex.row)
            
            self.collectTableView.deleteRowsAtIndexPaths([cell!.selectIndex], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.collectTableView.reloadData()
            
        }
        return cell!
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as!CollectQuestionCell
        
        if (cell.isHide != nil) {
            
            cell.selectIndex = indexPath
            
            cell.delectBtn.hidden = !cell.isHide
            
            
        }
        
        
        
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
