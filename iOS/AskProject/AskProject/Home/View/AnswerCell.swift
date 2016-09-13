//
//  AnswerCell.swift
//  AskProject
//
//  Created by bjike on 16/9/13.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {

    
    
    @IBOutlet weak var headImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var answerImage: UIImageView!
    
    
    
    @IBOutlet weak var commentBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
