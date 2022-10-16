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

    
    //MARK: - Life cycle

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NotificationCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
        
    }
    
    
}

