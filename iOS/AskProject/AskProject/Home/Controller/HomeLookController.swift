//
//  HomeLookController.swift
//  AskProject
//
//  Created by bjike on 16/9/18.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class HomeLookController: UIViewController {
    
    
    var questionStr: String?
    
    var answerStr: String?
    
    var linkStr: String?
    
    var timeStr: String?
    
    @IBOutlet weak var headImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var linkLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        
        navigationController?.navigationBar.hidden = true
        
    }
    
    override func viewDidLoad() {
        
        //1.初始化UI
        
        setUI()
        
        
        
    }
    
    private func setUI(){
        
        //传参过来的
        
        
        questionLabel.text = questionStr
        
        answerLabel.text = answerStr
        
        linkLabel.text = linkStr
        
        timeLabel.text = timeStr
        
    }
    @IBAction func backClicked(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func linkClicked(sender: AnyObject) {
        
        
    }
    @IBAction func voiceClicked(sender: AnyObject) {
        
        
    }

}
