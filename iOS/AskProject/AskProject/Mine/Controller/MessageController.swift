//
//  MessageController.swift
//  AskProject
//
//  Created by bjike on 16/9/11.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class MessageController: BaseController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("MessageCell") as?MessageCell
        
        
        return cell!
        
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
