//
//  ViewController.swift
//  dragFileToTrash
//
//  Created by Robin Mehta on 8/16/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

extension UITextField {
    func useUnderline(width: CGFloat, height: CGFloat) {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.blackColor().CGColor
        border.frame = CGRectMake(0, height - borderWidth, width, height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

class ViewController: UIViewController {
    
    private lazy var trash : UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.grayColor()
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var item : UIView = {
       let view = UIView()
        view.userInteractionEnabled = true
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan)))
        view.backgroundColor = UIColor.redColor()
        self.view.addSubview(view)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let navigationController = self.navigationController {
            navigationController.setNavigationBarHidden(true, animated: true)
        }
        self.view.backgroundColor = UIColor.whiteColor()
        layoutViews()
    }
    
    func layoutViews() {
        trash.sizeToWidth(100)
        trash.sizeToHeight(100)
        trash.pinToRightEdgeOfSuperview(offset: 20)
        trash.pinToBottomEdgeOfSuperview(offset: 20)
        
        item.sizeToWidth(50)
        item.sizeToHeight(50)
        item.pinToLeftEdgeOfSuperview(offset: 20)
        item.pinToTopEdgeOfSuperview(offset: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        recognizer.view!.center = CGPointMake(recognizer.view!.center.x + translation.x, recognizer.view!.center.y + translation.y)
        
        recognizer.setTranslation(CGPointMake(0, 0), inView: self.view)
        
//        if (recognizer.view?.center.x == trash.center.x && recognizer.view?.center.y == trash.center.y) {
//            
//        }
        
        if (trash.frame.contains(item.frame)) {
            UIView.animateWithDuration(1.5, animations: { 
                self.item.alpha = 0.0
            })
        }
    }

    

}

