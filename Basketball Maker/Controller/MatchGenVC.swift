//
//  MatchGenVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 08.09.2022.
//

import UIKit

class MatchGenVC: UIViewController {
    
    @IBOutlet var backBut: UIButton!
    
    @IBOutlet var mainLbl: UILabel!
    
    @IBOutlet var team1Flag: UIImageView!
    @IBOutlet var team1Name: UILabel!
    
    @IBOutlet var team2Flag: UIImageView!
    @IBOutlet var team2Name: UILabel!
    
    var opp1Name: String = ""
    var opp1Flag: String = ""
    
    var opp2Name: String = ""
    var opp2Flag: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        team1Flag.image = UIImage(named: opp1Flag)
        team1Name.text = opp1Name
        team2Flag.image = UIImage(named: opp2Flag)
        team2Name.text = opp2Name
        
        delay(bySeconds: 5.0) {
            self.next()
        }
}
    
    @IBAction func backAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        dismiss(animated: true)
    }
    
    func next() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "matchGenRes") as! MatchGenResultVC
        
        vc.opp1Flag = opp1Flag
        vc.opp1Name = opp1Name
        
        vc.opp2Name = opp2Name
        vc.opp2Flag = opp2Flag
        
        present(vc, animated: true)
    }
    
}
