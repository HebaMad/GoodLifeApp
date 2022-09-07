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
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var AddTaskBtn: UIButtonDesignable!
 
    var myCurrentTask:[Tasks]=[]
    var myCompletedTask:[Tasks]=[]
    let presenter = DashboardPresenter()

    //MARK: - Properties

    var segmentIndex = 0
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        taskSegmentControl.addTarget(self, action: #selector(segmentControlSetup), for: .valueChanged)
        bindButton()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter.getMyTask()
        self.presenter.delegate=self
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
    
    @objc func markDoneBtn(_ sender:UIButton){
        switch segmentIndex{
        case 0:
            sender.setBackgroundImage( UIImage(systemName: "circlebadge.fill"), for: .normal)
            sender.tintColor = UIColor(named: "progressView")
        self.presenter.markMyTask(taskid: myCurrentTask[sender.tag].id ?? 0)
        self.presenter.delegate = self
        self.TaskTableView.reloadData()
            
        case 1:
            print("")
        default:
            print("")

        }
        
    }
}

//MARK: - Binding

private extension TaskVC{
    
    func bindButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        AddTaskBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
}


//MARK: - private Handler
private extension TaskVC{

    @objc func buttonWasTapped(_ sender:UIButton){
       switch sender {
       case AddTaskBtn:
           let vc = AddTaskVC()
           navigationController?.pushViewController(vc, animated: true)
       case backBtn:
       navigationController?.popViewController(animated: true)
    
       default:
           print("")
       }
}
}
//MARK: - UITableViewDelegate,UITableViewDataSource

extension TaskVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentIndex{
        case 0:
            return myCurrentTask.count
        case 1:
            return myCompletedTask.count
            
        default: return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TaskCell = tableView.dequeueReusableCell(for: indexPath)
        
        switch segmentIndex{
        case 0 :
            cell.configureCell(iconSystem: UIImage(systemName: "circlebadge")!, tint: UIColor(named: "button")!, task:myCurrentTask[indexPath.row])
            cell.MarkBtn.addTarget(self, action: #selector(markDoneBtn), for: .touchUpInside)
            cell.MarkBtn.tag=indexPath.row
        case 1 :
            cell.configureCell(iconSystem: UIImage(systemName: "circlebadge.fill")!, tint: UIColor(named: "progressView")!, task:myCompletedTask[indexPath.row] )
        default:
            print("error click")
            
        }
        return cell
    }
    
    
}

extension TaskVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
extension TaskVC:DashboardDelegate{
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {
        //
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
        myCompletedTask=data.completedTasks ?? []
        myCurrentTask = data.currentTasks ?? []
        TaskTableView.reloadData()

    }
    func getResourceDetails(data: ResourceDetails) {
        // no implementation

    }
    
    
}
