//
//  CustomAlert.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/09/2022.
//

import UIKit

final class CustomAlert:UIView{
   @IBOutlet private weak var titleLbl:UILabel!
   @IBOutlet  weak var messageLbl:UILabel!
   @IBOutlet private weak var mainView:UIView!

   @IBOutlet weak var okButton:UIButton!
   @IBOutlet weak var cancelButton:UIButton!
   var onComplete:((AlertButton)->Void)?
   var view: UIView!
   
   
   
   required init(title:String,message:String,complitionHandler: ((CustomAlert.AlertButton)->Void)?){
       self.onComplete = complitionHandler

       super.init(frame: CGRect.zero)
       self.frame = UIScreen.main.bounds
       xibSetup()
       
       self.titleLbl.text = title
       self.messageLbl.text = message
       animateIn()
   }
   
   init(title:UIImage,message:String,complitionHandler:  ((CustomAlert.AlertButton)->Void)?){
       self.onComplete = complitionHandler

       super.init(frame: CGRect.zero)
       self.frame = UIScreen.main.bounds
       xibSetup()
       
       self.titleLbl.addLeading(image: title, text:"")
       self.messageLbl.text = message
       animateIn()
   }
   
   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       onComplete = nil
       xibSetup()
   }
   
   
   
   private func customSetup(){
       mainView.layer.cornerRadius = 20
       mainView.layer.masksToBounds = true
       okButton.setBorder(with: .clear, width: 1)
       cancelButton.setBorder(with: .clear, width: 1)
   }
   
   
   
   func xibSetup() {
       view = loadViewFromNib()
       addSubview(view)
       
       customSetup()
   }
   
   
   
   func loadViewFromNib() -> UIView {
       
       let bundle = Bundle(for: type(of: self))
       let nib = UINib(nibName: "CustomAlert", bundle: bundle)
       let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
       
       return view
   }
   
   @IBAction func confirmBtnPressed(){
       onComplete?(.confirm)
       self.dismiss()
   }
   
   fileprivate func dismiss() {
       UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
           self.mainView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
           self.alpha = 0
       }, completion: {
           
           (compleation ) in
           if compleation{
               self.removeFromSuperview()
           }
       })
   }
   
   @IBAction func endView(){
       onComplete?(.cancel)
       dismiss()
   }
    
   func animateIn(){
       self.mainView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
       self.alpha = 0
       UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
           self.mainView.transform = .identity
           self.alpha = 1
       })
   }
   
   enum AlertButton{
       case confirm
       case cancel
   }
   
}

extension UIViewController{
   func showAlert(title:String,message:String,confirmBtnTitle:String? = nil , cancelBtnTitle:String? = nil, hideCancelBtn:Bool = true  ,complitionHandler:( (CustomAlert.AlertButton)->Void)?  = nil) {
       
       let popUp = CustomAlert(title: title, message:message,complitionHandler:complitionHandler)
       popUp.contentMode = .scaleToFill
  
       popUp.cancelButton.setTitle(cancelBtnTitle ?? "Cancel", for: .normal)
       popUp.cancelButton.isHidden = hideCancelBtn
       popUp.okButton.setTitle(confirmBtnTitle ?? "OK", for: .normal)
       
       DispatchQueue.main.async {
//           popUp.frame = self.view.bounds
           self.view.addSubview(popUp)
           NSLayoutConstraint.activate([
            popUp.topAnchor.constraint(equalTo:  self.view.topAnchor),
            popUp.leftAnchor.constraint(equalTo:  self.view.leftAnchor),
            popUp.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            popUp.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            popUp.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            popUp.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),

           ])
       }
   }


}
