//
//  ViewController.swift
//  SlideShowApp
//
//  Created by swiftdev on 2015/01/01.
//  Copyright © 2015年 kiyoko.ohashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var BackBtn: UIButton!
    @IBOutlet weak var SlideShowBtn: UIButton!
    @IBOutlet weak var NextBtn: UIButton!

//画像の配列
    let slideImages = [
        UIImage (named: "slideimage_1.jpg")!,
        UIImage (named: "slideimage_2.jpg")!,
        UIImage (named: "slideimage_3.jpg")!,
        UIImage (named: "slideimage_4.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//slideimage_1.jpgから表示
        imageView.image = slideImages[0]
        SlideShowBtn.setTitle("再生 >", forState: UIControlState.Normal)
        SlideShowBtn.addTarget(self, action: "Play:", forControlEvents: UIControlEvents.TouchUpInside)
        BackBtn.setTitle("|< 戻る", forState: UIControlState.Normal)
        NextBtn.setTitle("進む >|", forState: UIControlState.Normal)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//タップして画面遷移（未着手）
    
//タイマーを使ってスライドショーを作る --- 未完成
    //参考にしたものhttps://sites.google.com/a/gclue.jp/swift-docs/ni-yinki100-ios/2-utility/taimawo-zhimeru
    //参考にしたものhttp://tiny-wing.hatenablog.com/entry/2015/11/04/092413
    
    
    //タイマー
    weak var timer:NSTimer?
    
    //タイマースタートセット
    @IBAction func Play(sender: UIButton) {

        //タイマーが動いているかチェック
            if timer?.valid == false {
                
        //タイマーを動かす --　動かない・・・selectorをupdate:にしてみた
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "update", userInfo: nil, repeats: true)
        
        //停止ボタンに変更
        SlideShowBtn.setTitle("停止", forState: UIControlState.Normal)
                
        //他のボタンを無効に
        BackBtn.enabled = false
        NextBtn.enabled = false
        
        }
        else {
        //タイマーを止める
        timer?.invalidate()

        //再生ボタンに変更
        SlideShowBtn.setTitle("再生 >", forState: UIControlState.Normal)
                
        //他のボタンを有効に
        BackBtn.enabled = true
        NextBtn.enabled = true
                
        }
}

    var i = 0
    
//スライドショー開始（下のnxbtnと同じ？？）--- 未完成
    func update(timer: NSTimer) {
        let slideNum = slideImages.count
        i += 1
        if i == slideNum {
            i = 0
        }
        imageView.image = slideImages[i]
    }


 //戻るボタンを押すと前の写真へ（写真総数に達したものは最後のスライドへその他は前のスライドへ）

    @IBAction func bkbtn(sender: AnyObject) {
        let slideNum = slideImages.count
        if i == 0 {
            i = slideNum
        }
        i -= 1
        imageView.image = slideImages[i]
        }
 //進むボタンを押すと次の写真へ（次のスライドへ、写真総数に達したものは最初のスライドへ）
    @IBAction func nxbtn(sender: AnyObject) {
        let slideNum = slideImages.count
        i += 1
        if i == slideNum {
            i = 0
        }
        imageView.image = slideImages[i]
        }
    
}

