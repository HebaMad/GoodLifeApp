//
//  SpecificWebsiteVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class SpecificWebsiteVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var competitorWebsiteTableview: UITableView!
    @IBOutlet weak var topCompetitorText: UILabel!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    //MARK: - Outlet

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableview()
    }
    
    //MARK: - tableview Configuration
    
    private func setupTableview(){
        competitorWebsiteTableview.register(WebsiteCompetitorCell.self)
        competitorWebsiteTableview.delegate = self
        competitorWebsiteTableview.dataSource = self
        tableHeight.constant = (5*138) + 74

    }
}


//MARK: - UITableviewDelegate & UITableviewDatasource

extension SpecificWebsiteVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WebsiteCompetitorCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
}
