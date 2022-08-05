//
//  AllResourceVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class AllResourceVC: UIViewController {

    @IBOutlet weak var AllresourceTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    setupTableView()
}

func setupTableView(){
    AllresourceTable.register(ResourceCell.self)
    AllresourceTable.delegate = self
    AllresourceTable.dataSource = self
}

}
extension AllResourceVC:UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:ResourceCell = tableView.dequeueReusableCell(for: indexPath)
    return cell
}


}
