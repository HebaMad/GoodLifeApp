//
//  AddTask.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class AddTaskVC: UIViewController {

    //MARK: - Outlet
    
    @IBOutlet private(set) weak var AddBtn: UIButton!
    @IBOutlet private(set) weak var closeBtn: UIButton!
    @IBOutlet private(set) weak var categorySelectionBtn: UIButton!
    @IBOutlet private(set) weak var startTimeBtn: UIButton!
    @IBOutlet private(set) weak var endTimeBtn: UIButton!
    
    
    @IBOutlet private(set) weak var titleTxtfield: UITextField!
    @IBOutlet private(set) weak var alertSwitch: UISwitch!
    @IBOutlet private(set) weak var timeStartingAlertText: UILabel!
    @IBOutlet private(set) weak var timeEndingAlertText: UILabel!
    
    
    //MARK: - Properties
    
    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindBackButton()
    }

}
private extension AddTaskVC{
    
    func bindBackButton(){
        closeBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    
}
//MARK: - private Handler
private extension AddTaskVC{

   @objc func buttonWasTapped(){
       navigationController?.popViewController(animated: true)
    
  }
}
