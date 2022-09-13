//
//  FormationTeam1VC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class FormationTeam1VC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var backBut: UIButton!
    @IBOutlet var nextBut: UIButton!
    
    let color1 = UIColor(red: 0.11, green: 0.31, blue: 0.486, alpha: 1)
    let color2 = UIColor(red: 0.11, green: 0.31, blue: 0.856, alpha: 1)
    
    let formationArray = ["Volleyball: individual tactics",
                          "Volleyball: Team tactics",
                          "Volleyball: the combination with the 'overrunning' player",
                          "Volleyball: Combination with one pass",
                          "Volleyball: the combination from the back line of the court",
                          "Volleyball: Collective defense tactics",
                          "Volleyball: reflection of serve",
                          "Volleyball: Deflecting offensive strikes",
                          "Volleyball: the game system"
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "formTeam2") as! FormationTeam2VC
        vc.opp1Flag = opp1Flag
        vc.opp1Name = opp1Name
        
        vc.opp2Name = opp2Name
        vc.opp2Flag = opp2Flag
        present(vc, animated: true)
    }
}

extension FormationTeam1VC: UITableViewDelegate, UITableViewDataSource {
    
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
        } else if indexPath.row == 8 {
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
