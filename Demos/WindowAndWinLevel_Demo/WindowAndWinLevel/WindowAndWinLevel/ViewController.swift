//
//  ViewController.swift
//  WindowAndWinLevel
//
//  Created by MayerF on 2017/11/23.
//  Copyright © 2017年 MayerF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let showWindow = UIButton()
    let maskStatuBar = UIButton()
    let floatWin = FloatWindow()
    
    override func loadView() {
        super.loadView()
        showWindow.frame = CGRect.init(x: 100, y: 100, width: 100, height: 50)
        showWindow.setTitle("重置window", for: .normal)
        showWindow.setTitle("跳转", for: .selected)
        maskStatuBar.frame = CGRect.init(x: 100, y: 200, width: 100, height: 50)
        maskStatuBar.setTitle("覆盖状态栏", for: .normal)
        showWindow.addTarget(self, action: #selector(showWindowOnClick), for: .touchUpInside)
        maskStatuBar.addTarget(self, action: #selector(maskStatuBarOnClick), for: .touchUpInside)
        
        view.addSubview(showWindow)
        view.addSubview(maskStatuBar)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    @objc func showWindowOnClick() {
        if showWindow.isSelected {
            navigationController?.pushViewController(OtherViewController(), animated: true)
        }else {
            show()
        }
        showWindow.isSelected = !showWindow.isSelected
    }
    @objc func maskStatuBarOnClick() {
        UIApplication.shared.keyWindow?.windowLevel = UIWindowLevelStatusBar + 1
    }
    func show() {
        UIApplication.shared.keyWindow?.windowLevel = UIWindowLevelNormal
        let size = UIScreen.main.bounds.size
        floatWin.frame = CGRect(x: size.width - 100, y: size.height/2 - 50, width: 100, height: 100)
        UIApplication.shared.keyWindow?.addSubview(floatWin)
    }

}

