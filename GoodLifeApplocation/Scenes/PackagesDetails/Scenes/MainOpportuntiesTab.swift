//
//  MainOpportuntiesTab.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/04/2023.
//

import UIKit
class MainOpportuntiesTab:UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}

extension MainOpportuntiesTab:Storyboarded{
    
    static var storyboardName: StoryboardName = .main

}
