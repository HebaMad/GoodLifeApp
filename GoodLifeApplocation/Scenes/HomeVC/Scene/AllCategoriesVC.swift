//
//  AllCategoriesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/08/2022.
//

import UIKit

class AllCategoriesVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var categoriesTable: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    var categories:[Categories]=[]
    let presenter = DashboardPresenter()
    var goalsAndBenchmarks:GoalsAndBenchmark?
    var vc = GoalAndBenchmarkVC.instantiate()
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindBackButton()
        presenter.getCategories()
        presenter.delegate=self
     
        
    }
    //MARK: - Setup table view
    
    func setupTableView(){
        categoriesTable.register(ResourceCell.self)
        categoriesTable.delegate = self
        categoriesTable.dataSource = self
    }
    
}
//MARK: - Binding

private extension AllCategoriesVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    
}
//MARK: - private Handler
private extension AllCategoriesVC{
    
    @objc func buttonWasTapped(){
        navigationController?.popViewController(animated: true)
        
    }
}
//MARK: - UITableViewDelegate,UITableViewDataSource configuration

extension AllCategoriesVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ResourceCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureCategoriesCell(category: categories[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        self.presenter.getMyGoalAndBenchmarks(categoryID: categories[indexPath.row].id ?? 0)

    }
    
    
}
extension AllCategoriesVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}

extension AllCategoriesVC:DashboardDelegate{
    func showAlerts(title: String, message: String) {
        // No Implementation
    }
    
    func getCategories(data: [Categories]) {
        categories=data
    }
    
    func getResource(data: [Resources]) {
        // No Implementation

    }
    
    func getMyTask(data: DashboardTask) {
        // No Implementation

    }
    
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {
        goalsAndBenchmarks=data
        vc.pastGoals = goalsAndBenchmarks?.pastGoals ?? []
        vc.activeGoals = goalsAndBenchmarks?.activeGoals ?? []
        vc.benchmarks = goalsAndBenchmarks?.benchmarks ?? []

        navigationController?.pushViewController(vc, animated: true)

    }
    
    func getResourceDetails(data: ResourceDetails) {
        // No Implementation

    }
    
    
}
