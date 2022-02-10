//
//  UIViewControllerHelper.swift
//  CondeNast_Akhilesh
//
//  Created by Akhilesh Kumar Singh on 09/02/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    var activityIndicator : UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func showLoader() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = false
            self.activityIndicator.center = self.view.center
            self.activityIndicator.isHidden = false
            self.activityIndicator.tintColor = UIColor.black
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    func removeLoader() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
}
