//
//  ProfileVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/08/2022.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var userImg: UIImageViewDesignable!
    @IBOutlet weak var accountDetails: UIButton!
    @IBOutlet weak var venturesTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    private func setupTableView(){
        venturesTableview.register(VenturesCell.self)
        venturesTableview.delegate = self
        venturesTableview.dataSource = self
        
    }


}
extension ProfileVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:VenturesCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
}
extension ProfileVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
