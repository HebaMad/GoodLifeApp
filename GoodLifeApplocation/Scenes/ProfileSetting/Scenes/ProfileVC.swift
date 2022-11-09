//
//  ProfileVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/08/2022.
//

import UIKit
import SDWebImage
import SVProgressHUD
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
        
//        bindButtons()
//        setupTableView()
//        presenter.userProfile()
//        presenter.PrivacyPolicy()
//        presenter.delegate = self

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SVProgressHUD.show()
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
    
    func showAlerts(title: String, message: String) {
        //No implementation
    }
    
    func getUserData(data: userProfile) {
        self.venture = data.ventures ?? []
        userImg.sd_setImage(with: URL(string:data.image_profile ?? "" ))
        print( self.venture.count)
        SVProgressHUD.dismiss()
        venturesTableview.reloadData()

    }
    
    
}
