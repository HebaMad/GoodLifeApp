//
//  MainVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/03/2023.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var HomeCollectionview: UICollectionView!
    
    //MARK: - Properties
    private let sections = MainCategoriesModel.shared.AllCategories

    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    
    private func setupCollectionview(){
        
        HomeCollectionview.register(OpportunitiesCollectionCell.self)
        HomeCollectionview.register(CategoryCell.self)
        HomeCollectionview.register(BannerCell.self)
        
        HomeCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        HomeCollectionview.collectionViewLayout = createCompositionalLayout()
        HomeCollectionview.dataSource=self
        HomeCollectionview.delegate=self
        
    }

}


extension MainVC{
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return  }
            let section = self.sections[sectionIndex]
            switch section {
            case .categories:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(140))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .Map:
                
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.3))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
                
            case .Banner:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(140))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                //                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
               
            case .Opportunities:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(140))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                //                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .continuous
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

extension MainVC:UICollectionViewDelegate{}
extension MainVC:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section]{
            
        case .Categories:return 5
        case .Map:return 1
        case .Banner:return 3
        case .Opportunities:return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{
            
        case .Categories:
            let cell:CategoryCell=collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .Map:
            let cell:CategoryCell=collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .Banner:
            let cell:BannerCell=collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .Opportunities:
            let cell:OpportunitiesCollectionCell=collectionView.dequeueReusableCell(for: indexPath)
            return cell
            
            
        }
    }
    
    
}
