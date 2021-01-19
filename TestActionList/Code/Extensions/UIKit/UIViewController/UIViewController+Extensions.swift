//
//  UIViewController+Extensions.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

extension UIViewController {
    
    @objc func popAction() {
        popController()
    }
    
    @objc func dismissAction() {
        dismissController()
    }
    
    func dismissController(animated: Bool = true) {
        dismiss(animated: animated)
    }
    
    func popController(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
}
