//
//  CategoriesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 15/03/2023.
//

import UIKit

class CategoriesVC: UIViewController {

    
    @IBOutlet weak var categoriesCollectionview: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView(){
        categoriesCollectionview.register(CategoryCell.self)
        categoriesCollectionview.register(UINib(nibName:"ButtonActionFooterCollectionview", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionFooter, withReuseIdentifier: ButtonActionFooterCollectionview.footerIdentifier)
        
        categoriesCollectionview.delegate=self
        categoriesCollectionview.dataSource=self

    }

}
extension CategoriesVC:UICollectionViewDelegate{}

extension CategoriesVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoryCell=collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
