//
//  PackageDetailsVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit

class PackageDetailsVC: UIViewController {

    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        containerHeight.constant = CGFloat(660)
        setupPageview()
        
    }

    private func setupPageview(){
        let vc = GeneralPagerViewVC()
        self.addChild(vc)
        self.containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        vc.view.frame = self.containerView.bounds
    }

}
