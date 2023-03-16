//
//  CategoriesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 15/03/2023.
//

import UIKit

class CategoriesVC: UIViewController {
    
    private let itemsPerRow: CGFloat = 2
    
    private let sectionInsets = UIEdgeInsets(
        top: 2.0,
        left: 0.0,
        bottom: 2.0,
        right: 0.0)
    @IBOutlet weak var categoriesCollectionview: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    func setupCollectionView(){
        
        categoriesCollectionview.register(CategoryCell.self)
        categoriesCollectionview.register(UINib(nibName:"searchviewHeader", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: searchviewHeader.headerIdentifier)
        categoriesCollectionview.register(UINib(nibName:"ButtonActionFooterCollectionview", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionFooter, withReuseIdentifier: ButtonActionFooterCollectionview.footerIdentifier)
        categoriesCollectionview.collectionViewLayout = createCompositionalLayout()

        categoriesCollectionview.delegate=self
        categoriesCollectionview.dataSource=self
      
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else {return nil}
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(90))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(0.5))
            
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
//            section.orthogonalScrollingBehavior = .continuous
            
            section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
            section.boundarySupplementaryItems = [self.supplementaryHeaderItem(),self.supplementaryFooterItem()]
            section.supplementariesFollowContentInsets = false
            return section
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    private func supplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
    }
    
    
    
}
extension CategoriesVC:UICollectionViewDelegate{}

extension CategoriesVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoryCell=collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension CategoriesVC:UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
            
        case UICollectionView.elementKindSectionHeader:
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: searchviewHeader.headerIdentifier, for: indexPath) as! searchviewHeader
            
            return header
            
            
        case UICollectionView.elementKindSectionFooter:
            
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ButtonActionFooterCollectionview.footerIdentifier, for: indexPath) as! ButtonActionFooterCollectionview
            footer.saveBtn.setTitle(" + Add Category ", for: .normal)
            return footer
            
        default:
            
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: collectionView.frame.width, height: 120) //add your height here
     }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 100) //add your height here
//    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 2)
        let availableWidth = view.frame.width - 16
        let widthPerItem = availableWidth / 2.2
        
        return CGSize(width: widthPerItem, height: 88)
    }
    
}



