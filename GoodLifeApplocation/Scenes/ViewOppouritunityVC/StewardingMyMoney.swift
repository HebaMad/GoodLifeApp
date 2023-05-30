//
//  StewardingMyMoney.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/02/2023.
//

import UIKit
import XLPagerTabStrip
import FittedSheets
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
    
    @IBAction func availableSupportBtn(_ sender: Any) {
        
        let controller = AvailableSupportVC()
        
        let sheetController = SheetViewController(
            controller: controller,
            //                sizes: [ .intrinsic , .percent(0.80), .fixed(600), .intrinsic])
            sizes: [ .marginFromTop(600), .percent(0.4), .intrinsic])
        controller.onSheetDissmissed = self
        
        self.present(sheetController, animated: false, completion: nil)
    }
    
    
    func getMoneyData(){
        
        print(money?.revenue)
        revenuMoneyTxt.text = money?.revenue
        investmentMoney.text = money?.investments
        availableSupportTxt.text = money?.available_support
        
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


extension StewardingMyMoney:transferedData{
    func getData(data: String) {
        availableSupportTxt.text = data
    }
    
    
}
