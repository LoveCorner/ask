//
//  SearchResultCell.swift
//  AskProject
//
//  Created by bjike on 16/9/19.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var selectBtn: UIButton!
    
    @IBOutlet weak var headImage: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        selectBtn.setBackgroundImage(UIImage(named: "unclick"), forState: UIControlState.Normal)
        
        selectBtn.setBackgroundImage(UIImage(named: "click"), forState: UIControlState.Selected)

    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectedClicked(sender: AnyObject) {
        
        selectBtn.selected = !selectBtn.selected
        
    }
}
