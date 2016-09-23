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
    
    override func viewDidLoad() {
        
        self.dataArr.addObjectsFromArray(["在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了","在ios8以前，我们实现tableview中滑动显示删除，置顶，更多等等的按钮时，都需要自己去实现，在ios8中系统已经写好了，只要一个代理方法和一个类就行了",])

        
    }
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBar.hidden = false
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

        cell!.delectBlock = { () in
        
            if cell?.selectPath == nil {
                
                return
            }
        self.dataArr.removeObjectAtIndex(cell!.selectPath.row)
        
        self.careTableView.deleteRowsAtIndexPaths([cell!.selectPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        self.careTableView.reloadData()
        
        }

        
        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as!CareCell
        
        if (cell.isDelect != nil) {
            
            cell.selectPath = indexPath
            
            cell.delectBtn.hidden = !cell.isDelect
            
            
        }
        
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
