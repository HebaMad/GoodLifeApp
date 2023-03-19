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
        
        
//        let decoded  = UserDefaults.standard.data(forKey: "oppourtinityID")
//        oppourtinityDetails = NSKeyedUnarchiver.unarchiveObject(with: decoded ?? Data()) as? OppourtinityDetails
        let data = UserDefaults.standard.object(forKey: "oppourtinityID") as? Data;
         if data != nil{
              oppourtinityDetails =  try! JSONDecoder().decode(OppourtinityDetails.self, from: data ?? Data())
             setupPagerTab()
             
         }
           
 

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    //MARK: - SetupPagerTab
    
    private func setupPagerTab(){
        settings.style.buttonBarBackgroundColor = .blue
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .white
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
        let data = UserDefaults.standard.object(forKey: "oppourtinityID") as? Data;
         if data != nil{
              oppourtinityDetails =  try! JSONDecoder().decode(OppourtinityDetails.self, from: data ?? Data())
             first.item = oppourtinityDetails?.generals?[0].items ?? []
             first.itemInfo = "Finicial"
         }
       
        
        
    let second = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GeneralMarketingPageVC") as! GeneralMarketingPageVC
         if data != nil{
        oppourtinityDetails =  try! JSONDecoder().decode(OppourtinityDetails.self, from: data ?? Data())
        second.item = oppourtinityDetails?.generals?[1].items ?? []
        second.footerTitle =  oppourtinityDetails?.generals?[1].footer_title ?? ""
        second.footerValue =  oppourtinityDetails?.generals?[1].details ?? ""
        second.graph =  oppourtinityDetails?.generals?[1].graph ?? []
        second.itemInfo = "Marketing"
         }
        
        let third = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GeneralsLiturgicalPageVC") as! GeneralsLiturgicalPageVC
         if data != nil{
        oppourtinityDetails =  try! JSONDecoder().decode(OppourtinityDetails.self, from: data ?? Data())
        third.item = oppourtinityDetails?.generals?[2].items ?? []
        third.graph =  oppourtinityDetails?.generals?[2].graph ?? []

        third.itemInfo = "Liturgical"
         }
        
        return [first, second,third]
    }
    
}
extension GeneralPagerViewVC:HomeDelegate{
    
    func getMainScreenData(data: MainScreenData) {}
    func showAlerts(title: String, message: String) {}
    func getCategories(categories: Home) {}
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {}
    func getsubCategoriesFiltering(categories: SubHomeCategories) {}
    func getCategoriesFiltered(categories: Home) {}
    func getOppourtinity(categories: Oppourtinity) {}
    func getOppourtinityDetails(categories: OppourtinityDetails) {
        oppourtinityDetails=categories
        setupPagerTab()
        
    }

    
}
