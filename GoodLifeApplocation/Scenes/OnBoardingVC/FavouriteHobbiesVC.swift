//
//  FavouriteHobbiesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/02/2023.
//

import UIKit

class FavouriteHobbiesVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var hobbiesCollectionview: UICollectionView!
    
    //MARK: - Properties
    
    private let sections = HobbiesItem.shared.AllHobbiesItem
     var listTalent:[String] = []
     var listInterest:[String] = []

    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionview()
    }

    private func setupCollectionview(){
        
        hobbiesCollectionview.register(HobbiesCell.self)
   
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
                
            }
            
        }
    }
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

extension FavouriteHobbiesVC:UICollectionViewDelegate{}

extension FavouriteHobbiesVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    switch sections[section]{
        
    case .talent: return  sections[section].count
    case .interest : return sections[section].count
        
        
        
    }
}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             switch sections[indexPath.section]{
             case .talent(let items):
                 let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
                 cell.setupCell(hobbyTitle: items[indexPath.row])
                 return cell
             case .interest(let items):
                 let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
                 cell.setupCell(hobbyTitle: items[indexPath.row])
                 return cell
        }
   
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:HobbiesCell  = collectionView.cellForItem(at: indexPath) as! HobbiesCell
            cell.hobbyView.backgroundColor = .white
            cell .hobbiesTitle.textColor = UIColor(named: "backgroundColor")
       
            switch sections[indexPath.section]{
            case .talent(let items):
            listTalent.append(items[indexPath.row].title)
            case .interest(let items):
            listInterest.append(items[indexPath.row].title)
           
            }
        
            print(listTalent)
        
            }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.setup(sections[indexPath.section].title)
        header.viewAllButton.isHidden = true
        header.editBtn.isHidden = true
        header.headerTitleLabel.textAlignment = .left
        header.headerTitleLabel.textColor = .white
        header.headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        return header
    }
}
