//
//  AddGoalVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class AddGoalVC: UIViewController {

    
    //MARK: - Outlet
    
    @IBOutlet private(set) weak var AddBtn: UIButton!
    @IBOutlet private(set) weak var closeBtn: UIButton!
    @IBOutlet private(set) weak var categorySelectionBtn: UIButton!
    @IBOutlet private(set) weak var DeadlineBtn: UIButton!
    @IBOutlet private(set) weak var titleTxtfield: UITextField!

    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bindBackButton()
    }

}

private extension AddGoalVC{
    
    func bindBackButton(){
        closeBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
}

//MARK: - private Handler
private extension AddGoalVC{

   @objc func buttonWasTapped(){
       navigationController?.popViewController(animated: true)
    
  }
}
