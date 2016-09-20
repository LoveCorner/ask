//
//  VoiceController.swift
//  AskProject
//
//  Created by bjike on 16/9/19.
//  Copyright © 2016年 bjike. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceController: UIViewController,AVAudioRecorderDelegate,AVAudioPlayerDelegate {
    //录音
    var recorder: AVAudioRecorder?
    //播放
    var player: AVAudioPlayer?
    
    var url: NSURL!
    
    var timer : NSTimer!

    
    @IBOutlet weak var recordBtn: UIButton!
    
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var delectBtn: UIButton!
    
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
        //3.初始化UI
        setUI()
        
    }
    private func setUI(){
        
        
        playBtn.enabled = false
        
        playBtn.setBackgroundImage(UIImage(named: "play"), forState: UIControlState.Normal)
        
        playBtn.setBackgroundImage(UIImage(named: "zanting"), forState: UIControlState.Selected)
        
        createFileDir()
        
        //定时器计时
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(VoiceController.timerAction), userInfo: nil, repeats: true)
        
        timer.fireDate = NSDate.distantFuture()

    }
    private func createFileDir(){
        
        //let date = NSDate.init(timeIntervalSince1970: 1431024488)

        let formatter = NSDateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateStr = formatter.stringFromDate(NSDate())
        
        let name = dateStr+".aiff"
        
        let path =  NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).first! + name
        
        url = NSURL.fileURLWithPath(path)

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

        recordBtn.selected = !recordBtn.selected
        
        startRecord()
        
    }
    
    private func startRecord(){
        
        
        if !recordBtn.selected {
            //取消定时器
//            timer.invalidate()
//            
//            timer = nil
            //关闭定时器
            timer.fireDate = NSDate.distantFuture()
            
            isHided(true)
            
            recorder?.stop()
            
            playBtn.enabled = true
            
            recorder = nil
            
            do{
                
            player = try AVAudioPlayer.init(contentsOfURL: url)
             
            player?.delegate = self
                
            }catch{
                
                if player == nil {
                    
                    print(error)
                }
            }
            
            return
        }
       
        
        do{
            
            playBtn.enabled = false

            recorder = try AVAudioRecorder.init(URL: url, settings: [AVNumberOfChannelsKey:2,AVSampleRateKey:44100,AVLinearPCMBitDepthKey:32,AVEncoderAudioQualityKey:String(AVAudioQuality.Max),AVEncoderBitRateKey:128000])
            
            recorder?.prepareToRecord()
            
            recorder?.record()
            
            recorder?.delegate = self
            //打开定时器
            timer.fireDate = NSDate.distantPast()

            player = nil
            //读取沙盒文件里的gif文件
            
            readGifFile()
            
        }catch{
            
            print(error)
        }

        
    }
    
    func timerAction(){
        
        var hour = 0
        
        var minuter = 0
        
        var second = 0

        second += 1
        
        if second == 60 {
            
            second = 0
            
            minuter += 1
            
        }
        
        if minuter == 60 {
            
            minuter = 0
            
            hour += 1
            
        }
        
       if hour == 24 {
            
            hour = 0
            
        }
        
//        timeLabel.text = "\(hour)"+"\(minuter)"+"\(second)"
        
        timeLabel.text = NSString(format: "%02d:%02d:%02d",hour,minuter,second) as String

        print(timeLabel.text)
        
    }
    private func readGifFile(){
        
        let file = NSBundle.mainBundle().pathForResource("voicegif", ofType: "gif")
        
        if file != nil {
            
            isHided(false) 
            
            let fileUrl = NSURL.fileURLWithPath(file!)
            
            let data = NSData(contentsOfFile: file!)
            
            voiceWebView.loadData(data!, MIMEType: "image/gif", textEncodingName: "utf-8", baseURL: fileUrl)
            
            
        }
        
        
    }

    private func isHided(isHide: Bool){
        
        voiceWebView.hidden = isHide
        
        voiceImageView.hidden = !isHide
    }
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
        player.pause()
        
    }
    //录音完成
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        
        let manager = NSFileManager.defaultManager()
        
        let path =  NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!
        
        let array = manager.subpathsAtPath(path)
        
        let muArray = NSMutableArray()
        
        for audioStr:String in array! {
            
            
            if audioStr.hasSuffix("aiff") {
                
                muArray.addObject(audioStr)
                
            }
        }
        
        
        
    }
    @IBAction func playClicked(sender: AnyObject) {
        
        playBtn.selected = !playBtn.selected
        
        if playBtn.selected {
            
            if player != nil {
                
                player?.play()
 
            }
            
        }else{
            
            player?.pause()
            
        }
        
    }
    
    
    @IBAction func revoiceClicked(sender: AnyObject) {
        
        
    }
}
