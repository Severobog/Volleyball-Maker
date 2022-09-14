//
//  StartVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class SelectTeam1VC: UIViewController {
    
    @IBOutlet var backBut: UIButton!
    @IBOutlet var nextBut: UIButton!
    @IBOutlet var maintitle: UILabel!
    
    let flagArray = ["argen", "japan", "finlan", "camer", "belgium", "bulgar"]
    let RUcountryArray = ["Аргентина", "Япония", "Финляндия", "Камерун", "Бельгия", "Болгария"]
    let ENcountryArray = ["Argentine","Japan", "Finland", "Camaroon", "Belgium", "Bulgaria"]
    
    let color1 = UIColor(red: 0.067, green: 0.106, blue: 0.165, alpha: 1)
    let color2 = UIColor(red: 0.046, green: 0.073, blue: 0.112, alpha: 1)

    @IBOutlet var teamTableVIew: UITableView!
    
    var opp1Name: String = ""
    var opp1Flag: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        maintitle.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Select Team 1" : "Выбор команды 1"
        
        teamTableVIew.delegate = self
        teamTableVIew.dataSource = self
        nextBut.setTitle(LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Next" : "Далее", for: .normal)
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        dismiss(animated: true)
        AppDelegate.shared.playAudioFile()
    }
    @IBAction func nextAc(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "selectTeam2") as!
        SelectTeam2VC
        AppDelegate.shared.playAudioFile()
        vc.opp1Name = opp1Name
        vc.opp1Flag = opp1Flag
        present(vc, animated: true)
    }
}

extension SelectTeam1VC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TeamsCell

        cell.flagImg.image = UIImage(named: flagArray[indexPath.row])
        cell.teamLbl.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? ENcountryArray[indexPath.row] : RUcountryArray[indexPath.row]
        
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
        let team1Name = LocalizationSystem.sharedInstance.getLanguage() == "en" ? ENcountryArray[indexPath.row] : RUcountryArray[indexPath.row]
        let team1Flag = flagArray[indexPath.row]
        
        opp1Name = team1Name
        opp1Flag = team1Flag
        
        print(opp1Name)
        print(opp1Flag)
    }
    
}
