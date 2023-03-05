//
//  StewardingTimeAndTalent.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/02/2023.
//

import UIKit
import  XLPagerTabStrip
class StewardingTimeAndTalent: UIViewController,IndicatorInfoProvider {

    //MARK: - Outlet
    
    @IBOutlet weak var hobbiesCollectionview: UICollectionView!
    
    //MARK: - Properties
    
    private let sections = StewardingResourceItem.shared.AllHobbiesItem
     var listTalent:[String] = []
     var listInterest:[String] = []
    var itemInfo: IndicatorInfo = "Time & Talent"
    var hobbies:TimeAndTalent?
    var talent:[String]=[]
    var interest:[String]=[]
    var time:[Time]=[]
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionview()
        hobbiesCollectionview.layer.cornerRadius = 16
        getData()
    }
    
    func  getData(){
        talent = hobbies?.talents ?? []
        interest = hobbies?.interests ?? []
        time=hobbies?.time ?? []

    }

    private func setupCollectionview(){
        
        hobbiesCollectionview.register(HobbiesCell.self)
        hobbiesCollectionview.register(TimeCell.self)
        hobbiesCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        hobbiesCollectionview.collectionViewLayout = createCompositionalLayout()
        hobbiesCollectionview.dataSource=self
        hobbiesCollectionview.delegate=self
        
        hobbiesCollectionview.reloadData()
    }


    //MARK: -  setup UICollectionViewCompositionalLayout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return nil }
            
            let section = self.sections[sectionIndex]
            switch section {
            case .interest:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(50))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
                
            case .talent:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(50))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
                
            case .Time :
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(50))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
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
    }
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

extension StewardingTimeAndTalent:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
extension StewardingTimeAndTalent:UICollectionViewDelegate{}

extension StewardingTimeAndTalent:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch sections[section]{
            
        case .talent: return  talent.count
        case .interest : return interest.count
        case .Time:return time.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{
        case .talent:
            let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.setupCustomCell(hobbyTitle: talent[indexPath.row])
            cell.hobbyView.backgroundColor = UIColor(named: "bg3")
            cell.hobbiesTitle.textColor = .black
            return cell
            
        case .interest:
            
            let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.setupCustomCell(hobbyTitle: interest[indexPath.row])
            cell.hobbyView.backgroundColor = UIColor(named: "bg3")
            cell.hobbiesTitle.textColor = .black
            return cell
            
        case .Time:
            
            let cell:TimeCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(data:  time[indexPath.row])
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.setup(sections[indexPath.section].title)
        header.viewAllButton.isHidden = true
        header.headerTitleLabel.textAlignment = .left
        header.headerTitleLabel.textColor = .gray
        header.headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        return header
    }
}


extension StewardingTimeAndTalent{
    
    //MARK: - configuration

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}
