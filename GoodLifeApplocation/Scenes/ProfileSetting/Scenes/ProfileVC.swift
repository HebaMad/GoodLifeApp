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
    var privacyPolicyUrl = ""
    var venture:[Ventures]=[]
    var presenter = ProfilePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
        setupTableView()
        presenter.userProfile()
        presenter.PrivacyPolicy()
        presenter.delegate = self



    }

    private func setupTableView(){
        venturesTableview.register(VenturesCell.self)
        venturesTableview.delegate = self
        venturesTableview.dataSource = self
        
    }


}
//MARK: - Binding
private extension ProfileVC{
    func bindButtons(){
        accountDetails.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
}
//MARK: - Private Handler

private extension ProfileVC{
    @objc func buttonWasTapped( sender :UIButton){
        switch sender{
        case accountDetails:
            let vc = ProfileSettingVC()
            vc.privacyPolicyUrl = self.privacyPolicyUrl
            navigationController?.pushViewController(vc, animated: true)
        case backBtn:
            navigationController?.popViewController(animated: true)

        default:
            print("error click")
        }

        
    }
}
//MARK: - Handler

extension ProfileVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        venture.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:VenturesCell = tableView.dequeueReusableCell(for: indexPath)
        cell.ventureTitle.text = venture[indexPath.row].title
        return cell
    }
    
    
}
extension ProfileVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
extension ProfileVC:ProfileDelegate{
    func getUrlForWebPages(data: termsAndConditions) {
        self.privacyPolicyUrl = data.url ?? ""
    }
    
    func showAlert(title: String, message: String) {
        //No implementation

        
    }
    
    func getUserData(data: userProfile) {
        self.venture = data.ventures ?? []
        print( self.venture.count)
        venturesTableview.reloadData()

    }
    
    
}
