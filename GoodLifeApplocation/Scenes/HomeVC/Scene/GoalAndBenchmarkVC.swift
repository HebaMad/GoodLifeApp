//
//  GoalAndBenchmark.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit
import MaterialComponents.MaterialSnackbar

class GoalAndBenchmarkVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var GoalSegmentControl: UISegmentedControl!
    @IBOutlet weak var AddGoalBtn: UIButtonDesignable!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet var emptyView: UIView!
    @IBOutlet weak var goalAndBenchmarkTableView: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    //MARK: - Properties
    
    static let sharedInstance = GoalAndBenchmarkVC.instantiate()

    let presenter = DashboardPresenter()
    var selectedSegment = 0
    var selectedCell:UITableViewCell = UITableViewCell()
    var activeGoals:[Goals]=[]
    var pastGoals:[Goals]=[]
    var benchmarks:[Benchmark]=[]
    var categoryID=0
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emptyView.isHidden=true
        goalAndBenchmarkTableView.register(PastGoalsCell.self)
//        setupTable()
        bindButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.getMyGoalAndBenchmarks(categoryID: categoryID)
        presenter.delegate = self
        setupTable()

    }
 
    //MARK: - segment control configration
    
    
    @objc func segmentControlSetup(){
        switch GoalSegmentControl.selectedSegmentIndex{
            
            
        case 0:
            self.emptyView.isHidden = true

            selectedSegment=0
            goalAndBenchmarkTableView.register(PastGoalsCell.self)
            setupTable()
            checkData(goalsArr: activeGoals)

            
        case 1:
            self.emptyView.isHidden = true

            selectedSegment=1
            goalAndBenchmarkTableView.register(PastGoalsCell.self)
            setupTable()
            checkData(goalsArr: pastGoals)
        
            
        case 2:
            self.emptyView.isHidden = true

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
    
    //MARK: - checkData

    func checkData(goalsArr:[Goals]){
        
        if goalsArr.count == 0 {
            self.emptyView.isHidden = false
        }else {
            self.emptyView.isHidden = true
        }
    }
    
    //MARK: - check Goal and Benchmark Segment

    func checkGoalandBenchmarkSegment(){
        switch GoalSegmentControl.selectedSegmentIndex {
        case 0 :checkData(goalsArr: activeGoals)
        case 1 :checkData(goalsArr: pastGoals)
        case 2: self.emptyView.isHidden = true

        default : print("error")
            
        }
    
}
}

//MARK: - Binding

private extension GoalAndBenchmarkVC{
    
    func bindButton(){
        GoalSegmentControl.addTarget(self, action: #selector(segmentControlSetup), for: .valueChanged)
            backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
            AddGoalBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
    
    func openUrl(url:String){
        UIApplication.shared.open(URL(string:url) ?? URL(fileURLWithPath: ""), options: [:], completionHandler: nil)
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
            self.presenter.markMyGoal(goalId: activeGoals[sender.tag].id ?? 0, categoryID: Int( activeGoals[sender.tag].category_id ?? "") ?? 0)
            self.presenter.delegate = self
            checkData(goalsArr: activeGoals)
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
            cell.configureCell(title: benchmarks[indexPath.row].title ?? "" ,value: benchmarks[indexPath.row].niche_target ?? "", progress: 500)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch selectedSegment{
        case 0:
            guard let url = activeGoals[indexPath.row].url else { return }
            openUrl(url: url)
            
        case 1:
            guard let url = pastGoals[indexPath.row].url else { return }
            openUrl(url: url)
        default:
            print("")

        }
    }
    
    
}
//MARK: -  Storyboarded protocol configuration

extension GoalAndBenchmarkVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}


//MARK: -  DashboardDelegate configuration

extension GoalAndBenchmarkVC:DashboardDelegate{
    
    func getNotification(data: AllNotifiaction) { }
    func getCategories(data: DahboardCategory) {}
    func getResource(data: [Resources]) {}
    func getMyTask(data: DashboardTask) {}
    func getResourceDetails(data: ResourceDetails) {}
    
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {
        activeGoals = data.activeGoals ?? []
        pastGoals = data.pastGoals ?? []
        benchmarks = data.benchmarks ?? []
        titleTxt.text = data.category?.title ?? ""
        checkGoalandBenchmarkSegment()
        goalAndBenchmarkTableView.reloadData()
    }
    
    func showAlerts(title: String, message: String) {
        showSnackBar(message:message)
    }
    
}
//extension GoalAndBenchmarkVC{
//    func showSnackBar(message:String){
//        let answerMessage = MDCSnackbarMessage()
//        answerMessage.text =  message
//
//        MDCSnackbarManager.default.show(answerMessage)
//    }
//}
