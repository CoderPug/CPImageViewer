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
        
        let imageView = CPImageView(image: UIImage(named: "image"))
        imageView.frame = CGRect(x: 50, y: 50, width: 250, height: 150)
        imageView.parentViewController = self
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

