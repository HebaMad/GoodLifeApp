//
//  EditBusinessPlanVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 02/07/2023.
//

import UIKit

class EditBusinessPlanVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var businessplanTable: UITableView!
    
    //MARK: - Properties
    
    private var selectedIndex = -1
    var businessplanList:[businessplanDetails]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableview()
    }
    
    
    func setupTableview(){
        businessplanTable.register(EditBusinessplanCell.self)
        businessplanTable.delegate=self
        businessplanTable.dataSource=self
        businessplanTable.rowHeight = 45

        
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
        
        let cell:EditBusinessplanCell=tableView.dequeueReusableCell(for: indexPath)
//        cell.businessplanTitle.text=""
//        cell.editBtn.tag=indexPath.row
//        cell.editBtn.addTarget(self, action: #selector(editButtonWasTapped), for: .touchUpInside)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! EditBusinessplanCell
        cell.OpendDataList.isHidden = !cell.OpendDataList.isHidden
        
        selectedIndex = indexPath.row
        tableView.beginUpdates()
        tableView.endUpdates()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedIndex != -1 {
            let cell = tableView.cellForRow(at: indexPath) as? EditBusinessplanCell
            if indexPath.row == selectedIndex {
                
                cell?.showHideButton.transform = .init(rotationAngle: .pi)
                return 660
            }
            cell?.showHideButton.transform = .init(rotationAngle:0)
            return 45
        }
        return  45
        
    }
}
