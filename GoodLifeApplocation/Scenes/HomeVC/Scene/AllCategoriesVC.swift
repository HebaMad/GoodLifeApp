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
    
    //MARK: - Properties

    var categories:[Categories]=[]
    let presenter = DashboardPresenter()
    var goalsAndBenchmarks:GoalsAndBenchmark?
    var  vc = GoalAndBenchmarkVC.instantiate()
    var categoryID=0
    var categoryname = ""
    
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
        categoryID = categories[indexPath.row].id ?? 0
        categoryname = categories[indexPath.row].title ?? ""
        self.presenter.getMyGoalAndBenchmarks(categoryID: categoryID)
    }
    
    
}
extension AllCategoriesVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}
//MARK: - conform to DashboardDelegate

extension AllCategoriesVC:DashboardDelegate{
    
    //No implementaion
    
    func getNotification(data: AllNotifiaction) {}
    func showAlerts(title: String, message: String) {}
    func getResource(data: [Resources]) {}
    func getResourceDetails(data: ResourceDetails) {}
    func getMyTask(data: DashboardTask) {}
    
    // With  implementaion
    
    func getCategories(data: DahboardCategory) {

        categories=data.categories ?? []
    }
    
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {
        
        goalsAndBenchmarks=data
        vc.pastGoals = goalsAndBenchmarks?.pastGoals ?? []
        vc.activeGoals = goalsAndBenchmarks?.activeGoals ?? []
        vc.benchmarks = goalsAndBenchmarks?.benchmarks ?? []
        vc.categoryID = categoryID
        navigationController?.pushViewController(vc, animated: false)
        
    }
    
    
    
}
