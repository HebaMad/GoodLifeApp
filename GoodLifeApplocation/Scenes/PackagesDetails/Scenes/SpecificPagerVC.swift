//
//  SpecificPagerVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip

class SpecificPagerVC: ButtonBarPagerTabStripViewController{
    
    //MARK: - Propeerties
    
    var oppourtinityID=0
    var oppourtinityDetails:OppourtinityDetails?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = UserDefaults.standard.object(forKey: "oppourtinityID") as? Data;
        if data != nil{
            oppourtinityDetails =  try! JSONDecoder().decode(OppourtinityDetails.self, from: data ?? Data())
            setupPagerTab()
            
        }
    }
    
    //MARK: - setup pager Tab Strip
    
    private func setupPagerTab(){
        settings.style.buttonBarBackgroundColor = .blue
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = .white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.init(named: "hex")
            newCell?.label.textColor = UIColor.init(named: "BgColor")
        }
    }
    
    
//
//    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//
//
//        let first = SpecificFinancialModel()
//
//        let data = UserDefaults.standard.object(forKey: "oppourtinityID") as? Data;
//        if data != nil{
//            oppourtinityDetails =  try! JSONDecoder().decode(OppourtinityDetails.self, from: data ?? Data())
//            first.item = oppourtinityDetails?.specifics?[0].items ?? []
//            first.graph =  oppourtinityDetails?.specifics?[0].graph ?? []
//            first.itemInfo = "FinancialModel"
//
//        }
//
//        let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SpecificWebsiteVC") as! SpecificWebsiteVC
//        if data != nil{
//            oppourtinityDetails =  try! JSONDecoder().decode(OppourtinityDetails.self, from: data ?? Data())
//            second.item = oppourtinityDetails?.specifics?[1].items ?? []
//            second.topCompetitorTitle =  oppourtinityDetails?.specifics?[1].footer_title ?? ""
//            second.topCompetitorValue =  oppourtinityDetails?.specifics?[1].details ?? ""
//            second.itemInfo = "Website"
//        }
//
//        let third = SpeificBusinessPlanVC()
//        if data != nil{
//            oppourtinityDetails =  try! JSONDecoder().decode(OppourtinityDetails.self, from: data ?? Data())
//            third.item = oppourtinityDetails?.specifics?[2].items ?? []
//            third.graph =  oppourtinityDetails?.specifics?[2].graph ?? []
//            third.itemInfo = "BusinessPlan"
//
//        }
//
//
//        return [first, second,third]
//    }
    
}
