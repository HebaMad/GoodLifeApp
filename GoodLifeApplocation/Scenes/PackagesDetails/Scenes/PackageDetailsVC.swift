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
    
    //MARK: - Properties
    
    var oppourtinityDetails:packageDetails?
    
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
        let vc = GeneralPagerViewVC()
        self.addChild(vc)
        self.containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.frame = self.containerView.bounds
    }
    
    private func setupNotificationCenter(){
        
 
    NotificationCenter.default.addObserver(forName: .init(rawValue: "containerHeight"), object: nil, queue: .main) { notify in
        guard let containerHeight = notify.object as? Int else { return }
        self.containerHeight.constant = CGFloat(containerHeight)
            
        }
    }
    @objc func packageTypeTapped(sender : UISegmentedControl){
        switch sender.selectedSegmentIndex{
            
        case 0:
            
            self.containerView.subviews.first?.removeFromSuperview()
            let vc=GeneralPagerViewVC()
            vc.oppourtinityDetails = oppourtinityDetails
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

//            navigationController?.popViewController(animated: true)

        case nextBtn:
            let vc = DashboardVC.instantiate()
            self.sceneDelegate.setRootVC(vc: vc)
        default:
            print("error selected")

        }
        
    
  }
}
