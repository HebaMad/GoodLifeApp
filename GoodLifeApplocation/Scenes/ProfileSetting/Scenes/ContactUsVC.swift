//
//  ContactUsVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 25/08/2022.
//

import UIKit

class ContactUsVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var contatMsgTextView: UITextView!
    @IBOutlet weak var sendBtn: UIButtonDesignable!
    
    
     var presnter = ProfilePresenter()

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewProperties()
        bindBackButton()
    }
    //MARK: - add  textview corner radius
    
    private func textViewProperties(){
        contatMsgTextView.layer.cornerRadius = 8.0
        
    }
    
}
    //MARK: - Binding

    private extension ContactUsVC{
    
    func bindBackButton(){
        
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        sendBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
}

    //MARK: - private Handler
    extension ContactUsVC{
    
       @objc func buttonWasTapped( _ sender:UIButton){
           
           switch sender{
           case backBtn:
               navigationController?.popViewController(animated: true)
           case sendBtn:
               self.presnter.sendContactMsg(msg: contatMsgTextView.text)
           default:
               print(".")
           }
        
    }
}
