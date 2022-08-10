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
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerHeight.constant = CGFloat(660)
        setupPageview()
        
    }
    //MARK: - setup container view

    private func setupPageview(){
        let vc = GeneralPagerViewVC()
        self.addChild(vc)
        self.containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.frame = self.containerView.bounds
    }

}
