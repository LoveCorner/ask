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
    
    var isDelect: Bool!
    
    @IBOutlet weak var questionLabel: UILabel!
    

    @IBOutlet weak var recommentLabel: UILabel!
    
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBOutlet weak var delectBtn: UIButton!
    
    override func awakeFromNib() {
        
        delectBtn.hidden = true
        
        isDelect = false
        
        let longPress = UILongPressGestureRecognizer.init(target: self, action:#selector(CareCell.longPressTapAction))
        
        longPress.minimumPressDuration = 1
        
        self.contentView.addGestureRecognizer(longPress)

    }
    func longPressTapAction(longPress: UILongPressGestureRecognizer){
        
        if  longPress.state == UIGestureRecognizerState.Ended{

            
             delectBtn.hidden = false
            
        }
        
    }
    @IBAction func delectClicked(sender: AnyObject) {
        
        delectBlock!()
        
    }
    
    
    
}
