//
//  AllResourceVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class AllResourceVC: UIViewController {

    //MARK: - Outlet

    @IBOutlet weak var AllresourceTable: UITableView!
    @IBOutlet weak var backBtn: UIButton!

    
    var resource:[Resources]=[]
    let presenter=DashboardPresenter()
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        bindBackButton()
}
    //MARK: - Setup table view

func setupTableView(){
    AllresourceTable.register(ResourceCell.self)
    AllresourceTable.delegate = self
    AllresourceTable.dataSource = self
}

}
//MARK: - Binding

private extension AllResourceVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    
}
//MARK: - private Handler
private extension AllResourceVC{

   @objc func buttonWasTapped(){
       navigationController?.popViewController(animated: true)
    
  }
}
//MARK: - UITableViewDelegate,UITableViewDataSource configuration

extension AllResourceVC:UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    resource.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:ResourceCell = tableView.dequeueReusableCell(for: indexPath)
    cell.configureResourceCell(resource: resource[indexPath.row])
    return cell
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.getResourceDetails(categoryID: resource[indexPath.row].id ?? 0)
        self.presenter.delegate=self
    
    }


}
extension AllResourceVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}

extension AllResourceVC:DashboardDelegate{
    func showAlerts(title: String, message: String) {
        //
    }
    
    func getCategories(data: [Categories]) {
        //
    }
    
    func getResource(data: [Resources]) {
        //
    }
    
    func getMyTask(data: DashboardTask) {
        //
    }
    
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {
        //
    }
    
    func getResourceDetails(data: ResourceDetails) {
        
        let vc = ResourceDetailsVC.instantiate()
        vc.resourceTopic=data
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
