//
//  DigitalOpportunitiesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/04/2023.
//

import UIKit
import XLPagerTabStrip
class DigitalOpportunitiesVC: UIViewController  {
    
    
    
    @IBOutlet weak var competitorWebsitesTableview: UITableView!
    var itemInfo: IndicatorInfo = "Digital"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()

    }
    
    
    func setupTableview(){
        competitorWebsitesTableview.register(websiteCompetitor.self)
        competitorWebsitesTableview.delegate=self
        competitorWebsitesTableview.dataSource=self

    }


}
extension DigitalOpportunitiesVC:Storyboarded{
    
    static var storyboardName: StoryboardName = .main

}
extension DigitalOpportunitiesVC:UITableViewDelegate{}

extension DigitalOpportunitiesVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:websiteCompetitor=tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
    
}


extension DigitalOpportunitiesVC:IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
}
