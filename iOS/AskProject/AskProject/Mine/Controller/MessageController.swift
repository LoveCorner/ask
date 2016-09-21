//
//  MessageController.swift
//  AskProject
//
//  Created by bjike on 16/9/11.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class MessageController: BaseController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var msgTableView: UITableView!
    
    
    override func viewDidLoad() {
        
        
        self.dataArr.addObjectsFromArray(["系统方法添加侧滑按钮，附带弹窗与cell加载动画","系统方法添加侧滑按钮，附带弹窗与cell加载动画","系统方法添加侧滑按钮，附带弹窗与cell加载动画","系统方法添加侧滑按钮，附带弹窗与cell加载动画","系统方法添加侧滑按钮，附带弹窗与cell加载动画","系统方法添加侧滑按钮，附带弹窗与cell加载动画"])
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArr.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("MessageCell") as?MessageCell
        
        cell?.questionLabel.text = self.dataArr[indexPath.row] as? String
        

        return cell!
        
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delectRow = UITableViewRowAction(style: .Default,title :"删  除"){
            
            (action: UITableViewRowAction!,indexPath:NSIndexPath!) -> Void in
            
            self.dataArr.removeObjectAtIndex(indexPath.row)
            
            self.msgTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
        
        delectRow.backgroundColor = RGBA(231, g: 39, b: 51, a: 1.0)
        
        return [delectRow]
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
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
