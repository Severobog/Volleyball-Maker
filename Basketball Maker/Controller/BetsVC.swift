//
//  BetsVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit
    
class BetsVC: UIViewController {
    
    @IBOutlet var backBut: UIButton!
    @IBOutlet var mainLbl: UILabel!
    
    @IBOutlet var team1Flag: UIImageView!
    @IBOutlet var team2Flag: UIImageView!
    
    @IBOutlet var team1name: UILabel!
    @IBOutlet var team2Name: UILabel!
    
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var hundredButton: UIButton!
    @IBOutlet var thousendButton: UIButton!
    @IBOutlet var betButton: UIButton!
    @IBOutlet var startBut: UIButton!
    
    var betValue: Int = 0
    
    var opp1Name: String = ""
    var opp1Flag: String = ""
    
    var opp2Name: String = ""
    var opp2Flag: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        team1Flag.image = UIImage(named: opp1Flag)
        team1name.text = opp1Name
        team2Flag.image = UIImage(named: opp2Flag)
        team2Name.text = opp2Name
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        dismiss(animated: true)
        AppDelegate.shared.playAudioFile()
    }
    
    @IBAction func zeroAc(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        betValue = 0
    }
    
    @IBAction func onehundred(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        betValue = 100
    }
    
    @IBAction func onethusend(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        betValue = 1000
    }
    
    
    @IBAction func betButton(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        betButton.isHidden = true
        if betValue == 1000 {
            thousendButton.backgroundColor = .green
        } else if betValue == 100 {
            hundredButton.backgroundColor = .green
        } else {
            zeroButton.backgroundColor = .green
        }
    }
    
    @IBAction func startAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        let vc = storyboard?.instantiateViewController(withIdentifier: "matchGen") as! MatchGenVC
        
        vc.opp1Flag = opp1Flag
        vc.opp1Name = opp1Name
        
        vc.opp2Name = opp2Name
        vc.opp2Flag = opp2Flag
        
        present(vc, animated: true)
    }
    
    
}
