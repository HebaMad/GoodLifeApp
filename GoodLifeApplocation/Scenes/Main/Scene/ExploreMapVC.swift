//
//  ExploreMapVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 21/03/2023.
//

import UIKit

class ExploreMapVC: UIViewController {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var categoriesCollectionview: UICollectionView!
    
    var categories:[mainType]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionview()
    }
    func setupCollectionview(){
        categoriesCollectionview.register(HobbiesCell.self)
        categoriesCollectionview.collectionViewLayout = createCompositionalLayout()

        categoriesCollectionview.delegate=self
        categoriesCollectionview.dataSource=self

    }

    @IBAction func SelectionMenuBtn(_ sender: Any) {
    }
    
   

}

extension ExploreMapVC{
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
//            guard let self = self  else {return nil}
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(50))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(1))
            
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            
            section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
   
            section.supplementariesFollowContentInsets = false
            return section
        }
    }
    
}
extension ExploreMapVC:Storyboarded{
    
    static var storyboardName: StoryboardName = .main

}

extension ExploreMapVC:UICollectionViewDelegate{}
extension ExploreMapVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.deleteItemBtn.isHidden=true
        cell.hobbyView.backgroundColor = .white

        cell.hobbiesTitle.text = categories[indexPath.row].name
        cell.hobbyView.layer.cornerRadius = 0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.hobbyView.layer.borderColor = UIColor(named: "BgColor")?.cgColor
        cell.hobbiesTitle.textColor = UIColor(named: "BgColor")

    }
 
}
