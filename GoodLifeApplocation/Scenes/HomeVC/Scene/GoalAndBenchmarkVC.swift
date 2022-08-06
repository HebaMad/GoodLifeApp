//
//  GoalAndBenchmark.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class GoalAndBenchmarkVC: UIViewController {
var selectedSegment = 0
        
    
    @IBOutlet weak var GoalSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var goalAndBenchmarkTableView: UITableView!
    
    var selectedCell:UITableViewCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goalAndBenchmarkTableView.register(GoalAndBenchmarkCell.self)
        setupTable()

        GoalSegmentControl.addTarget(self, action: #selector(segmentControlSetup), for: .valueChanged)
 
    }
    
    
   @objc func segmentControlSetup(){
       switch GoalSegmentControl.selectedSegmentIndex{
            
            
        case 0:
            selectedSegment=0
            goalAndBenchmarkTableView.register(GoalAndBenchmarkCell.self)
           setupTable()

        case 1:
            selectedSegment=1
            goalAndBenchmarkTableView.register(PastGoalsCell.self)
           setupTable()

        case 2:
            selectedSegment=2
            goalAndBenchmarkTableView.register(BenchmarksCell.self)
           setupTable()
        default:
            print("error")
        }
    }
    
    func setupTable(){
        goalAndBenchmarkTableView.delegate = self
        goalAndBenchmarkTableView.dataSource = self
        goalAndBenchmarkTableView.reloadData()
    }


}
extension GoalAndBenchmarkVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch selectedSegment{
        case 0:
            let cell:GoalAndBenchmarkCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell:PastGoalsCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case 2:
            let cell:BenchmarksCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        default:
           return UITableViewCell()
        }
       
    }
    
    
}
