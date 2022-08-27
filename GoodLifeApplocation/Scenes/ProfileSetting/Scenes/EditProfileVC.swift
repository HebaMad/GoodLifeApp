//
//  EditProfileVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/08/2022.
//

import UIKit

class EditProfileVC: UIViewController {
    
    //MARK: - Outlet
    //Labels
    @IBOutlet weak var userNameTxt: UILabel!
    @IBOutlet weak var phoneNumberTxt: UILabel!
    @IBOutlet weak var locationTxt: UILabel!
    @IBOutlet weak var userImage: UIImageViewDesignable!
    //Buttons
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindBackButton()
    }

}
//MARK: - Binding

private extension EditProfileVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
}

//MARK: - private Handler
private extension EditProfileVC{

   @objc func buttonWasTapped(){
       navigationController?.popViewController(animated: true)
    
  }
}
