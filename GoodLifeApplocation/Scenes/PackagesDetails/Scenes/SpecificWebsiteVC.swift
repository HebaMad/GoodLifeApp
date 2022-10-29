//
//  SpecificWebsiteVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit
import XLPagerTabStrip
class SpecificWebsiteVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var competitorWebsiteTableview: UICollectionView!
    @IBOutlet weak var topCompetitorText: UILabel!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollviewHeight: UIScrollView!

    
    //MARK: - Properties
    
    var itemInfo: IndicatorInfo = "Website"
    var item:[SpecificOppourtinityDetails]=[]
    var topCompetitorTitle: String = ""
    var topCompetitorValue: String = ""

    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        topCompetitorText.text = topCompetitorValue.html2Attributed?.string
        
        setupTableview()
    }
    
    //MARK: - tableview Configuration
    
    private func setupTableview(){
        
        competitorWebsiteTableview.register(SpecificWebsiteCompetitorCell.self)
        self.competitorWebsiteTableview.layer.cornerRadius = 12.0
        self.competitorWebsiteTableview.layer.borderColor =  CGColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        self.competitorWebsiteTableview.layer.borderWidth = 1
        competitorWebsiteTableview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        competitorWebsiteTableview.collectionViewLayout = createCompositionalLayout()
        competitorWebsiteTableview.delegate = self
        competitorWebsiteTableview.dataSource = self
        NotificationCenter.default.post(name: .init(rawValue: "containerHeight"), object: competitorWebsiteTableview.bounds.height+300)

    }
   
    //MARK: -  setup UICollectionViewCompositionalLayout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return nil }
  
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(155))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.4))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
//                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
    
                
            }
            
        }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}


//MARK: - UITableviewDelegate & UITableviewDatasource

extension SpecificWebsiteVC:UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return item[section].childs?.count ?? 0

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
            let cell:SpecificWebsiteCompetitorCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configureCell(index: indexPath.row + 1 , ViewModel: (item[indexPath.section].childs?[indexPath.row])!)
            return cell
  
       
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.setup(item[indexPath.section].title ?? "")
        header.viewAllButton.isHidden = true
        return header
    }
    
    
}

extension SpecificWebsiteVC:IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
}
