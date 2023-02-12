//
//  StewardingMyMoney.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/02/2023.
//

import UIKit
import XLPagerTabStrip

class StewardingMyMoney: UIViewController ,IndicatorInfoProvider{

    var itemInfo: IndicatorInfo = "Money"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
extension StewardingMyMoney:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
extension StewardingMyMoney{
    
    //MARK: - configuration

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
