//
//  MineData.swift
//  AskProject
//
//  Created by bjike on 16/9/7.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class MineData: NSObject {

       func getMeData() -> NSArray{
        
        let dic1: [String: AnyObject] = ["name":"消息","img":"message.png"]
        
        let dic2: [String: AnyObject] = ["name":"收藏答案","img":"collect.png"]
        
        let dic3: [String: AnyObject] = ["name":"关注问题","img":"focus.png"]
        
        let dic4: [String: AnyObject] = ["name":"我的题库","img":"myanswer.png"]
        
        let dic5: [String: AnyObject] = ["name":"设置","img":"setting.png"]
        
        let arr5 = [dic1,dic2,dic3,dic4,dic5]
        
        return arr5
        
    }
    
}
