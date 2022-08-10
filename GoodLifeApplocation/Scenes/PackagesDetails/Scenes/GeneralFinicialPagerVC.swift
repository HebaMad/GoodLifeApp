//
//  GeneralFinicialPagerVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip
class GeneralFinicialPagerVC: UIViewController, IndicatorInfoProvider {
    
    //MARK: - Properties
    
    var itemInfo: IndicatorInfo = "Finicial"

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - configuration

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
