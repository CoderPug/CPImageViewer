//
//  CPImageViewer.swift
//  CPImageViewer
//
//  Created by Jose Torres on 17/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
}

final public class CPImageView: UIImageView, NSCopying {
    
    @IBOutlet public var parentViewController: UIViewController?
    
    public func copy(with zone: NSZone? = nil) -> Any {
        
        let copy = CPImageView(image: image)
        copy.frame = frame
        copy.contentMode = copy.contentMode
        return copy
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        parentViewController = nil
        super.init(coder: aDecoder)
        isUserInteractionEnabled = true
    }
    
    override public func layoutSubviews() {
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(showFullImage))
        addGestureRecognizer(tapGesture)
    }
    
    override public init(image: UIImage?) {
        
        parentViewController = nil
        super.init(image: image)        
        isUserInteractionEnabled = true
    }
    
    @IBAction func showFullImage() {
        
        guard let parentViewController = parentViewController else {
            return
        }
        
        isHidden = true
        
        let fullImageVC = FullScreenViewControlller(self)
        parentViewController.present(fullImageVC, animated: true, completion: nil)
    }

}
