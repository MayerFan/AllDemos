//
//  FloatWindow.swift
//  WindowAndWinLevel
//
//  Created by MayerF on 2017/11/23.
//  Copyright © 2017年 MayerF. All rights reserved.
//

import UIKit

class FloatWindow: UIWindow {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        
        let rootVC = UIViewController();
        self.rootViewController = rootVC;
        self.isHidden = false;
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let keyWin = UIApplication.shared.keyWindow
        let touch: UITouch = touches.first!
        let point = touch.location(in: keyWin)

        self.center = point
        self.bounds = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        var pointY = self.center.y
        if (pointY < self.frame.size.height/2) {
            pointY = self.frame.size.height/2
        }else if (pointY > UIScreen.main.bounds.height - self.frame.size.height/2) {
            pointY = UIScreen.main.bounds.height - self.frame.size.height/2;
        }
        self.center = CGPoint.init(x: UIScreen.main.bounds.width - self.frame.size.width/2, y: pointY)
        self.bounds = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
