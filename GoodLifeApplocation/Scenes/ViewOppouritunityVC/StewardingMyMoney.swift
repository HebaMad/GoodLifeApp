//
//  StewardingMyMoney.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/02/2023.
//

import UIKit
import XLPagerTabStrip

class StewardingMyMoney: UIViewController ,IndicatorInfoProvider{
    var money:Money?

    var itemInfo: IndicatorInfo = "Money"

    @IBOutlet weak var revenuMoneyTxt: UILabel!
    @IBOutlet weak var investmentMoney: UILabel!
    
    @IBOutlet weak var availableSupportTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getMoneyData()
        
    }
    
    func getMoneyData(){
        print(money?.revenue)
        revenuMoneyTxt.text = money?.revenue
        investmentMoney.text = money?.investments
        availableSupportTxt.text = money.
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
