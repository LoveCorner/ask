//
//  CareCell.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class CareCell: UITableViewCell {
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    

    @IBOutlet weak var recommentLabel: UILabel!
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var delectBtn: UIButton!
    
    override func awakeFromNib() {
        
        delectBtn.hidden = true
        
    }
    
    @IBAction func delectClicked(sender: AnyObject) {
        
        
    }
    
    
    
}
