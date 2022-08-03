//
//  TaskVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class TaskVC: UIViewController {

    @IBOutlet weak var TaskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView(){
        TaskTableView.register(TaskCell.self)
        TaskTableView.delegate = self
        TaskTableView.dataSource = self
    }

}
extension TaskVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TaskCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
}
