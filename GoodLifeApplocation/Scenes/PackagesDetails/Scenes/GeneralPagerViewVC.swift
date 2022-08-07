//
//  PagerViewVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip

class GeneralPagerViewVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPagerTab()
        
    }
    
//MARK: - SetupPagerTab
    
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
    
    
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
   
        
        let first = GeneralFinicialPagerVC()
        first.itemInfo = "Finicial"
        
        
        let second = GeneralMarketingPageVC()
    second.itemInfo = "Marketing"
        
        let third = GeneralLiturgicalPageVC()
           
     third.itemInfo = "Liturgical"

       
         return [first, second,third]
     }

}
