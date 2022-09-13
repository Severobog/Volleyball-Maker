//
//  HowToPlayVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class HowToPlayVC: UIViewController {
    
    @IBOutlet var backBut: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backAction (_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        dismiss(animated: true)
    }

}
