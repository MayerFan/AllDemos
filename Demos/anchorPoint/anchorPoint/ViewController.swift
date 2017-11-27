//
//  ViewController.swift
//  anchorPoint
//
//  Created by MayerF on 2017/11/14.
//  Copyright © 2017年 MayerF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cankaoView = UIView(frame: CGRect(x: 200, y: 0, width: 100, height: 100))
        cankaoView.backgroundColor = .red
        
        let subLayer = CALayer()
        subLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        subLayer.backgroundColor = UIColor.red.cgColor
        
        view.layer.addSublayer(subLayer)
        view.addSubview(cankaoView)
    
        /*
         *  layer的默认position为（0，0） 默认锚点为（0.5, 0.5）
         *  layer的位置一旦确定 之后确定锚点比例为（0.5， 0.5） 那么锚点的真实位置就移动到position上 就此确定了。
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

