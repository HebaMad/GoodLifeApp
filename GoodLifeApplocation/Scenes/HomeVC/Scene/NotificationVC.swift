//
//  NotificationVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 16/10/2022.
//

import UIKit
import SkeletonView

class NotificationVC: UIViewController {
    //MARK: - Outlet
    @IBOutlet weak var notificationTableview: UITableView!
    @IBOutlet var emptyView: UIView!

    //MARK: - Properties
    let presenter = DashboardPresenter()
    var notification:[notificationsDetails]=[]
    private var isSkeleton: Bool = true {
        didSet {
            self.notificationTableview.reloadData()
        }
    }
    //MARK: - Life cycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()

        assignPresenterNotification()
        
    }
    
    //MARK: - getNotification

    func assignPresenterNotification(){
        presenter.notification()
        presenter.delegate=self
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
    
    func checkData(Alert:[notificationsDetails]) {
        
        if Alert.count == 0 {
            self.emptyView.isHidden = false
        }else {
            self.emptyView.isHidden = true
        }
    }

}

    //MARK: - confirm to UITableViewDelegate

extension NotificationVC:UITableViewDelegate{}

    //MARK: - confirm to UITableViewDataSource

extension NotificationVC:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isSkeleton ? 12 : notification.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NotificationCell = tableView.dequeueReusableCell(for: indexPath)
        guard !self.isSkeleton else {
            cell.startSkeleton()
            return cell
        }
        cell.stopSkeleton()
        cell.configureCell(data: notification[indexPath.row])
        return cell
        
    }
    
    
}
   //MARK: - confirm to DashboardDelegate

extension NotificationVC:DashboardDelegate{
    // no implementation
    
    func showAlerts(title: String, message: String) {}
    func getCategories(data: DahboardCategory) {}
    func getResource(data: [Resources]) {}
    func getMyTask(data: DashboardTask) {}
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {}
    func getResourceDetails(data: ResourceDetails) {}

    // with implementation

    func getNotification(data: AllNotifiaction) {
        self.isSkeleton = false

        notification = data.notifications
        checkData(Alert: notification)
        notificationTableview.reloadData()
    }
    
    
}
