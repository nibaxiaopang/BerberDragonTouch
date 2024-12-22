//
//  HomeVC.swift
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//


import UIKit
import StoreKit

class BerberHomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tblView: UITableView!
    var arrList = ["Get To Draw Burber Alphabets","Get To My Alphabets","Get To Burber Quotes","Share Berber Dragon Touch","Rating Berber Dragon Touch","Privacy Policy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib.init(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        navigationController?.navigationBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        cell.lblMain.text = arrList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectVC") as! BerberSelectController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyAlpahVC") as! BerberMyAlpahControllers
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuotesVC") as! BerberQuotesController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
            let objectsToShare = ["Berber Dragon Touch"]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            activityVC.popoverPresentationController?.sourceRect = CGRect(x: 100, y: 200, width: 300, height: 300)
            self.present(activityVC, animated: true, completion: nil)
        }else if indexPath.row == 4{
            SKStoreReviewController.requestReview()
        }else if indexPath.row == 5{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "BerberPrivacyController") as! BerberPrivacyController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
