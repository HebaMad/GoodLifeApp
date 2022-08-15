//
//  DonationFifthFrameVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit

class DonationFifthFrameVC: UIViewController {
    
//MARK: - Outlet
    @IBOutlet weak var OrderImage: UIImageViewDesignable!
    @IBOutlet weak var subscribeTitle: UILabel!
    @IBOutlet weak var mealsFeedTxt: UILabel!
    @IBOutlet weak var livesTouchedTxt: UILabel!
    @IBOutlet weak var moneySpentTxt: UILabel!
    @IBOutlet weak var backBtn: UIButton!

    
    //MARK: - Life CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        bindBackButton()
    }
}
//MARK: - Binding

private extension DonationFifthFrameVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
}
//MARK: - private Handler
private extension DonationFifthFrameVC{

   @objc func buttonWasTapped(){
       navigationController?.popViewController(animated: true)
    
  }
}
