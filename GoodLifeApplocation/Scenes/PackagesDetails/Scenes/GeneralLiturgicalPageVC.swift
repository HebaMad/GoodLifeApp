//
//  GeneralLiturgicalPageVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip
class GeneralLiturgicalPageVC: UIViewController, IndicatorInfoProvider{
    //MARK: - Properties

    var itemInfo: IndicatorInfo = "Liturgical"

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//MARK: - configuration
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
