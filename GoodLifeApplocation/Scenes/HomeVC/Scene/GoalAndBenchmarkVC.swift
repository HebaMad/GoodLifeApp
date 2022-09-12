//
//  GoalAndBenchmark.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit
import Algorithms

class GoalAndBenchmarkVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var GoalSegmentControl: UISegmentedControl!
    @IBOutlet weak var AddGoalBtn: UIButtonDesignable!
    
    @IBOutlet weak var goalAndBenchmarkTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    //MARK: - Properties
    let presenter = DashboardPresenter()
    var selectedSegment = 0
    var selectedCell:UITableViewCell = UITableViewCell()
    var activeGoals:[Goals]=[]
    var pastGoals:[Goals]=[]
    var benchmarks:[Benchmark]=[]
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalAndBenchmarkTableView.register(PastGoalsCell.self)
        setupTable()
        
        GoalSegmentControl.addTarget(self, action: #selector(segmentControlSetup), for: .valueChanged)
        bindButton()
        
    }
 
    //MARK: - segment control configration
    
    
    @objc func segmentControlSetup(){
        switch GoalSegmentControl.selectedSegmentIndex{
            
            
        case 0:
            selectedSegment=0
            goalAndBenchmarkTableView.register(PastGoalsCell.self)
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
    
    
    //MARK: - setup tableview
    
    func setupTable(){
        goalAndBenchmarkTableView.delegate = self
        goalAndBenchmarkTableView.dataSource = self
        goalAndBenchmarkTableView.reloadData()
    }
    
    
}
//MARK: - Binding

private extension GoalAndBenchmarkVC{
    
    func bindButton(){
     
            backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
            AddGoalBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
    
    
}
//MARK: - private Handler
private extension GoalAndBenchmarkVC{

   @objc func buttonWasTapped(_ sender:UIButton){
       
       switch sender {
       case AddGoalBtn:
           let vc = AddGoalVC()
           navigationController?.pushViewController(vc, animated: true)
       case backBtn:
           navigationController?.popViewController(animated: true)

           
       default:
           print("")
       }
    
  }
    
    
    @objc func markDoneBtn(_ sender:UIButton){
        switch selectedSegment{
        case 0:
            sender.setBackgroundImage( UIImage(systemName: "circlebadge.fill"), for: .normal)
            sender.tintColor = UIColor(named: "progressView")
            self.presenter.markMyGoal(goalId: activeGoals[sender.tag].id ?? 0, categoryID:  activeGoals[sender.tag].category_id ?? 0)
        self.presenter.delegate = self
        self.goalAndBenchmarkTableView.reloadData()
            
        case 1:
            print("")
        default:
            print("")

        }
        
    }
    
}

//MARK: - UITableViewDelegate,UITableViewDataSource configuration

extension GoalAndBenchmarkVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch selectedSegment{
        case 0:
            return activeGoals.count
        case 1:
            return pastGoals.count
        case 2:
            return benchmarks.count
        default:
            return 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch selectedSegment{
        case 0:
            let cell:PastGoalsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configureCell(Goal: activeGoals[indexPath.row],iconSystem: UIImage(systemName: "circlebadge")!, tint: UIColor(named: "button")!)
            cell.MarkBtn.addTarget(self, action: #selector(markDoneBtn), for: .touchUpInside)
            cell.MarkBtn.tag=indexPath.row
            return cell
        case 1:
            let cell:PastGoalsCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configureCell(Goal: pastGoals[indexPath.row],iconSystem: UIImage(systemName: "circlebadge.fill")!, tint: UIColor(named: "progressView")!)
            cell.MarkBtn.addTarget(self, action: #selector(markDoneBtn), for: .touchUpInside)
            cell.MarkBtn.tag=indexPath.row
            return cell
        case 2:
            let cell:BenchmarksCell = tableView.dequeueReusableCell(for: indexPath)
//            cell.configureCell(title: benchmarks[indexPath.row]., firstValue: <#T##String#>, secondValue: <#T##String#>, FirstProgress: <#T##Int#>, secondProgress: <#T##Int#>)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
extension GoalAndBenchmarkVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}

extension GoalAndBenchmarkVC:DashboardDelegate{
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {
        activeGoals = data.activeGoals ?? []
        pastGoals = data.pastGoals ?? []
        goalAndBenchmarkTableView.reloadData()
    }
    
    func showAlerts(title: String, message: String) {
        self.showAlert(title: title, message: message,hideCancelBtn: true)

    }
    
    func getCategories(data: [Categories]) {
        //no implementayion

    }
    
    func getResource(data: [Resources]) {
  //no implementayion
    }
    
    func getMyTask(data: DashboardTask) {
   //

    }
    func getResourceDetails(data: ResourceDetails) {
        // no implementation

    }
    
    
}
