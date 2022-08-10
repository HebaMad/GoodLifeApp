//
//  TaskVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class TaskVC: UIViewController {
    //MARK: - Outlet

    @IBOutlet weak var TaskTableView: UITableView!
    @IBOutlet weak var taskSegmentControl: UISegmentedControl!
    
    
    //MARK: - Properties

    var segmentIndex = 0
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        taskSegmentControl.addTarget(self, action: #selector(segmentControlSetup), for: .valueChanged)
    }
    
    
    //MARK: - setup tableview

    func setupTableView(){
        TaskTableView.register(TaskCell.self)
        TaskTableView.delegate = self
        TaskTableView.dataSource = self
    }
    
    //MARK: - segment control configration

    @objc func segmentControlSetup(){
        switch taskSegmentControl.selectedSegmentIndex{
        case 0 :
            
            segmentIndex = 0
            TaskTableView.reloadData()
            
        case 1 :
            
            segmentIndex = 1
            TaskTableView.reloadData()

        default:
            print("error click")
            
        }
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource

extension TaskVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TaskCell = tableView.dequeueReusableCell(for: indexPath)
        
        switch segmentIndex{
        case 0 :
            cell.configureCell(iconSystem: UIImage(systemName: "circlebadge")!, tint: UIColor(named: "button")!)
        case 1 :
            cell.configureCell(iconSystem: UIImage(systemName: "circlebadge.fill")!, tint: UIColor(named: "progressView")!)
        default:
            print("error click")
            
        }
        return cell
    }
    
    
}
