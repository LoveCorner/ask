//
//  CollectQuestionCell.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

typealias DelectBlock = () ->()

class CollectQuestionCell: UITableViewCell {

    var dltBlock: DelectBlock?
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
       
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var headImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var delectBtn: UIButton!
    
    
    
    @IBAction func delectClicked(sender: AnyObject) {
      //删除cell和数据
        
        dltBlock!()
        
        delectBtn.hidden = true
        
    }
    
}
