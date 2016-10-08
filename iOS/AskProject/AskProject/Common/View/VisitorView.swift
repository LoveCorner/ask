//
//  AlertView+Category.swift
//  AskProject
//
//  Created by bjike on 16/9/12.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

//定义协议,视图与控制器之间按钮点击事件
protocol VisitorViewDelegate: NSObjectProtocol{
    
    //方法回调
    func cancelBtnWillClicked()
    
    func sureBtnWillClicked()
    
}

class VisitorView: UIView {
    
    //weak避免循环引用
    weak var delegate:VisitorViewDelegate?
    
    //重写父类frame要使用override 并且要实现一个方法    required init?(coder aDecoder: NSCoder)
    func setupVisitorInfo(message:String){
        
         titleLabel.text = message
        
        
    }
    override  init(frame: CGRect) {
        
        super.init(frame: frame)

        self.backgroundColor = RGBA(61, g: 61, b: 61, a: 0.4)

        addSubview(whiteView)
        
        whiteView.addSubview(imageView)
        
        whiteView.addSubview(titleLabel)
        
        whiteView.addSubview(leftBtn)
        
        whiteView.addSubview(rightBtn)

        whiteView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: CGSizeMake(256,125))
        
        imageView.xmg_AlignInner(type: XMG_AlignType.Center, referView: whiteView, size: CGSizeMake(256,125))
        
        titleLabel.xmg_AlignInner(type: XMG_AlignType.Center, referView: whiteView, size: CGSizeMake(256,15), offset:CGPoint( x : 0,y : -27))
        
        leftBtn.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: titleLabel, size: CGSize(width: 95,height: 30), offset:CGPoint( x : 24,y : 27))
        
        rightBtn.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: titleLabel, size: CGSize(width: 95,height: 30), offset:CGPoint( x : -23,y : 27))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var whiteView: UIView = {
        
        let whiteView = UIView.init()
        
        return whiteView
        
    }()
    
    private lazy var imageView: UIImageView = {
        
        let imageView = UIImageView.init()
        
        imageView.image = UIImage(named: "target_bg")

        return imageView
    }()
    private lazy var titleLabel:  UILabel = {
        
        let titleLabel = UILabel()
        
        titleLabel.font = UIFont.systemFontOfSize(15)
        
        titleLabel.textColor = RGB(0x333333)
        
        titleLabel.textAlignment = NSTextAlignment.Center

        return titleLabel
        
    }()
    private lazy var leftBtn: UIButton = {
        
        let btn = UIButton()
        
        btn.setBackgroundImage(UIImage(named: "cancel_bottom"), forState: UIControlState.Normal)
        
        btn.addTarget(self, action: #selector(VisitorView.cancelBtnClicked), forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
    }()
    
    private lazy var rightBtn: UIButton = {
        
        let btn = UIButton()
        
        btn.setBackgroundImage(UIImage(named: "sure_bottom"), forState: UIControlState.Normal)
        
        btn.addTarget(self, action: #selector(VisitorView.sureBtnClicked), forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
    }()
    
    func cancelBtnClicked(){
        
        //不用判断
        delegate?.cancelBtnWillClicked()
        
    }
    
    func sureBtnClicked(){
        
        delegate?.sureBtnWillClicked()
        
        
    }
    


}
