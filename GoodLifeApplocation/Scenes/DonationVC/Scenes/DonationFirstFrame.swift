//
//  DonationFirstFrame.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 26/07/2022.
//

import UIKit

class DonationFirstFrame: UIViewController {

    //MARK: - Outlets
    @IBOutlet var FundCollectionView: UICollectionView!
    private let sections = MockData.shared.pageData

//    let headerId = "headerId"
//    let arrImages = ["image1", "image2", "image3", "image4", "image5", "image6"]
    let categoryHeaderId = "categoryHeaderId"
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.title = "My Albums"
        
        FundCollectionView.register(FeaturedFundsCollectionViewCell.self)
        FundCollectionView.register(OtherFundsCollectionViewCell.self)
        FundCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        FundCollectionView.collectionViewLayout = createCompositionalLayout()
        FundCollectionView.dataSource=self
        FundCollectionView.delegate=self

        FundCollectionView.reloadData()
    }

    //MARK: - Helper Method
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {

        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            switch sectionNumber {
            
            case 0: return self.thirdLayoutSection()
            default: return self.secondLayoutSection()

            }
        }
    }
    

    private func secondLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(140))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 15
        
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(70)), elementKind: categoryHeaderId, alignment: .top)
        ]
        
        return section
    }
    
    private func thirdLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 8
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalWidth(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 2)
       
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    

}

//MARK: - UICollectionViewDataSource Methods
extension DonationFirstFrame: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sections[section].count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        

        switch sections[indexPath.section] {
        case .FeaturedFund(let items):
            
            let cell:FeaturedFundsCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.setup(items[indexPath.row])
            return cell
            
        case .otherFund(let items):
            let cell:OtherFundsCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.setup(items[indexPath.row])

            return cell

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}

