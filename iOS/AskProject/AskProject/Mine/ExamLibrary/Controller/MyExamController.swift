//
//  MyExamController.swift
//  AskProject
//
//  Created by bjike on 16/9/11.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class MyExamController: BaseController,UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("MineExamCell") as?MineExamCell
        
        
        return cell!
    }
    
    
    
    @IBAction func addClicked(sender: AnyObject) {
        
        pushControllerUI("AddExamController")
        
    }
    @IBAction func backClicked(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    private func pushControllerUI(name:String){
        
        let  story =   UIStoryboard.init(name: name, bundle: nil)
        
        let   vc =  story.instantiateViewControllerWithIdentifier(name)
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    //懒加载
    
    private lazy var dataArr: NSMutableArray = {
        
        var array = NSMutableArray()
        
        return array
        
    }()
    
}
