//
//  VoiceController.swift
//  AskProject
//
//  Created by bjike on 16/9/19.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit

class VoiceController: UIViewController {
    
    
    @IBOutlet weak var voiceImageView: UIImageView!
    
    @IBOutlet weak var voiceWebView: UIWebView!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        
        //1.移除nav的线
        
        moveNavBarLine()
        
    }
    
    override func viewDidLoad() {
        
        
        //2.设置导航条
        
        setNavagiUI()
        
    }
    
    private func setNavagiUI(){
        
        self.title = "录制语音"
        
       navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("cancel", target: self, action: #selector(VoiceController.backClicked))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.createTitleBarButtonItem("完成", target: self, action: #selector(VoiceController.finishClicked))
    }
    
    func backClicked(){
        
        navigationController?.popViewControllerAnimated(true)
 
        
    }
    func finishClicked(){
        
        navigationController?.popViewControllerAnimated(true)
        
        
    }
    //移除NavBar的线条
    private func moveNavBarLine(){
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "tabBarBackImage"), forBarMetrics: UIBarMetrics.Default)
        
        navigationController?.navigationBar.shadowImage = UIImage.init()
        
    }
    @IBAction func voiceClicked(sender: AnyObject) {
        //长按录音，不按不录，录音做保存

        
        voiceWebView.hidden = false
        
//        let data = NSData.dataWithContentsOfMappedFile(NSBundle.mainBundle().pathForResource("voicegif", ofType: "gif")!)as! NSData
//        
//        voiceWebView.loadData(data, MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
        
        
        
    }
    
    @IBAction func playClicked(sender: AnyObject) {
        
        
    }
    
    
    @IBAction func revoiceClicked(sender: AnyObject) {
        
        
    }
}
