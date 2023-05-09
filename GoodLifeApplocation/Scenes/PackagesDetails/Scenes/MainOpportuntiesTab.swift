//
//  MainOpportuntiesTab.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/04/2023.
//

import UIKit
class MainOpportuntiesTab:UIViewController {
    var opportunityDetails:opportunitiesDetails?
    
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var ratingMemberCount: UILabel!
    @IBOutlet weak var OpportunitiesTitle: UILabel!
    @IBOutlet weak var DetailsContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainerVC()
        setupData()
        
    }

    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func  setContainerVC(){
        
        self.DetailsContainer.subviews.first?.removeFromSuperview()
        
       let  vc=MainOpportunitiesTabVC()
        vc.opportunityDetails=opportunityDetails
        self.addChild(vc)
        self.DetailsContainer.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.frame = self.DetailsContainer.bounds
     }
    
    func setupData(){
        OpportunitiesTitle.text=opportunityDetails?.header?.name ?? ""
        rate.text=String(describing: opportunityDetails?.header?.rate ?? 0 )
        ratingMemberCount.text="(\(opportunityDetails?.header?.rate_count ?? 0)from community)"
    }
    

}

extension MainOpportuntiesTab:Storyboarded{
    
    static var storyboardName: StoryboardName = .main

}
