//
//  PagerViewVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip

class GeneralPagerViewVC: ButtonBarPagerTabStripViewController {
    
    //MARK: - Propeerties

    var oppourtinityID=0
    var oppourtinityDetails:OppourtinityDetails?
    let presenter = HomePresenter()

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPagerTab()
        presenter.oppourtinityDetails(opportunityID: UserDefaults.standard.integer(forKey: "oppourtinityID"))
        presenter.delegate = self

        
    }
    override func viewWillAppear(_ animated: Bool) {
      

    }
    
    //MARK: - SetupPagerTab
    
    private func setupPagerTab(){
      
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
        first.item = oppourtinityDetails?.general?[0].items ?? []
        first.itemInfo = "Finicial"
        
        
    let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GeneralMarketingPageVC") as! GeneralMarketingPageVC
        second.item = oppourtinityDetails?.general?[1].items ?? []
        second.itemInfo = "Marketing"
        
        let third = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GeneralLiturgicalPageVC") as! GeneralLiturgicalPageVC
        third.item = oppourtinityDetails?.general?[2].items ?? []
        third.itemInfo = "Liturgical"
        
        
        return [first, second,third]
    }
    
}


extension GeneralPagerViewVC:HomeDelegate{
    func showAlerts(title: String, message: String) { }
    
    func getCategories(categories: Home) { }
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {}
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) {}
    
    func getCategoriesFiltered(categories: CategoriesFiltering) {}
    
    func getOppourtinity(categories: Oppourtinity) {}
    
    func getOppourtinityDetails(categories: OppourtinityDetails) {
        oppourtinityDetails=categories
        setupPagerTab()

    }
    
    
}
