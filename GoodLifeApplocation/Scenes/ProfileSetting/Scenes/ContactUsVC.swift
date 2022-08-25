//
//  ContactUsVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 25/08/2022.
//

import UIKit

class ContactUsVC: UIViewController {

    @IBOutlet weak var contatMsgTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewProperties()
    }

    private func textViewProperties(){
        contatMsgTextView.layer.cornerRadius = 8.0

    }

}
