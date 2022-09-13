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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        dismiss(animated: true)
        AppDelegate.shared.playAudioFile()
    }
}
