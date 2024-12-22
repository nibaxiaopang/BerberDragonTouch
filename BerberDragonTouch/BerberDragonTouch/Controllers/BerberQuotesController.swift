//
//  QuotesVC.swift
//  BerberDragonTouch
//
//  Created by jin fu on 2024/12/22.
//


import UIKit

class BerberQuotesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tblView: UITableView!
    
    var arrBurber = ["ⵜⵍⵍⵉⵏⵎⵉⵏ ⵓⴳ ⵎⵉⴼⵙⵏⴰ ⴰⵡⵡⴰⵏ ⵓⵄⴼⴼⵓⵔ.","ⵜⴰⴳⵣⴰ ⵜⴳⴹⴰ ⵜⴰⵙⵉⵔⵜ, ⴰⵍⵉⵍ ⵜⴰⴷⴷⴰ ⵜⴰⵙⵉⵔⵜ.","ⵜⴰⵖⵓⵔⴳⴰⵜ ⵜⴰⵔⵜⵓⵔⴰ ⴰⵎⴰⵣⵉⵜ ⵜⴰⴳⵣⵡⴰⵏⵜ.","ⵜⴰⵡⵉⵍⴻⵍⵜ ⵜⴰⵔⵜⵓⵜ ⵜⴰⴳⵔⵉⵍⵜ.","ⵜⴰⵔⵔⵉⵜ ⵜⵉⴷⴷⴰⵍⵜ ⵜⴰⵏⵙⵉⴼⵜ.","ⵜⴰⵖⵓⵔⴳⴰⵜ ⵜⴰⴳⴼⵓⵔⵜ ⵜⴰⵜⴰⵔⴰⵣⵜ.","ⵜⴰⵔⵕⴰⵜ ⵜⴰⵍⴰⵏⵉⵜ ⵜⴰⵏⴽⴰⴼⵜ.","ⵜⴰⵎⴰⵣⵉⵜ ⵜⴰⴳⵣⵡⴰⵏⵜ ⵜⵉⵏⵙⴰⵔⵜ.","ⵜⴰⵔⵔⵉⵜ ⵜⴰⴳⴹⴰⵜ ⵜⴰⵢⴰⴷⴰⵔⵜ.","ⵜⴰⵙⴰⵏⵢⵓⵏⵜ ⵜⴰⵔⵜⵓⵜ ⵜⴰⵜⴰⵔⴰⵣⵜ."]
    
    var arrEnglish = ["Waves do not cross each other's path. This proverb illustrates the idea of independence and individuality","Rain forms rivers, wind shapes rocks. This proverb highlights the transformative power of nature","A smile is a universal language. This quote emphasizes the importance of positivity and kindness in communication.","Patience leads to success. This proverb encourages perseverance and endurance in pursuing goals","Silence is the remedy for every trouble.This quote suggests the value of introspection and calmness in dealing with difficulties","A smile is the shortest distance. This proverb highlights the power of a friendly gesture in bridging gaps between people","The road of kindness has no end.This quote emphasizes the everlasting impact of compassionate actions","The Berber language is a jewel. This statement celebrates the cultural richness and significance of the Berber language","Patience gives sweet fruit. This proverb underscores the rewards of patience and perseverance.","Kindness is the language of love. This quote emphasizes the universal nature of kindness in expressing affection and care"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib.init(nibName: "QuotesCell", bundle: nil), forCellReuseIdentifier: "QuotesCell")
        navigationController?.navigationBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrBurber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "QuotesCell") as! QuotesCell
        cell.lblQuotes.text = arrBurber[indexPath.row]
        cell.lblEnglish.text = arrEnglish[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objectsToShare = [arrBurber[indexPath.row]]
        let share = [arrEnglish[indexPath.row]]
        let Shares = ["\(objectsToShare),\(share)"]
        let activityVC = UIActivityViewController(activityItems: Shares, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        activityVC.popoverPresentationController?.sourceRect = CGRect(x: 100, y: 200, width: 300, height: 300)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)           
    }
}
