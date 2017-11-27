//
//  SummaryViewController.swift
//  WindowAndWinLevel
//
//  Created by MayerF on 2017/11/23.
//  Copyright © 2017年 MayerF. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "总结"
        
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.text = " 1. ios11之后系统强制要求每个window对象必须拥有一个rootVC来管理添加到window上的视图。\n\n 2. 任何时刻有且只有一个keywindow。keywindow和其它window的区别：keywindow可以接收键盘和其它非触摸事件，如果是触摸事件，则遵循响应者链条(The key window receives keyboard and other non-touch related events. Only one window at a time may be the key window.)\n\n 3. 尽量不要使用makeKeyAndVisible()来改变keywindow，除非必要。\n\n 4. 状态栏和默认的keywindow属于同一层级，他们有共同的容器。keywindow默认为UIWindowLevelNormal，而状态栏默认为UIWindowLevelStatusBar。若想使keywindow放到上面，可以使keywindow得level大于UIWindowLevelStatusBar。(注意：如果keywindow中添加一个子Window，只要keywindowlevel不变，子window无论多大，都不会覆盖状态栏。因为和keywindow同级，不和子Window同级。)"
    }

}
