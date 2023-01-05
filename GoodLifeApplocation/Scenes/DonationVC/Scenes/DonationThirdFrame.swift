//
//  DonationThirdFrame.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit
import SDWebImage
class DonationThirdFrame: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var subWorthyCause: UIImageViewDesignable!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var SubscribeTypeTitle: UILabel!
    @IBOutlet weak var subscribeDescription: UILabel!
    @IBOutlet weak var processDescription: UILabel!
    @IBOutlet weak var firstStageDesc: UILabel!
    @IBOutlet weak var lastStageDesc: UILabel!
    @IBOutlet weak var graphImage: UIImageViewDesignable!
    @IBOutlet weak var priceTxt: UITextField!
    
    var detailsData:Founder?
    var presenter = MenuPresenter()
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        
    }
    func setupData(){
        SubscribeTypeTitle.text = detailsData?.title
        subscribeDescription.text=detailsData?.details
        subWorthyCause.sd_setImage(with: URL(string: detailsData?.icon ?? ""))
        graphImage.sd_setImage(with: URL(string: detailsData?.icon ?? ""))

    }
    
    //MARK: - Private Handler
    
    @IBAction func DonateNowAction(_ sender: Any) {
        
        do{

            let price = try priceTxt.validatedText(validationType: .requiredField(field: "price required"))
       
            
            presenter.makeDonation(worthyCauseID: detailsData?.id ?? 0, amount: price)
            NotificationCenter.default.post(name: .init(rawValue: "GoodLife"), object: [3,scrollView.bounds.height+30])
            
        }catch{
            showSnackBar(message: (error as! ValidationError).message)
//            self.showAlert(title: "Warning", message: (error as! ValidationError).message,hideCancelBtn: true)

        }
  

    }
    
    
    
}
