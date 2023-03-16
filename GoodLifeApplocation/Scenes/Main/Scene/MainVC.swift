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
        setupCollectionview()
    }
    
    
    private func setupCollectionview(){
        
        HomeCollectionview.register(OpportunitiesCollectionCell.self)
        HomeCollectionview.register(CategoryCell.self)
        HomeCollectionview.register(BannerCell.self)
        HomeCollectionview.register(MapCell.self)
        HomeCollectionview.register(CreateOpportunitiesCell.self)

        HomeCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        HomeCollectionview.collectionViewLayout = createCompositionalLayout()
        HomeCollectionview.dataSource=self
        HomeCollectionview.delegate=self
        
    }
    
}
extension MainVC{
    @objc func viewAllButton(_ sender:UIButton){
        
        switch sections[sender.tag]{
            
            
        case .Categories:
            let vc = CategoriesVC()
            navigationController?.pushViewController(vc, animated: true)
        case .Banner:
            print("No Actions")
        case .Map:
            print("No Actions")

        case .Opportunities:
            print("No Actions")

        }
    }
}

extension MainVC {
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else {return nil}
            let section = self.sections[sectionIndex]
            switch section{
                
            case .Categories:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(90))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous

                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .Map:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .absolute(140))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous

                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.supplementariesFollowContentInsets = false
                return section
            case .Banner:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .absolute(140))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous

                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.supplementariesFollowContentInsets = false
                return section
            case .Opportunities:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(130))
                
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
        case .Opportunities:return 3
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{
            
        case .Categories:
            let cell:CategoryCell=collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .Map:
            let cell:MapCell=collectionView.dequeueReusableCell(for: indexPath)
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

extension MainVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.viewAllButton.addTarget(self, action: #selector(viewAllButton), for: .touchUpInside)
        header.viewAllButton.tag = indexPath.section
        header.editView.isHidden=true
        
        header.setup(sections[indexPath.section].title)
        return header
    }
    
}
