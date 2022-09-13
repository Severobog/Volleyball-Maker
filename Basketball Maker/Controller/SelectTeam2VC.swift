//
//  SelectTeam2.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class SelectTeam2VC: UIViewController {
    
    @IBOutlet var backBut: UIButton!
    @IBOutlet var nextBut: UIButton!
    
    let flagArray = ["poland", "greece", "lithuania", "germany", "italy", "ru"]
    let countryArray = ["Poland", "Greece", "Lithuania", "Germany", "Italy", "Russia"]
    
    let color1 = UIColor(red: 0.067, green: 0.106, blue: 0.165, alpha: 1)
    let color2 = UIColor(red: 0.046, green: 0.073, blue: 0.112, alpha: 1)
    
    @IBOutlet var teamTableVIew: UITableView!
    
    var opp1Name: String = ""
    var opp1Flag: String = ""
    
    var opp2Name: String = ""
    var opp2Flag: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamTableVIew.delegate = self
        teamTableVIew.dataSource = self
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        dismiss(animated: true)
        AppDelegate.shared.playAudioFile()
    }
    
    @IBAction func nextAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        let vc = storyboard?.instantiateViewController(withIdentifier: "formTeam1") as! FormationTeam1VC
        vc.opp1Flag = opp1Flag
        vc.opp1Name = opp1Name
        
        vc.opp2Name = opp2Name
        vc.opp2Flag = opp2Flag
        present(vc, animated: true)
    }
}

extension SelectTeam2VC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamsCell
        
        cell.flagImg.image = UIImage(named: flagArray[indexPath.row])
        cell.teamLbl.text = countryArray[indexPath.row]
        
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppDelegate.shared.playAudioFile()
        nextBut.isHidden = false
        let team2Name = countryArray[indexPath.row]
        let team2Flag = flagArray[indexPath.row]
        
        opp2Name = team2Name
        opp2Flag = team2Flag
        
        print(opp1Name, opp2Name)
        print(opp1Flag, opp2Flag)
    }
}
