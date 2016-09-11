//
//  MineExamCell.swift
//  AskProject
//
//  Created by bjike on 16/9/11.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class MineExamCell: UITableViewCell {

    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerOneLabel: UILabel!
    
    
    @IBOutlet weak var answerTwoLabel: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    backView.layer.cornerRadius = 5   
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
