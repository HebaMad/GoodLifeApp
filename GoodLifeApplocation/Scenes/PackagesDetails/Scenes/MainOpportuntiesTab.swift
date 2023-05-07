//
//  MainOpportuntiesTab.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/04/2023.
//

import UIKit
class MainOpportuntiesTab:UIViewController {
    var opportunityDetails:opportunitiesDetails?
    
    @IBOutlet weak var DetailsContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainerVC()
        print(opportunityDetails)
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
    

}

extension MainOpportuntiesTab:Storyboarded{
    
    static var storyboardName: StoryboardName = .main

}
