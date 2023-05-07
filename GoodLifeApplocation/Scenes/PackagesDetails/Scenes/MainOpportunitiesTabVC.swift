//
//  MainOpportunitiesTabVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 06/04/2023.
//

import UIKit
import XLPagerTabStrip

class MainOpportunitiesTabVC: ButtonBarPagerTabStripViewController {
    var opportunityDetails:opportunitiesDetails?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPagerTab()
        print(opportunityDetails)

    }
    


        private func setupPagerTab(){
            settings.style.buttonBarBackgroundColor = .clear
            settings.style.buttonBarItemBackgroundColor = .clear
            settings.style.buttonBarItemTitleColor = .white
            settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
            settings.style.selectedBarHeight = 2.0
            settings.style.buttonBarMinimumLineSpacing = 30
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
            first.data=opportunityDetails?.financial
                 first.itemInfo = "Financial Model"
    
    
            let second = GeneralMarketingPageVC.instantiate()
            second.marketing=opportunityDetails?.marketing
                second.itemInfo = "Marketing"
    
            let third = GeneralLiturgicalPageVC.instantiate()
            third.ligutrical=opportunityDetails?.liturgical
            third.itemInfo = "Liturgical"
    
    
            let fourth = DigitalOpportunitiesVC.instantiate()
            fourth.digital=opportunityDetails?.digital
                fourth.itemInfo = "Digital"
    
            let fifth = SpeificBusinessPlanVC()
            fifth.businessPlan=opportunityDetails?.businessPlan
                fifth.itemInfo = "Business Plans"
    
            return [first,second,third,fourth,fifth]
        }

}
extension MainOpportunitiesTabVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
