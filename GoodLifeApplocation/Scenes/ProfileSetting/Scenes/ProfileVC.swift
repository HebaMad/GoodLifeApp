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
    
    @IBOutlet weak var venturesBtn: UIButton!
    @IBOutlet weak var ventureView: UIView!
    @IBOutlet weak var ventureTitle: UILabel!
    
    @IBOutlet weak var volunteerRequestBtn: UIButton!
    @IBOutlet weak var volunteerRequestView: UIView!
    @IBOutlet weak var volunteerRequestTitle: UILabel!
    
    @IBOutlet weak var ministryIdeaTitle: UILabel!
    @IBOutlet weak var ministryIdeaView: UIView!
    @IBOutlet weak var ministryIdeaBtn: UIButton!
    
    var privacyPolicyUrl = ""
    var venture:[Ventures]=[]
    var ministryIdea:[MinistryIdea]=[]
    var volunteerRequest:[VolunteerRequests]=[]

    var presenter = ProfilePresenter()
    var username:String=""
    var userList="venture"


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
        presenter.userProfile()
        presenter.PrivacyPolicy()
        presenter.delegate = self
        setupTableView()

 
        
    }

    private func setupTableView(){
        
        venturesTableview.register(VenturesCell.self)
        venturesTableview.register(MenuItemCell.self)

        venturesTableview.delegate = self
        venturesTableview.dataSource = self
        
    }
}

//MARK: - Binding

private extension ProfileVC{
    
    func bindButtons() {
        accountDetails.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        venturesBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        volunteerRequestBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        ministryIdeaBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

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
            
        case venturesBtn:
            userList = "venture"
            ventureView.backgroundColor = UIColor(named:"button")
            ventureTitle.textColor = UIColor(named:"button")

            ministryIdeaView.backgroundColor = UIColor(named:"unselectedTab")
            ministryIdeaTitle.textColor = UIColor(named:"unselectedTab")
            
            volunteerRequestView.backgroundColor = UIColor(named:"unselectedTab")
            volunteerRequestTitle.textColor = UIColor(named:"unselectedTab")
            
            venturesTableview.reloadData()
            
        case volunteerRequestBtn:
            userList = "volunteerRequest"
            venturesTableview.reloadData()

            ventureView.backgroundColor = UIColor(named:"unselectedTab")
            ventureTitle.textColor = UIColor(named:"unselectedTab")

            ministryIdeaView.backgroundColor = UIColor(named:"unselectedTab")
            ministryIdeaTitle.textColor = UIColor(named:"unselectedTab")
            
            volunteerRequestView.backgroundColor = UIColor(named:"button")
            volunteerRequestTitle.textColor = UIColor(named:"button")
            
        case ministryIdeaBtn:
            userList = "ministryIdea"
            venturesTableview.reloadData()
            
            ventureView.backgroundColor = UIColor(named:"unselectedTab")
            ventureTitle.textColor = UIColor(named:"unselectedTab")

            ministryIdeaView.backgroundColor = UIColor(named:"button")
            ministryIdeaTitle.textColor = UIColor(named:"button")
            
            volunteerRequestView.backgroundColor = UIColor(named:"unselectedTab")
            volunteerRequestTitle.textColor = UIColor(named:"unselectedTab")

            
        default:
            print("error click")
        }

        
    }
}
//MARK: - Handler

extension ProfileVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch userList{
            
        case "venture":return venture.count

        case "volunteerRequest":return volunteerRequest.count

        case "ministryIdea":return ministryIdea.count
            
        default : return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch userList{
            
        case "venture":
            
            let cell:VenturesCell = tableView.dequeueReusableCell(for: indexPath)
            cell.ventureTitle.text = venture[indexPath.row].title
            return cell

        case "volunteerRequest":
            
            let cell:MenuItemCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configureCellOfvolunteerRequest(object: volunteerRequest[indexPath.row])
            cell.editListItem.tag=indexPath.row
            cell.editListItem.addTarget(self, action: #selector(editListItem), for: .touchUpInside)
            return cell

        case "ministryIdea":
            
            let cell:MenuItemCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configureCellOfMinistryIdea(object: ministryIdea[indexPath.row])
            cell.editListItem.tag=indexPath.row
            cell.editListItem.addTarget(self, action: #selector(editListItem), for: .touchUpInside)

            return cell
        default : return UITableViewCell()
            
        }
     
    }
    
    
}
extension ProfileVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}

extension ProfileVC:ProfileDelegate{
    func getIdea(data: MinistryIdea) {
        let vc = HaveAnIdeaVC()
        vc.status = "update"
        vc.ministryIDEA=data
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func getVolunteerRequest(data: VolunteerRequests) {
        let vc = VolunteerOpportunityVC()
            vc.status = "update"
            vc.voluntaryRequest=data
            navigationController?.pushViewController(vc, animated: true)
  
    }
    
    func getUrlForWebPages(data: termsAndConditions) {
        self.privacyPolicyUrl = data.url ?? ""
        SVProgressHUD.dismiss()
    }
    
    func showAlerts(title: String, message: String) {
    
    }
    
    func getUserData(data: userProfile) {
        self.venture = data.ventures ?? []
        self.ministryIdea = data.ministry_ideas ?? []
        self.volunteerRequest = data.volunteer_requests ?? []
        userImg.sd_setImage(with: URL(string:data.image_profile ?? "" ))
        print( self.venture.count)
        SVProgressHUD.dismiss()
        venturesTableview.reloadData()

    }
    
 
    
    
}
extension ProfileVC{
    @objc func  editListItem(_ sender:UIButton){
        
        if userList == "ministryIdea" {
    
            presenter.getMinistryIdeaData(ministryIdeaId: "\(ministryIdea[sender.tag].id ?? 0)")
            presenter.delegate=self
        }else{
   
            presenter.getVolunteerRequestsData(volunteerrequestId: "\(volunteerRequest[sender.tag].id ?? 0)")
            presenter.delegate=self

        }
        
    }
}
