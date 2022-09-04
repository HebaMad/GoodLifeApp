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
    @IBOutlet weak var backBtn: UIButton!

    
    var resource:[Resources]=[]
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        bindBackButton()
}
    //MARK: - Setup table view

func setupTableView(){
    AllresourceTable.register(ResourceCell.self)
    AllresourceTable.delegate = self
    AllresourceTable.dataSource = self
}

}
//MARK: - Binding

private extension AllResourceVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    
}
//MARK: - private Handler
private extension AllResourceVC{

   @objc func buttonWasTapped(){
       navigationController?.popViewController(animated: true)
    
  }
}
//MARK: - UITableViewDelegate,UITableViewDataSource configuration

extension AllResourceVC:UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    resource.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:ResourceCell = tableView.dequeueReusableCell(for: indexPath)
    cell.configureResourceCell(resource: resource[indexPath.row])
    return cell
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ResourceDetailsVC.instantiate()
        navigationController?.pushViewController(vc, animated: true)
    }


}
extension AllResourceVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
