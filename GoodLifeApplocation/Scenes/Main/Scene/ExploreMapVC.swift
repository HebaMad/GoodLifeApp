//
//  ExploreMapVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 21/03/2023.
//

import UIKit
import FittedSheets

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

    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func SelectionMenuBtn(_ sender: Any) {
        let controller = choosingMinistryNeedsVC()
//        controller.typeTitle.text=categoriesLabel.text
        let sheetController = SheetViewController(
            
            controller: controller,
            // sizes: [ .intrinsic , .percent(0.80), .fixed(600), .intrinsic])
            sizes: [ .marginFromTop(520), .percent(0.7), .intrinsic])
//          controller.onFilterDissmissed = self
        
            self.present(sheetController, animated: false, completion: nil)
    }
    
   

}

extension ExploreMapVC{
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment in
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
        let cell = collectionView.cellForItem(at: indexPath) as! HobbiesCell
        cell.hobbyView.layer.borderColor = UIColor(named: "BgColor")?.cgColor
        cell.hobbiesTitle.textColor = UIColor(named: "BgColor")
        categoriesLabel.text = categories[indexPath.row].name

    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! HobbiesCell
        cell.hobbyView.layer.borderColor = UIColor.clear.cgColor
        cell.hobbiesTitle.textColor = .black
    }
 
}
