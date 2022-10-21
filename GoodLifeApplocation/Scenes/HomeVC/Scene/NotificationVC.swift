//
//  NotificationVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 16/10/2022.
//

import UIKit

class NotificationVC: UIViewController {
    //MARK: - Outlet
    @IBOutlet weak var notificationTableview: UITableView!
    
    //MARK: - Properties
    let presenter = DashboardPresenter()
    var notification:[notificationsDetails]=[]
    //MARK: - Life cycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignPresenterNotification()
        
    }
    
    //MARK: - getNotification

    func assignPresenterNotification(){
        presenter.notification()
        presenter.delegate=self
        setupTableview()
    }

    //MARK: - setupTableview data

    private func setupTableview(){
        notificationTableview.register(NotificationCell.self)
        notificationTableview.delegate = self
        notificationTableview.dataSource = self

    }
    //MARK: - Back Action

    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}

    //MARK: - confirm to UITableViewDelegate

extension NotificationVC:UITableViewDelegate{}

    //MARK: - confirm to UITableViewDataSource

extension NotificationVC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notification.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NotificationCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(data: notification[indexPath.row])
        return cell
        
    }
    
    
}
   //MARK: - confirm to DashboardDelegate

extension NotificationVC:DashboardDelegate{
    // no implementation
    
    func showAlerts(title: String, message: String) {}
    func getCategories(data: [Categories]) {}
    func getResource(data: [Resources]) {}
    func getMyTask(data: DashboardTask) {}
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {}
    func getResourceDetails(data: ResourceDetails) {}

    // with implementation

    func getNotification(data: AllNotifiaction) {
        notification = data.notifications
        notificationTableview.reloadData()
    }
    
    
}
