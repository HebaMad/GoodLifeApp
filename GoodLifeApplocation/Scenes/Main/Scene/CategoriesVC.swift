//
//  CategoriesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 15/03/2023.
//

import UIKit

class CategoriesVC: UIViewController {
    //MARK: - outlet

    @IBOutlet weak var AddCategory: UIButton!
    @IBOutlet weak var categoriesCollectionview: UICollectionView!
    
    
    //MARK: - Properties

    var categories:[mainType]=[]
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 2.0,left: 0.0,bottom: 2.0,right: 0.0)

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButtons()
        setupCollectionView()
      }
    
    //MARK: - Binding

    func bindButtons(){
        AddCategory.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    //MARK: - setup collectionview
    func setupCollectionView(){
        
        categoriesCollectionview.register(CategoryCell.self)
        categoriesCollectionview.register(UINib(nibName:"searchviewHeader", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: searchviewHeader.headerIdentifier)
        
        categoriesCollectionview.collectionViewLayout = createCompositionalLayout()
        categoriesCollectionview.delegate=self
        categoriesCollectionview.dataSource=self
        
    }
}


//MARK: - Private Handler

private extension CategoriesVC {
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender {
   
        case AddCategory:
            let vc = AddFundTypes()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("error selection")
        }
    }
}
//MARK: - compsitional layout creation

extension CategoriesVC {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else {return nil}
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(90))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            //            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
            section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
            section.supplementariesFollowContentInsets = false
            return section
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}
//MARK: - confirm to UICollectionviewDelegate

extension CategoriesVC:UICollectionViewDelegate{}


//MARK: - confirm to UICollectionviewDataSource

extension CategoriesVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoryCell=collectionView.dequeueReusableCell(for: indexPath)
        cell.configureCell(data: categories[indexPath.row])
        cell.categoryTitle.font=UIFont.systemFont(ofSize: 11, weight: .medium)
        return cell
    }
}
//MARK: - confirm to UICollectionViewDelegateFlowLayout

extension CategoriesVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: searchviewHeader.headerIdentifier, for: indexPath) as! searchviewHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120) //add your height here
    }
    
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 2)
        let availableWidth = view.frame.width - 16
        let widthPerItem = availableWidth / 2.2
        
        return CGSize(width: widthPerItem, height: 88)
    }
}



