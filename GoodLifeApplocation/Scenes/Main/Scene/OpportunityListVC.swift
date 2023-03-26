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
    let presenter=MainPresenter()
    //MARK: - properties
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        setupTableView()
        emptyView.isHidden=true
        DataAvailability()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.hidesBottomBarWhenPushed = false
        self.tabBarController?.tabBar.isHidden=false
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
    
    
    func DataAvailability()  {
        if  opportunities.count == 0 {
            emptyView.isHidden = false
        } else{
            emptyView.isHidden = true
        }
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            presenter.deleteOpportunities(opportunity_id: String(describing: opportunities[indexPath.row].id))
            presenter.delegate=self
        }
    }
}



extension OpportunityListVC:MainDelegate{
    func showAlerts(title: String, message: String) {
        
    }
    
    func getMainScreenData(data: MainScreenData) {}
    
}
