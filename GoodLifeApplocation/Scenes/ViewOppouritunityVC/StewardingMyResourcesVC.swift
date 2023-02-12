//
//  StewardingMyResourcesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/02/2023.
//

import UIKit

class StewardingMyResourcesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
extension StewardingMyResourcesVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
