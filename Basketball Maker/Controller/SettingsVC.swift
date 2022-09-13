//
//  SettingsVC.swift
//  Basketball Maker
//
//  Created by Ярослав Агеенко on 06.09.2022.
//  Edited by Демид Старикоы

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet var screenLight: UISlider!
    @IBOutlet var segmentedSound: UISegmentedControl!
    @IBOutlet var engButton: UIButton!
    @IBOutlet var rusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenLight.minimumValue = 0
        screenLight.maximumValue = 1
        
        if AppDelegate.shared.volumeEnabel {
            segmentedSound.selectedSegmentIndex = 0
        } else  {
            segmentedSound.selectedSegmentIndex = 1
        }
    }

    @IBAction func backButton(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        dismiss(animated: true)
    }
    
    @IBAction func screenLightAction(_ sender: UISlider) {
        UIScreen.main.brightness = CGFloat(sender.value)
    }
    
    @IBAction func volumeControll(_ sender: UISegmentedControl) {
        
        if AppDelegate.shared.volumeEnabel {
            AppDelegate.shared.volumeEnabel = false
            
        } else {
            AppDelegate.shared.volumeEnabel = true
            AppDelegate.shared.playAudioFile()
        }
    }
    
    @IBAction func engAction(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }

    @IBAction func rusAction(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
    }
    @IBAction func vibrationControll(_ sender: UISegmentedControl) {
        AppDelegate.shared.playAudioFile()
    }
    
}
