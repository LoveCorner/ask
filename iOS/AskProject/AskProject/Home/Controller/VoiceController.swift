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
    var recorder: AVAudioRecorder!
    //播放
    var player: AVAudioPlayer!
    
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
        //4.初始化录音
        createFileDir()
        do{
            
            //kAudioFormatMPEG4AAC录音格式  kAudioFormatMPEGLayer3 mp3格式,AVEncoderBitRateKey:128000
            recorder = try AVAudioRecorder.init(URL: self.url, settings: [AVFormatIDKey:NSNumber(int:Int32(kAudioFormatMPEG4AAC)),AVNumberOfChannelsKey:NSNumber(int:1),AVSampleRateKey:NSNumber(float: Float(44100.0)),AVLinearPCMBitDepthKey:NSNumber(unsignedInt:16),AVEncoderAudioQualityKey:NSNumber(int:Int32( AVAudioQuality.Medium.rawValue))])
            //开启音量检测
            recorder?.meteringEnabled = true
    
            recorder?.delegate = self
            
        }catch{
            
            print(error)
        }
        

        //定时器计时
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(VoiceController.timerAction), userInfo: nil, repeats: true)
        
        timer.fireDate = NSDate.distantFuture()

    }
    private func createFileDir(){
        
        
        let path =  NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last! + "/voice.aac"
        
       self.url = NSURL.fileURLWithPath(path)

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
            //删除录音文件和终止录音
//            recorder?.deleteRecording()
 
            recorder?.stop()
            
            //取消定时器
//            timer.invalidate()
//            
//            timer = nil
            //关闭定时器
            timer.fireDate = NSDate.distantFuture()
            
            isHided(true)
            
            playBtn.enabled = true
    
            return
        }
       
            playBtn.enabled = false
        
            //准备录音
        if ((recorder?.prepareToRecord()) != nil) {
            
            //录音
            recorder?.record()
            //打开定时器
            timer.fireDate = NSDate.distantPast()
            //读取沙盒文件里的gif文件
            
            readGifFile()
            

        }
        
        
        
    }
    var hour: Int = 0
    
    var minuter: Int = 0
    
    var second: Int = 0
    
    func timerAction(){
        
        //获取音量最大值
        recorder?.peakPowerForChannel(0)
        
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
        
        timeLabel.text = NSString(format: "%02d:%02d:%02d",hour,minuter,second) as String

        second += 1
        
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
   
    @IBAction func playClicked(sender: AnyObject) {
        
        playBtn.selected = !playBtn.selected
        
        if playBtn.selected {
            
            do{
                
                player = try AVAudioPlayer.init(contentsOfURL: self.url)
                
                player.delegate = self
                
            }catch{
                
                print(error)
            }
                
                player?.play()

            isHided(false)
            
            readGifFile()
            
        }else{
            
            player?.stop()
            
            isHided(true)

            return
            
        }
        
    }
    //播放完毕
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
       playBtn.selected = false
        
        isHided(true)
        
        player.stop()
        
    }
    @IBAction func revoiceClicked(sender: AnyObject) {
        
       //删除录制文件
        recorder?.deleteRecording()
        
        timeLabel.text = "00:00:00"
        
        hour = 0
        
        minuter = 0
        
        second = 0
        
    }
}
