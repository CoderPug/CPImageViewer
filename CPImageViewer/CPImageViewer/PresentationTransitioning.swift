//
//  PresentationTransitioning.swift
//  CPImageViewer
//
//  Created by Jose Torres on 18/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit

class FullScreenTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let originViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let destinationViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                return
        }
        let containerView = transitionContext.containerView
        
        let finalFrame = transitionContext.finalFrame(for: destinationViewController)
        
        let snapshot = destinationViewController.view.snapshotView(afterScreenUpdates: true)
        snapshot?.frame = originFrame
        snapshot?.layer.masksToBounds = true
        
        containerView.addSubview(destinationViewController.view)
        containerView.addSubview(snapshot!)
        destinationViewController.view.isHidden = true
        
        let duration = transitionDuration(using: transitionContext)
        
        
        UIView.animate(withDuration: duration,
                       animations: {
                        
                        originViewController.view.alpha = 0
                        snapshot?.frame = finalFrame
                        
        }, completion: { _ in
            
            originViewController.view.alpha = 1
            destinationViewController.view.isHidden = false
            snapshot?.removeFromSuperview()
            transitionContext.completeTransition(true)
        })
    }
}
