//
//  FeedbackVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class FeedbackVC: UIViewController {
    
    @IBOutlet var backBut: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        dismiss(animated: true)
        AppDelegate.shared.playAudioFile()
    }
    @IBAction func requestReviewManually() {
        // Note: Replace the placeholder value below with the App Store ID for your app.
        //       You can find the App Store ID in your app's product URL.
        guard let writeReviewURL = URL(string: "https://apps.apple.com/app/id<#Your App Store ID#>?action=write-review")
            else { fatalError("Expected a valid URL") }
        UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
    }

}
