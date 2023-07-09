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
    
    @IBOutlet weak var searchview: SearchView!
    var opportunities:[opportunitiesData]=[]
    let presenter=MainPresenter()
    
    //MARK: - properties
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad(){
        
        super.viewDidLoad()

//        DataAvailability()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showLoading()
        presenter.listOpportunties(search: "")
        presenter.delegate=self
        setupTableView()
        emptyView.isHidden=true
        setupSearchProperties()
        self.hidesBottomBarWhenPushed = false
        self.tabBarController?.tabBar.isHidden=false
    }
    
    @IBAction func AddOpportunitiesBtn(_ sender: Any) {
        let vc = CreateOppourtinityVC.instantiate()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func  setupSearchProperties(){
        searchview.btnSearch.addTarget(self, action: #selector(searchActioon), for: .touchUpInside)

        searchview.startHandler {
     }

        searchview.endEditingHandler {
            self.opportunitiesSearch()
     }

     }
     
     @objc func searchActioon(_ sender : UIButton ) {
         opportunitiesSearch()
      
 }
    
    
    func opportunitiesSearch(){
        if (self.searchview.txtSearch.text)?.count != 0 {
            
            presenter.listOpportunties(search: self.searchview.txtSearch.text ?? "")

        }else{
            presenter.listOpportunties(search: "")

        }
        presenter.delegate=self
    }

    
}

extension OpportunityListVC{
    func setupTableView(){
        opportunitiesTableview.register(OpportunitiesStatusCell.self)
        opportunitiesTableview.delegate=self
        opportunitiesTableview.dataSource=self
    }
    
    func DataAvailability()  {
        if  opportunities.count == 0 {
            emptyView.isHidden = false
        }else{
            emptyView.isHidden = true
        }
    }
    
    @objc func completeButtonTapped(_ sender:UIButton){
        
        let vc = MainOpportunitiesCreation()
        vc.id=opportunities[sender.tag].id ?? 0
        navigationController?.pushViewController(vc, animated: true)
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
        cell.completeInformationBtn.tag=indexPath.row
        cell.completeInformationBtn.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == .delete) {
//
//        } else if editingStyle == .insert {
//            }
//    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            let opportunityID = self.opportunities[indexPath.row].id
            print("Edit opportunity with ID: \(opportunityID)")
            self.presenter.getOpportunitiesFullDetails(opportunitiesId:String(describing: opportunityID!))
            self.presenter.delegate=self
            
        }
        
        editAction.backgroundColor = UIColor.blue
        
        let deleteAction = UITableViewRowAction(style: .normal, title: "delete") { (action, indexPath) in
            let opportunityID = self.opportunities[indexPath.row].id
            self.presenter.deleteOpportunities(opportunity_id: String(describing:opportunityID!))
            self.presenter.delegate=self
         
        }
        deleteAction.backgroundColor = UIColor.red

        return [deleteAction,editAction]
    }
    
    
}



extension OpportunityListVC:MainDelegate{
    func opportunitiesFullDetails(data: OpportunityData) {
        let vc = MainOpportunitiesCreation()
        vc.status="Edit"
        vc.oppDetailsObj=data
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func opportunitiesDetails(data: opportunitiesDetails) {}
    
    func getExploreMapData(data: ExploreMap) {
        
    }
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {}
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) { }
    
    
    func getOpportunitiesData(data: ListOpportunities) {
        
        opportunities=data.opportunities ?? []
        DataAvailability()
        opportunitiesTableview.reloadData()
        self.hideLoading()

    }
    
    func showAlerts(title: String, message: String) {
        presenter.listOpportunties(search: "")
        self.showSnackBar(message: message)
        presenter.delegate=self
    }
    
    func getMainScreenData(data: MainScreenData) {}
    
}
