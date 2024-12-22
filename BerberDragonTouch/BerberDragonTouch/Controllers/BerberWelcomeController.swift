//
//  WelcomeVC.swift
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//


import UIKit

class BerberWelcomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func Go(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! BerberHomeController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  
}
