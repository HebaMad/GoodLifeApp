//
//  GeneralFinicialPagerVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.

import UIKit
import XLPagerTabStrip


class GeneralFinicialPagerVC: UIViewController, IndicatorInfoProvider {
    
    
    //MARK: - Outlet
    
    
    @IBOutlet weak var firstTopicTitle: UILabel!
    @IBOutlet weak var firstTopicCost: UILabel!

    
    @IBOutlet weak var secondTopicTitle: UILabel!
    @IBOutlet weak var secondTopicCost: UILabel!

    @IBOutlet weak var expectedEarningTxt: UILabel!
    

    //MARK: - Properties
    

    var itemInfo: IndicatorInfo = "Finicial"
    var data:financialInfo?
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
    
    

    

    
    //MARK: - configuration

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
extension GeneralFinicialPagerVC{
    func setupData(){
        NotificationCenter.default.post(name: .init(rawValue: "containerHeight"), object: 950)

        let fmt = NumberFormatter()
        fmt.maximumFractionDigits = 1
        fmt.minimumFractionDigits = 1
        
        firstTopicCost.text =  fmt.string(from: (Float((data?.average_annual_revenue ?? ""))!/1000) as NSNumber)!  + " " + "K"
        secondTopicCost.text = fmt.string(from: Float((data?.average_monthly_cost ?? ""))!/1000 as NSNumber)!  + " " + "K"

        
        let earning = (Float(data?.average_annual_revenue ?? "") ?? 0.0)  + (Float((data?.average_monthly_cost ?? "")) ?? 0.0)
        
        
       
        let output = fmt.string(from: earning as NSNumber)!
        
    }
}
