//
//  MessageController.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class PersonMessageController: BaseController {
    
    
    @IBOutlet weak var answerSwitch: UISwitch!
    
    @IBOutlet weak var pushSwitch: UISwitch!
    
    override func viewWillAppear(animated: Bool) {
        
        //1.隐藏标签栏
        tabBarController?.tabBar.hidden = true
        
    }
    override func viewDidLoad() {
        
    
        
        
    }
    
    @IBAction func backClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func answerChanged(sender: AnyObject) {
        
        
    }
    
    
    @IBAction func pushChanged(sender: AnyObject) {
        
        
    }
}
