//
//  EditBusinessPlanVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 02/07/2023.
//

import UIKit

class EditBusinessPlanVC: UIViewController {

    @IBOutlet weak var businessplanTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableview()
        
    }

    func setupTableview(){
        
        businessplanTable.delegate=self
        businessplanTable.dataSource=self
        
    }

    
    @IBAction func AddBtn(_ sender: Any) {
        
    }
    
    @objc func editButtonWasTapped(){
        
    }
    

}

extension EditBusinessPlanVC:UITableViewDelegate{}
extension EditBusinessPlanVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BusinessPlanListCell=tableView.dequeueReusableCell(for: indexPath)
        cell.businessplanTitle.text=""
        cell.editBtn.tag=indexPath.row
        cell.editBtn.addTarget(self, action: #selector(editButtonWasTapped), for: .touchUpInside)
        return cell
    }
}
