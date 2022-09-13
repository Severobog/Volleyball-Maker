//
//  MatchGenResultVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 08.09.2022.
//

import UIKit

class MatchGenResultVC: UIViewController {
    
    @IBOutlet var winnerLbl: UILabel!
    
    @IBOutlet var team1Flag: UIImageView!
    @IBOutlet var team1Name: UILabel!
    @IBOutlet var team1Score: UILabel!
    
    @IBOutlet var team2Flag: UIImageView!
    @IBOutlet var team2Name: UILabel!
    @IBOutlet var team2Score: UILabel!
    
    var opp1Name: String = ""
    var opp1Flag: String = ""
    
    var opp2Name: String = ""
    var opp2Flag: String = ""
    
    var randomWinArr: [Int] = []
    var randomScoreArr: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team1Flag.image = UIImage(named: opp1Flag)
        team1Name.text = opp1Name
        team2Flag.image = UIImage(named: opp2Flag)
        team2Name.text = opp2Name
        setupArrays()
    }
    

    
    func setupArrays() {
        for _ in 1...9999 {
            randomWinArr.append(Int.random(in: 0...1))
        }
        if randomWinArr.first! > randomWinArr.last! {
            winnerLbl.text = opp1Name + " is won!"
            team1Score.text = String(Int.random(in: 18...40))
            team2Score.text = String(Int.random(in: 0...18))
        } else {
            winnerLbl.text = opp2Name + " is won!"
            team1Score.text = String(Int.random(in: 0...18))
            team2Score.text = String(Int.random(in: 18...40))
        }
        for _ in 1...2 {
            randomScoreArr.append(Int.random(in: 0..<30))
        }
    }
}
