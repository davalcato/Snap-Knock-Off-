//
//  ContainerView.swift
//  Snap(Knock-Off)
//
//  Created by Daval Cato on 5/22/18.
//  Copyright © 2018 Daval Cato. All rights reserved.
//

import UIKit

class ContainerView: UIViewController {

    @IBOutlet var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let left = self.storyboard?.instantiateViewController(withIdentifier: "leftViewNav") as! UINavigationController
        
        self.addChildViewController(left)
        self.scroll.addSubview(left.view)
        self.didMove(toParentViewController: self)
        
        let middle = self.storyboard?.instantiateViewController(withIdentifier: "middle") as! MiddleView
        self.addChildViewController(middle)
        self.scroll.addSubview(middle.view)
        self.didMove(toParentViewController: self)
        
        var middleFrame: CGRect = middle.view.frame
        middleFrame.origin.x = self.view.frame.width
        middle.view.frame = middleFrame
        
        let right = self.storyboard?.instantiateViewController(withIdentifier: "right") as! RightView
        self.addChildViewController(right)
        self.scroll.addSubview(right.view)
        self.didMove(toParentViewController: self)
        
        var rightFrame: CGRect = right.view.frame
        rightFrame.origin.x = 2 * self.view.frame.width
        right.view.frame = rightFrame
        
        
        self.scroll.contentSize = CGSize(width: (self.view.frame.width) * 3, height: (self.view.frame.height))
        
        
    }

   

}
