//
//  ZoomViewController.swift
//  SlideShowApp
//
//  Created by swiftdev on 2016/03/16.
//  Copyright © 2016年 kiyoko.ohashi. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var ZoomImageView: UIImageView!
    @IBOutlet weak var RtnBtn: UIButton!
    
    
    var ZoomImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //ViewControllerから受け取った画像
        ZoomImageView.image = ZoomImage
        
        //RtnBtnの名前
        RtnBtn.setTitle("戻る", forState: UIControlState.Normal)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
