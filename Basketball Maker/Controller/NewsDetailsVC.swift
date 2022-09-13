//
//  NewsDetailsVC.swift
//  BetweenSports
//
//  Created by Демид Стариков on 07.09.2022.
//
import UIKit

class NewsDetailsVC: UIViewController {
    
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblNewsDetails: UITextView!
    @IBOutlet weak var backButton: UIButton!
    
    var details: Layout?
    private let viewModel = NewsDetailsVM()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        apiCall()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgNews.setImage(url: details?.contents[0].consumable?.image_uri ?? "", placeholderImage: UIImage(named: "ic_news_bg"))
        lblNewsTitle.text = details?.contents[0].consumable?.title
    }
    
    @IBAction func backToNews(_ sender: UIButton) {
        AppDelegate.shared.playAudioFile()
        dismiss(animated: true)
    }
    
    
    
    func apiCall() {
        viewModel.newsDetailsApi(id: details?.contents[0].consumable?.id ?? "") { success in
            if success {
                self.lblNewsDetails.text = self.viewModel.newsBody
            }
        }
    }
}
