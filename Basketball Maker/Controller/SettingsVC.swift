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

    @IBOutlet var lightlbl: UILabel!
    @IBOutlet var mainlbl: UILabel!
    @IBOutlet var langlbl: UILabel!
    @IBOutlet var vibrlbl: UILabel!
    @IBOutlet var soundlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainlbl.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Settings": "Настройки"
        langlbl.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Language": "Язык"
        vibrlbl.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Vibration": "Вибрация"
        soundlbl.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Sound": "Звук"
        lightlbl.text = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Screen Light": "Яркость экрана"
        
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
        self.restartApp()
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
    }

    @IBAction func rusAction(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        self.restartApp()
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "ru")
    }
    @IBAction func vibrationControll(_ sender: UISegmentedControl) {
        AppDelegate.shared.playAudioFile()
    }
    
    func restartApp() {
        let alert = UIAlertController(title: nil, message: LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Need to reopen app for update app language." : "Необходимо повторно открыть приложение для обновления языка приложения." , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LocalizationSystem.sharedInstance.getLanguage() == "en" ? "OK" : "ХОРОШО", style: .default, handler: { action in
            exit(0);
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
