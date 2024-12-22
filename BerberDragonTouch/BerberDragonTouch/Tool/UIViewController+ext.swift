//
//  UIViewController+ext.swift
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//

import UIKit

extension UIViewController {
    func sceneDelegateFromView() -> SceneDelegate? {
        guard let window = self.view.window else {
            return nil
        }
        
        guard let windowScene = window.windowScene else {
            return nil
        }
        
        if let sceneDelegate = windowScene.delegate as? SceneDelegate {
            return sceneDelegate
        }
        
        return nil
    }
}
