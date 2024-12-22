//
//  DrawVC.swift
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//


import UIKit

class BerberDrawControllers: UIViewController {

    @IBOutlet weak var lblAlpah: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var viewSign: BerberSignatureView!
   
    
    var alpha = ""
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()

    
        navigationController?.navigationBar.isHidden = true
        self.lblAlpah.text = alpha
        
        viewSign.setLineColor(UIColor.black)
        viewSign.setLineWidth(8.0)
        viewSign.foregroundLineColor = UIColor.black
        
        let arrData = sceneDelegateFromView()?.getData() ?? NSMutableArray()
        
        if arrData.contains(self.alpha) {
            self.btnAdd.setTitle("Remove In My Alphabets", for: .normal)
        } else {
            self.btnAdd.setTitle("Add In My Alphabets", for: .normal)
        }
        
    }
    
    func showAlerts(titlaAlert:String, messageAlert:String) {
        let alert = UIAlertController.init(title: titlaAlert, message: messageAlert, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default))
        sceneDelegateFromView()?.window?.rootViewController?.present(alert, animated: true)
    }
    
    @IBAction func Add(_ sender: Any) {
        let arrData = sceneDelegateFromView()?.getData() ?? NSMutableArray()
        
        if arrData.contains(self.alpha) {
            arrData.remove(self.alpha)
            sceneDelegateFromView()?.saveData(array: arrData)
            self.btnAdd.setTitle("Add In My Alphabets", for: .normal)
            showAlerts(titlaAlert: "Berber Dragon Touch", messageAlert: "Alphabet Removed In My Alphabets")
        } else {
            arrData.add(self.alpha)
            sceneDelegateFromView()?.saveData(array: arrData)
            self.btnAdd.setTitle("Remove In My Alphabets", for: .normal)
            showAlerts(titlaAlert: "Berber Dragon Touch", messageAlert: "Alphabet Added In My Alphabets")

    }
    }
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Downlaod(_ sender: Any) {
        guard let image = viewSign.image else {
            // Handle the case where there is no image to save
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // Handle the error
            print("Error saving image: \(error.localizedDescription)")
        } else {
            let alert = UIAlertController(title: "Berber Dragon Touch", message: "Image saved successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "ok", style: .default))
            self.present(alert, animated: true)
            print("Image saved successfully")
        }
    }
    
    
    @IBAction func Share(_ sender: Any) {
        let objectsToShare = [self.viewSign.image]
        let activityVC = UIActivityViewController(activityItems: objectsToShare as [Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        activityVC.popoverPresentationController?.sourceRect = CGRect(x: 100, y: 200, width: 300, height: 300)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func Clear(_ sender: Any) {
        self.viewSign.clear()
    }
    
   
}
