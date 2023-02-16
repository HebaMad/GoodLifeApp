//
//  DonationFirstFrame.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit
import SkeletonView
class DonationFirstFrame: UIViewController {

    //MARK: - Outlets
    @IBOutlet var FundCollectionView: UICollectionView!
    private let sections = MockData.shared.pageData
    
    //MARK: - Properties
    
    let presenter = MenuPresenter()
    var funder:[Founder]=[]
    var otherFunder:[Founder]=[]
    private var isSkeleton: Bool = true {
        didSet {
            self.FundCollectionView.reloadData()
        }
    }
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isSkeleton = true
        self.presenter.getWorthyCause()
        self.presenter.delegate = self
        FundCollectionView.register(FeaturedFundsCollectionViewCell.self)
        FundCollectionView.register(OtherFundsCollectionViewCell.self)
        FundCollectionView.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        FundCollectionView.collectionViewLayout = createCompositionalLayout()
        FundCollectionView.dataSource=self
        FundCollectionView.delegate=self

        FundCollectionView.reloadData()
    }

    //MARK: -  setup UICollectionViewCompositionalLayout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return nil }
            
            let section = self.sections[sectionIndex]
            switch section {
            case .otherFund:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(140))
                
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
                
            case .FeaturedFund:
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.76), heightDimension: .fractionalWidth(0.6))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)

                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: -10, leading: 4, bottom:-30, trailing: 4)
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

//MARK: - UICollectionViewDataSource ,Delegate ,DelegateFlowLayout confirmation
extension DonationFirstFrame: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section]{
        case .FeaturedFund: return self.isSkeleton ? 3 : funder.count
        case .otherFund :return self.isSkeleton ? 6: otherFunder.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        

        switch sections[indexPath.section] {
        case .FeaturedFund:
            
            let cell:FeaturedFundsCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            guard !self.isSkeleton else {
                cell.startSkeleton()
                return cell
            }
            cell.stopSkeleton()
            cell.setup(funder[indexPath.row])
            return cell
            
        case .otherFund:
            let cell:OtherFundsCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            guard !self.isSkeleton else {
                cell.startSkeleton()
                return cell
            }
            cell.stopSkeleton()
            cell.setup(otherFunder[indexPath.row])

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
        header.editBtn.isHidden=true
        header.headerTitleLabel.textAlignment = .center
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch sections[indexPath.section]{
        case .FeaturedFund:
            NotificationCenter.default.post(name: .init(rawValue: "GoodLife"), object: [1,FundCollectionView.bounds.height,funder[indexPath.row].id ?? 0])

        case .otherFund:
            NotificationCenter.default.post(name: .init(rawValue: "GoodLife"), object: [1,FundCollectionView.bounds.height,otherFunder[indexPath.row].id ?? 0])

        }

    }

}


extension DonationFirstFrame:MenuDelegate{
    func getFundTypeData(data: FundType) {
        }

    func showAlerts(title: String, message: String) {
        
    }
    
    func getFunderData(data: WorthyCauses) {
        self.isSkeleton = false

        funder=data.featuredFunds ?? []
        otherFunder=data.otherFunds ?? []
        FundCollectionView.reloadData()

    }
    
    
    
}
