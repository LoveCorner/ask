//
//  MineController.swift
//  AskProject
//
//  Created by bjike on 16/9/5.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class MineController: BaseController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var MineTableView: UITableView!
        
    
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //2.返回按钮点击不隐藏导航和标签
        tabBarController?.tabBar.hidden = false

        navigationController?.navigationBar.hidden = false

    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        //1.获取列表数据
        
        getListData()
        
    }
    

    private func getListData(){
        
//        
//        let data = MineData()
//        //4个
//        for dic in data.getMineData() {
//            
//            let big = MineBigModel.init(dict: dic as![String : AnyObject])
//            
//            self.numArr.addObject(big)
//            
//            let arr: NSArray = dic["dataSources"]as!NSArray
//                    
//                    for subDic in arr {
//                        
//                        let  mine = MineModel.init(dict: subDic as! [String : AnyObject])
//                        
//                        self.dataArr.addObject(mine)
//                        
//                    }
//        }
        
        let data = MineData()
        //4个
        for dic in data.getMeData() {
        
          let  mine = MineModel.init(dict: dic as! [String : AnyObject])
            
          self.dataArr.addObject(mine)
            
        }

        self.MineTableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        return 1
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return self.dataArr.count
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headview = UIView()

        if section == 2 {
          
            headview.frame = CGRectMake(0, 0, ScreenWidth(), 1)
            
            headview.backgroundColor = UIColor.whiteColor()
            
//            let lineView = UIView.init(frame: CGRectMake(26, 0, ScreenWidth()-38, 0.5))
//            
//            lineView.backgroundColor = RGBA(247, g: 247, b: 247, a: 1.0)
//            
//            headview.addSubview(lineView)

            
        }else{
        
        headview.frame = CGRectMake(0, 0, ScreenWidth(), 20)
 
        headview.backgroundColor = RGBA(247, g: 247, b: 247, a: 1.0)
        
            
        }
        return headview

    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 10.0
            
        case 2:
            return 1.0
            
        default:
            return 20.0
            
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier("MineCell") as?MineCell
        
        cell?.showCellUI(self.dataArr[indexPath.section] as? MineModel)
        
        return cell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.section {
        case 0:
            pushControllerUI("MessageController")
            break
        case 1:
            pushControllerUI("CollectAnswerController")
            break
        case 2:
            pushControllerUI("CareQuestionController")
            break
        case 3:
            pushControllerUI("MyExamController")
            break
        default:
           
            pushControllerUI("SettingController")
            break
        }
        
    }
   
    
    @IBAction func headClicked(sender: AnyObject) {
        
        pushControllerUI("HeadController")
 
        
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