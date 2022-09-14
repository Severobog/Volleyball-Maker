//
//  MyBetsVC.swift
//  Basketball Maker
//
//  Created by Ярослав Агеенко on 08.09.2022.
//

import UIKit

class MyBetsVC: UIViewController {

    @IBOutlet weak var backBut: UIButton!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var betlbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        betlbl.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "My Bets" : "Ставки"
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        dismiss(animated: true)
        AppDelegate.shared.playAudioFile()
    }
}
