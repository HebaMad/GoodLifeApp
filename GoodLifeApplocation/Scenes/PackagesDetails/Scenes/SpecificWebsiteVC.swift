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
        self.competitorWebsiteTableview.layer.cornerRadius = 12.0
        self.competitorWebsiteTableview.layer.borderColor =  CGColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        self.competitorWebsiteTableview.layer.borderWidth = 1
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
