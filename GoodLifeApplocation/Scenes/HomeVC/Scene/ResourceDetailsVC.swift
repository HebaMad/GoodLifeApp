//
//  ResourceDetails.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class ResourceDetailsVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var resourceDetailsTitle: UILabel!
    @IBOutlet weak var FAQuestionTable: UITableView!
    @IBOutlet weak var managerBtn: UIButton!
    @IBOutlet weak var managerTxt: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var lessonsBtn: UIButton!
    @IBOutlet weak var lessonsTxt: UILabel!
    
    //MARK: - Properties
    var managerUrl=""
    private var selectedIndex = -1
    var questionAndAnswer:[questionAndAnswers] = []
    var resourceTopic:ResourceDetails?

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDataPassed()
        setupTableView()
        bindBackButton()
    }
    
    //MARK: - configure Data Passed

    func setupDataPassed(){
        resourceDetailsTitle.text=resourceTopic?.resource?.title
        lessonsTxt.text=resourceTopic?.resource?.ad_lessons_title
        managerTxt.text = resourceTopic?.resource?.open_ads_manager_title
        managerUrl = resourceTopic?.resource?.open_ads_manager_url ?? ""
        questionAndAnswer = resourceTopic?.ques_ansers ?? []
        
    }
    
  //MARK: - setup tableview
    
    func setupTableView(){
        FAQuestionTable.register(ResourceDetailsCell.self)
        FAQuestionTable.delegate = self
        FAQuestionTable.dataSource = self
        FAQuestionTable.rowHeight = 70
    }
}
  //MARK: - Binding

private extension ResourceDetailsVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        managerBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        lessonsBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    
}
//MARK: - private Handler
private extension ResourceDetailsVC{

    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{
            
        case backBtn:
            navigationController?.popViewController(animated: true)
        case managerBtn:
            UIApplication.shared.open(URL(string:managerUrl) ?? URL(fileURLWithPath: ""), options: [:], completionHandler: nil)

        case lessonsBtn:
            let vc = ResourceLessons()
            vc.lesson = resourceTopic?.resource?.lessons ?? []
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("")

        }
    
  }
}
//MARK: - UITableViewDelegate,UITableViewDataSource configuration

extension ResourceDetailsVC:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questionAndAnswer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ResourceDetailsCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(item: questionAndAnswer[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ResourceDetailsCell
        cell.detailsLabel.isHidden = !cell.detailsLabel.isHidden
        
        selectedIndex = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex != -1{
            let cell = tableView.cellForRow(at: indexPath) as? ResourceDetailsCell
            if indexPath.row == selectedIndex {
                
                cell?.showHideButton.transform = .init(rotationAngle: .pi)
                return 200
            }
            cell?.showHideButton.transform = .init(rotationAngle:0)
            return 70
        }
        return  70
    }
    
    
}

//MARK: -  Storyboarded protocol configuration

extension ResourceDetailsVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}

