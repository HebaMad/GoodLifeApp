//
//  DonationThirdFrame.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit

class DonationThirdFrame: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var SubscribeTypeTitle: UILabel!
    @IBOutlet weak var subscribeDescription: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var processDescription: UILabel!
    @IBOutlet weak var firstStageDesc: UILabel!
    @IBOutlet weak var lastStageDesc: UILabel!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Private Handler
    
    @IBAction func DonateNowAction(_ sender: Any) {
        NotificationCenter.default.post(name: .init(rawValue: "GoodLife"), object: 3)

    }
    
    
    
}
