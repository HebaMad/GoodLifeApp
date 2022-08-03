//
//  GoalAndBenchmark.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class GoalAndBenchmarkVC: UIViewController {

    @IBOutlet weak var goalTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView(){
        goalTableview.register(GoalAndBenchmarkCell.self)
        goalTableview.delegate = self
        goalTableview.dataSource = self
    }

}
extension GoalAndBenchmarkVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GoalAndBenchmarkCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
}
