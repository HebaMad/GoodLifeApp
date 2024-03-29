//
//  StewardingMyResourceVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/02/2023.
//

import UIKit
import XLPagerTabStrip

class StewardingMyResourceVC: ButtonBarPagerTabStripViewController {
    var  stewardingResourceData:StewardingMyResource?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPagerTab()
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
        
        
        let first = StewardingTimeAndTalent.instantiate()
             first.hobbies = stewardingResourceData?.timeAndTalent
             first.itemInfo = "Time & Talent"
 
        
        let second = StewardingMyMoney.instantiate()
            second.money = stewardingResourceData?.money
            second.itemInfo = "Money"
       

        return [second,first]
    }
    

}

extension StewardingMyResourceVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
