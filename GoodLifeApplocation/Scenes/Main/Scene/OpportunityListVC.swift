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
    @IBOutlet weak var emptyView: UIView!
    
    var opportunities:[opportunitiesData]=[]

    //MARK: - properties

    
    //MARK: - Life cycle
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        setupTableView()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hidesBottomBarWhenPushed = false


    }
    
    @IBAction func AddOpportunitiesBtn(_ sender: Any) {
        let vc = CreateOppourtinityVC.instantiate()
        navigationController?.pushViewController(vc, animated: true)
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
        return opportunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:OpportunitiesStatusCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(data: opportunities[indexPath.row])
        return cell
    }
    
}
