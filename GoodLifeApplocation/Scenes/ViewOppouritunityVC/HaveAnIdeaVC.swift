//
//  HaveAnIdeaVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class HaveAnIdeaVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var coverImage: UIImageViewDesignable!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var titleProjectText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var weeklyTimeSelection: UITextField!
    @IBOutlet weak var monthlyRevenuTxt: UITextField!
    @IBOutlet weak var backBtn: UIButton!

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        bindBackButton()
    }
}
//MARK: - Binding

private extension HaveAnIdeaVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
}
//MARK: - private Handler
private extension HaveAnIdeaVC{

   @objc func buttonWasTapped(){
       navigationController?.popViewController(animated: true)
    
  }
}
