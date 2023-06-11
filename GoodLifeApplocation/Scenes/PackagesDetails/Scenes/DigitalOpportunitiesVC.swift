//
//  DigitalOpportunitiesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/04/2023.
//

import UIKit
import XLPagerTabStrip
class DigitalOpportunitiesVC: UIViewController  {
    
    
    @IBOutlet weak var opportunityUrl: UILabel!
    
    @IBOutlet weak var competitorWebsitesTableview: UITableView!
    var itemInfo: IndicatorInfo = "Digital"
    var digital:DigitalInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        opportunityUrl.text=digital?.url ?? ""

    }
    
    
    func setupTableview(){
        competitorWebsitesTableview.register(websiteCompetitor.self)
        competitorWebsitesTableview.delegate=self
        competitorWebsitesTableview.dataSource=self

    }

    @IBAction func copyUrlBtn(_ sender: Any) {
        UIPasteboard.general.string = digital?.url ?? ""
        showSnackBar(message: " link copied successfully")

      
    }
    
    @objc func copyLinkBtn(_ Sender:UIButton){
        UIPasteboard.general.string = digital?.competitors?[Sender.tag]
        showSnackBar(message: " link copied successfully")
        
    }
    
}
extension DigitalOpportunitiesVC:Storyboarded{
    
    static var storyboardName: StoryboardName = .main

}
extension DigitalOpportunitiesVC:UITableViewDelegate{}

extension DigitalOpportunitiesVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return digital?.competitors?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:websiteCompetitor=tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(url: digital?.competitors?[indexPath.row] ?? "")
        cell.copyLink.tag = indexPath.row
        cell.copyLink.addTarget(self, action: #selector(copyLinkBtn), for: .touchUpInside)
        return cell
    }
    
    
    
}


extension DigitalOpportunitiesVC:IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
}
