//
//  CareCell.swift
//  AskProject
//
//  Created by bjike on 16/9/10.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

typealias CareDelectBlock = () ->()

class CareCell: UITableViewCell {
    
    var delectBlock: CareDelectBlock?
        
    @IBOutlet weak var questionLabel: UILabel!
    

    @IBOutlet weak var recommentLabel: UILabel!
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var delectBtn: UIButton!
    
    override func awakeFromNib() {
        


    }
    @IBAction func delectClicked(sender: AnyObject) {
        
        delectBlock!()
        
        delectBtn.hidden = true
    }
    
    
    
}
