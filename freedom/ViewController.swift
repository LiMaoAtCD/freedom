//
//  ViewController.swift
//  freedom
//
//  Created by AlienLi on 2017/1/24.
//  Copyright © 2017年 MarcoLi. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation = LOTAnimationView.animationNamed("kkkkkk")
        animation?.contentMode = .scaleAspectFit
        self.view.addSubview(animation!)
        animation?.frame = CGRect.init(x: 0, y: 0, width: 320, height: 400)
        animation?.play(completion: { (finished) in
            //
            
        })
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

