//
//  AllResourceVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class AllResourceVC: UIViewController {

    //MARK: - Outlet

    @IBOutlet weak var AllresourceTable: UITableView!
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    setupTableView()
}
    
    //MARK: - Setup table view


func setupTableView(){
    AllresourceTable.register(ResourceCell.self)
    AllresourceTable.delegate = self
    AllresourceTable.dataSource = self
}

}

//MARK: - UITableViewDelegate,UITableViewDataSource configuration

extension AllResourceVC:UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:ResourceCell = tableView.dequeueReusableCell(for: indexPath)
    return cell
}


}
