//
//  AllTasksVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/08/2022.
//

import UIKit

class AllTasksVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var tasksTable: UITableView!
    @IBOutlet weak var backBtn: UIButton!
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindBackButton()
    }
    //MARK: - Setup table view
    
    func setupTableView(){
        tasksTable.register(ResourceCell.self)
        tasksTable.delegate = self
        tasksTable.dataSource = self
    }
    
}
//MARK: - Binding

private extension AllTasksVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    
}
//MARK: - private Handler
private extension AllTasksVC{
    
    @objc func buttonWasTapped(){
        navigationController?.popViewController(animated: true)
        
    }
}
//MARK: - UITableViewDelegate,UITableViewDataSource configuration

extension AllTasksVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ResourceCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskVC.instantiate()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension AllTasksVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}
