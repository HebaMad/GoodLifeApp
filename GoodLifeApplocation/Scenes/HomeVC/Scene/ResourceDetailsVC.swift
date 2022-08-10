//
//  ResourceDetails.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class ResourceDetailsVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var FAQuestionTable: UITableView!
    
    
    //MARK: - Properties
    
    private var selectedIndex = -1

    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    //MARK: - setup tableview
    
    
    func setupTableView(){
        FAQuestionTable.register(ResourceDetailsCell.self)
        FAQuestionTable.delegate = self
        FAQuestionTable.dataSource = self
        FAQuestionTable.rowHeight = 60
    }
    
    
}

//MARK: - UITableViewDelegate,UITableViewDataSource configuration

extension ResourceDetailsVC:UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ResourceDetailsCell = tableView.dequeueReusableCell(for: indexPath)
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
                return 180
            }
            cell?.showHideButton.transform = .init(rotationAngle:0)
            return 60
        }
        return  60
    }
    
    
}
