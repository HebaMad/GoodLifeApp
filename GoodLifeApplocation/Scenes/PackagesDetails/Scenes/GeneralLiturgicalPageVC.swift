//
//  GeneralLiturgicalPageVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip
class GeneralLiturgicalPageVC: UIViewController, IndicatorInfoProvider{
    var itemInfo: IndicatorInfo = "Liturgical"

  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//MARK: - configuration
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
