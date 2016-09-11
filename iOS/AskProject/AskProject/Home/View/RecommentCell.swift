//
//  RecommentCell.swift
//  AskProject
//
//  Created by bjike on 16/9/7.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

typealias funcBlock = (vc: UIViewController) ->()


class RecommentCell: UITableViewCell {


    var blockProperty: funcBlock?
    
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var headImage: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var goodBtn: UIButton!
    
    @IBOutlet weak var answerBtn: UIButton!
    
    @IBAction func goodBtnClicked(sender: AnyObject) {
        
        goodBtn.selected = !goodBtn.selected
        
    }
    
    
    @IBAction func answerBtnClicked(sender: AnyObject) {
                
        answerBtn.selected = true
        
        //block回调进入回答界面
        
        let  story =   UIStoryboard.init(name: "AnswerQuestionController", bundle: nil)
        
        let   answer =  story.instantiateViewControllerWithIdentifier("AnswerQuestionController")
        
        blockProperty!(vc: answer)
        }
    
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
        goodBtn.setImage(UIImage(named: "zan_click"), forState: UIControlState.Selected)
        
        goodBtn.setImage(UIImage(named: "zan"), forState: UIControlState.Normal)

        
    }
}
