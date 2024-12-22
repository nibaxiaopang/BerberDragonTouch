//
//  SelectVC.swift
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//


import UIKit

class BerberSelectController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  

    @IBOutlet weak var collViewSelect: UICollectionView!
    
    var arrAlpha = ["ⴰ",
    "ⴱ",
    "ⴳ",
    "ⴷ",
    "ⴹ",
    "ⴻ",
    "ⴼ",
    "ⴽ",
    "ⵀ",
    "ⵃ",
    "ⵄ",
    "ⵅ",
    "ⵇ",
    "ⵉ",
    "ⵊ",
    "ⵍ",
    "ⵎ",
    "ⵏ", 
    "ⵓ",
    "ⵔ",
    "ⵕ",
    "ⵖ",
    "ⵘ",
    "ⵙ",
    "ⵚ",
    "ⵛ",
    "ⵜ",
    "ⵟ",
    "ⵡ",
    "ⵢ",
    "ⵣ",
    "ⵥ",
    "ⵧ",
    "ⵯ",
    "⵰",
  ];
    var flowLayouts: UICollectionViewFlowLayout {
        let _flowLayout = UICollectionViewFlowLayout()
        
        DispatchQueue.main.async {
            _flowLayout.itemSize = CGSize(width: self.collViewSelect.frame.size.width/2, height:250)
            
            _flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            _flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 0.0
        }
        
        return _flowLayout
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        collViewSelect.delegate = self
        collViewSelect.dataSource = self
        collViewSelect.register(UINib.init(nibName: "SelectCell", bundle: nil), forCellWithReuseIdentifier: "SelectCell")
        navigationController?.navigationBar.isHidden = true
        collViewSelect.collectionViewLayout = self.flowLayouts
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrAlpha.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collViewSelect.dequeueReusableCell(withReuseIdentifier: "SelectCell", for: indexPath) as! SelectCell
        cell.lblAlpha.text = arrAlpha[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DrawVC") as! BerberDrawControllers
        vc.alpha = arrAlpha[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func BAck(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
 
}
