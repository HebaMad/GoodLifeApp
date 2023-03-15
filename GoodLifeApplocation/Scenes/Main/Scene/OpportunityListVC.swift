//
//  OpportunityListVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 11/03/2023.
//

import UIKit

class OpportunityListVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var opportunitiesTableview: UITableView!
    
    
    //MARK: - properties

    
    //MARK: - Life cycle
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        setupTableView()

    }

    func setupTableView(){
        opportunitiesTableview.register(OpportunitiesStatusCell.self)
        opportunitiesTableview.delegate=self
        opportunitiesTableview.dataSource=self
    }

}

extension OpportunityListVC:Storyboarded{
    
    static var storyboardName: StoryboardName = .main

}

extension OpportunityListVC:UITableViewDelegate{}

extension OpportunityListVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:OpportunitiesStatusCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
}
