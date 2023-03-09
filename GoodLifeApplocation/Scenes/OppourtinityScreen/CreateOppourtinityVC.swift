//
//  CreateOppourtinityVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 17/11/2022.
//

import UIKit

class CreateOppourtinityVC: UIViewController {

    @IBOutlet weak var mobileNumber: BottomBorderTextField!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var emailTxt: BottomBorderTextField!
    @IBOutlet weak var tagTxt: BottomBorderTextField!
    @IBOutlet weak var TitleTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    func textViewPropertiesCustomozation(){

    }

    func textViewDidBeginEditing(_ textView: UITextView) {
    if descriptionTxtView.textColor == .lightGray {
        descriptionTxtView.text = ""
        descriptionTxtView.textColor = .black
    }
    }
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
//MARK: - confirm to Storyboarded protocol

extension CreateOppourtinityVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
}
