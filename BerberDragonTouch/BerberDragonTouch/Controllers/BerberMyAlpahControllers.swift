//
//  MyAlpahVC.swift
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//


import UIKit

class BerberMyAlpahControllers: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var viewNoData: UIView!
    @IBOutlet weak var collViewFav: UICollectionView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var arrData = NSMutableArray()
    var flowLayouts: UICollectionViewFlowLayout {
        let _flowLayout = UICollectionViewFlowLayout()
        
        DispatchQueue.main.async {
            _flowLayout.itemSize = CGSize(width: self.collViewFav.frame.size.width/2, height:250)
            
            _flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            _flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
            _flowLayout.minimumInteritemSpacing = 0.0
            _flowLayout.minimumLineSpacing = 0.0
        }
        
        return _flowLayout
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collViewFav.dataSource = self
        collViewFav.delegate = self
        collViewFav.register(UINib.init(nibName: "SelectCell", bundle: nil), forCellWithReuseIdentifier: "SelectCell")
        navigationController?.navigationBar.isHidden = true
        collViewFav.collectionViewLayout = self.flowLayouts
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.refreshAlphabet()
    }
    
    //MARK: - Functions
    
    func refreshAlphabet() {
        
        arrData = sceneDelegateFromView()?.getData() ?? NSMutableArray()
        
        if arrData.count == 0 {
            self.collViewFav.isHidden = true
            self.viewNoData.isHidden = false
        } else {
            self.collViewFav.isHidden = false
            self.viewNoData.isHidden = true
            self.collViewFav.reloadData()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collViewFav.dequeueReusableCell(withReuseIdentifier: "SelectCell", for: indexPath) as! SelectCell
        cell.lblAlpha.text = (arrData[indexPath.row] as! String)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DrawVC") as! BerberDrawControllers
        vc.alpha = arrData[indexPath.row] as! String
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
