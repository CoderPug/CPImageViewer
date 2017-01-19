//
//  ViewController.swift
//  CPImageViewerDemo
//
//  Created by Jose Torres on 17/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit
import CPImageViewer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let temp = UIImageView()
        temp.sayHi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

