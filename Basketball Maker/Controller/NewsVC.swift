//
//  NewsVC.swift
//  Basketball Maker
//
//  Created by Демид Стариков on 07.09.2022.
//

import UIKit

class NewsVC: UIViewController {
    
    @IBOutlet var backBut: UIButton!
    @IBOutlet var tableView: UITableView!
    
    private let viewModel = CommonViewModel()
    var filterArr = [Layout]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset.top = 16
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        newsDataApi()
    }
    
    @IBAction func backAct(_ sender: UIButton) {
        dismiss(animated: true)
        AppDelegate.shared.playAudioFile()
    }
    
    func newsDataApi() {
        viewModel.newsDataApi { [self] success in
            if !success {
            } else {
                if viewModel.newsData != nil {
                    filterArr = (viewModel.newsData?.feed?.layouts.filter({ obj in
                        
                        for  (i, _) in viewModel.newsData!.feed!.layouts.enumerated() {
                            if obj.contents.count != 0 {
                                return obj.contents[i].consumable!.title != ""
                            }
                        }
                        
                        return false
                    }))!
                }
                self.tableView.reloadData()
            }
        }
    }
}

extension NewsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        cell.selectionStyle = .none
        cell.upadateValue(obj: (filterArr[indexPath.row]))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AppDelegate.shared.playAudioFile()
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsDetailsVC") as! NewsDetailsVC
        vc.details = filterArr[indexPath.row]
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
}

