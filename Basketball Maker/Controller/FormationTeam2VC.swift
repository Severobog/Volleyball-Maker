//
//  FormationTeam2VC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class FormationTeam2VC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var backBut: UIButton!
    @IBOutlet var nextBut: UIButton!
    
    let color1 = UIColor(red: 0.067, green: 0.106, blue: 0.165, alpha: 1)
    let color2 = UIColor(red: 0.046, green: 0.073, blue: 0.112, alpha: 1)
    
    let formationArray = ["Attacking against a zone defence",
                          "Positional attack",
                          "Counter-attack (fast break)",
                          "Pressing defence",
                          "Mixed defence",
                          "Zone defence",
                          "Defence against the ball carrier"
    ]
    
    var opp1Name: String = ""
    var opp1Flag: String = ""
    
    var opp2Name: String = ""
    var opp2Flag: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func backAc(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        dismiss(animated: true)
    }
    
    @IBAction func nextAc(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        let vc = storyboard?.instantiateViewController(withIdentifier: "bet") as! BetsVC
        vc.opp1Flag = opp1Flag
        vc.opp1Name = opp1Name
        
        vc.opp2Name = opp2Name
        vc.opp2Flag = opp2Flag
        present(vc, animated: true)
    }
    
}

extension FormationTeam2VC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "formCell", for: indexPath) as! FormationCell
        
        if indexPath.row % 2 != 0 {
            cell.backgroundColor = color1
        } else {
            cell.backgroundColor = color2
        }
        
        if indexPath.row == 0 {
            cell.layer.cornerRadius = 15
            cell.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else if indexPath.row == 5 {
            cell.layer.cornerRadius = 15
            cell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
        cell.label.text = formationArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppDelegate.shared.playAudioFile()
        nextBut.isHidden = false
    }
    
    
}
