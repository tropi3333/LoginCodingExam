//
//  UIViewController+Ext.swift
//  CodingExamSevenSeven
//
//  Created by Jomar Calandria on 8/28/24.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    func showloadingView(){
         containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .black
        containerView.alpha = 1
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.08
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView(){
        containerView.removeFromSuperview()
        containerView = nil
    }
}
