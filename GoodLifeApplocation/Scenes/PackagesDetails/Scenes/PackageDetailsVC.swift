//
//  PackageDetailsVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit

class PackageDetailsVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var packageDetailsSegmentControl: UISegmentedControl!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButtonDesignable!
    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var revireTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var rateCount: UILabel!
    //MARK: - Properties
    
    var oppourtinityDetails:OppourtinityDetails?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerHeight.constant = CGFloat(660)
        setupPageview()
        packageDetailsSegmentControl.addTarget(self, action: #selector(packageTypeTapped), for: .valueChanged)
        setupNotificationCenter()
        bindBackButton()
        
    }
    
    //MARK: - setup container view

    private func setupPageview(){
        subTitle.text = oppourtinityDetails?.sub_title ?? ""
        titleTxt.text = oppourtinityDetails?.title ?? ""
        revireTxt.text = "\(Float(oppourtinityDetails?.rate ?? 0 ))"
        rateCount.text = "(\(oppourtinityDetails?.rate_count ?? 0))" + "" + "from community"
        let vc = GeneralPagerViewVC()
        vc.oppourtinityDetails = oppourtinityDetails

        self.addChild(vc)
        self.containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.frame = self.containerView.bounds
    }
    
    private func setupNotificationCenter(){
        
 
    NotificationCenter.default.addObserver(forName: .init(rawValue: "containerHeight"), object: nil, queue: .main) { notify in
        guard let containerHeight = notify.object as? Int else { return }
        print(containerHeight)
        self.containerHeight.constant = CGFloat(containerHeight)
            
        }
    }
    
    @objc func packageTypeTapped(sender : UISegmentedControl){
        
        switch sender.selectedSegmentIndex{
            
        case 0:
            
            self.containerView.subviews.first?.removeFromSuperview()
            let vc=GeneralPagerViewVC()
            print(oppourtinityDetails)
            self.addChild(vc)
            self.containerView.addSubview(vc.view)
            vc.didMove(toParent: self)
            vc.view.frame = self.containerView.bounds
            
        case 1:
            
            self.containerView.subviews.first?.removeFromSuperview()
            let vc=SpecificPagerVC()
            self.addChild(vc)
            self.containerView.addSubview(vc.view)
            vc.didMove(toParent: self)
            vc.view.frame = self.containerView.bounds
        default:
            print("error selected")
            
            
        }
        
    }

}
//MARK: - Binding

private extension PackageDetailsVC{
    
    func bindBackButton(){
        backBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        nextBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    
}
//MARK: - private Handler
private extension PackageDetailsVC{

    @objc func buttonWasTapped(sender:UIButton){
        switch sender{
        case backBtn:
            print("error selected")

            navigationController?.popViewController(animated: true)

        case nextBtn:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController")
            self.sceneDelegate.setRootVC(vc: vc)
        default:
            print("error selected")

        }
        
    
  }
}
