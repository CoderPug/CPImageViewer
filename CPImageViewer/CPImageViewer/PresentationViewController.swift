//
//  PresentationViewController.swift
//  CPImageViewer
//
//  Created by Jose Torres on 18/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit

class FullScreenViewControlller : UIViewController {
    
    var scrollView: UIScrollView
    var originalImageView: CPImageView?
    var imageView: UIImageView
    
    let presentAnimationController = FullScreenTransitioning()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        imageView = UIImageView()
        scrollView = UIScrollView()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        imageView = UIImageView()
        scrollView = UIScrollView()
        
        super.init(coder: aDecoder)
    }
    
    init(_ pImageView: CPImageView) {
        
        guard let imageCopy = pImageView.copy() as? CPImageView else {
            imageView = UIImageView()
            scrollView = UIScrollView()
            super.init(nibName: nil, bundle: nil)
            return
        }
        
        originalImageView = pImageView
        imageView = imageCopy
        scrollView = UIScrollView()
        
        super.init(nibName: nil, bundle: nil)
        
        transitioningDelegate = self
        
        scrollView.frame = view.frame
        imageView.frame = scrollView.frame
        
        imageView.contentMode = .scaleAspectFit
        scrollView.maximumZoomScale = 2.0
        scrollView.minimumZoomScale = 1.0
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        
        view.addSubview(scrollView)
        
        let button = UIButton(type: .infoLight)
        button.frame = CGRect(x: view.frame.size.width - 50, y: 50, width: 50, height: 50)
        button.addTarget(self, action: #selector(dismissFullScreen), for: .touchUpInside)
        view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissFullScreen() {
        
        originalImageView?.isHidden = false
        dismiss(animated: true, completion: nil)
    }
}

extension FullScreenViewControlller: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
}

extension FullScreenViewControlller: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        presentAnimationController.originFrame = originalImageView?.frame ?? CGRect.zero
        return presentAnimationController
    }
}
