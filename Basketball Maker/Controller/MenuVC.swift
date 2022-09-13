//
//  MenuVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class MenuVC: UIViewController {
    
    @IBOutlet var startBut: UIButton!
    @IBOutlet var betBut: UIButton!
    @IBOutlet var newsBut: UIButton!
    @IBOutlet var feedbackBut: UIButton!
    @IBOutlet var howToPlayBut: UIButton!
    @IBOutlet var settingsBut: UIButton!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }
    
    @IBAction func betsAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }
    
    @IBAction func newAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }
    
    @IBAction func feedbackAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }
    
    @IBAction func howToPlayAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }
    
    @IBAction func settingAct(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }

}
