//
//  AppDelegate.swift
//  Basketball Maker
//
//  Created by Ярослав Агеенко on 06.09.2022.
//  Edited by Демид Стариков

import UIKit
import AVFAudio

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var window: UIWindow?
    var objPlayer: AVAudioPlayer?
    var volumeEnabel = true

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
     
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func playAudioFile() {
        if volumeEnabel {
        guard let url = Bundle.main.url(forResource: "click_button", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            objPlayer = try AVAudioPlayer(contentsOf: url)
            
            guard let aPlayer = objPlayer else { return }
            aPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        } else {
            return
        }
    }
}

