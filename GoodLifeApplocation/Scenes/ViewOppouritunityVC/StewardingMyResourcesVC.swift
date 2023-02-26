//
//  StewardingMyResourcesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/02/2023.
//

import UIKit

class StewardingMyResourcesVC: UIViewController {
    
    var  stewardingResourceData:StewardingMyResource?
    

    @IBOutlet weak var stewardingContaimerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainerVC()
        print(stewardingResourceData)
    }
    

    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

   func  setContainerVC(){
       
       self.stewardingContaimerView.subviews.first?.removeFromSuperview()
       
      let  vc=StewardingMyResourceVC()
       vc.stewardingResourceData=stewardingResourceData
       self.addChild(vc)
       self.stewardingContaimerView.addSubview(vc.view)
       vc.didMove(toParent: self)
       vc.view.frame = self.stewardingContaimerView.bounds
    }
    

}
extension StewardingMyResourcesVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
