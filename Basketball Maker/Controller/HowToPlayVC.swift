//
//  HowToPlayVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class HowToPlayVC: UIViewController {
    
    @IBOutlet var rulesLbl: UILabel!
    @IBOutlet var rulesTxt: UITextView!
    @IBOutlet var backBut: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        rulesLbl.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "How to play": "Правила"
        rulesTxt.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "The player is given the chance to generate his own volleyball standings from the available teams by playing matches according to the given settings. The player's task is to achieve victory of one of the teams by playing games against all opponents"
        :
            "Игроку предоставляется шанс сгенерировать собственную волейбольную турнирную таблицу из имеющихся команд посредством проведения  матчей по заданным настройкам. Задача игрока достичь победы одной из команд сыграв игры со всеми противниками"
    }
    
    @IBAction func backAction (_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        dismiss(animated: true)
    }

}
