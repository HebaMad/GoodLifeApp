//
//  EditHobbiesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 16/02/2023.
//

import UIKit

class EditHobbiesVC: UIViewController {
    
    @IBOutlet weak var hobbiesCollectionview: UICollectionView!
    
    //MARK: - Properties
    var footer = HobbiesAddition()
    private let sections = HobbiesItem.shared.AllHobbiesItem
    var listTalent:[String] = []
    var listInterest:[String] = []
    var hobbiesType : String = ""
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionview()
    }
    
    private func setupCollectionview(){
        
        hobbiesCollectionview.register(HobbiesCell.self)
        
        hobbiesCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        hobbiesCollectionview.register(UINib(nibName:"HobbiesAddition", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionFooter, withReuseIdentifier: HobbiesAddition.footerIdentifier)
//        hobbiesCollectionview.collectionViewLayout = createCompositionalLayout()
        hobbiesCollectionview.dataSource=self
        hobbiesCollectionview.delegate=self
        
        hobbiesCollectionview.reloadData()
        
    }
//    //MARK: -  setup UICollectionViewCompositionalLayout
//    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
//        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
//            guard let self = self  else { return }
//            
//            //            let section = self.sections[sectionIndex]
//            //            switch section {
//            //
//            //            case .interest:
//            
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(50))
//            
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
//            
//            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(0.5))
//            
//            
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//            group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
//            let section = NSCollectionLayoutSection(group: group)
//            
//            //                section.orthogonalScrollingBehavior = .continuous
//            section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
//            section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
//            section.supplementariesFollowContentInsets = false
//            return section
//            
//            //            case .talent:
//            //
//            //                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(50))
//            //
//            //                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            //                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
//            //
//            //                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(0.5))
//            //
//            //
//            //                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//            //                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
//            //                let section = NSCollectionLayoutSection(group: group)
//            //
//            //                //                section.orthogonalScrollingBehavior = .continuous
//            //                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
//            //                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
//            //                section.supplementariesFollowContentInsets = false
//            //                return section
//       
//            }
//            
//        }

    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

extension EditHobbiesVC:UICollectionViewDelegate{}

extension EditHobbiesVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //    switch sections[section]{
        //
        //    case .talent: return hobbiesType == "talent" ? listTalent.count : 0
        //    case .interest : return hobbiesType == "interest" ? listInterest.count : 0
        //
        //
        //
        //    }
        
        hobbiesType == "talent" ? listTalent.count : listInterest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
        
        hobbiesType == "talent" ?  cell.setupCustomCell(hobbyTitle: listTalent[indexPath.row]): cell.setupCustomCell(hobbyTitle: listInterest[indexPath.row])
        cell.deleteItemBtn.isHidden=false
        cell.deleteItemBtn.tag=indexPath.row
        cell.deleteItemBtn.addTarget(self, action: #selector(deleteHobbiesItem), for: .touchUpInside)
        
        
        
        
        return cell
   
    
}






func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}
func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    
    switch kind{
        
    case UICollectionView.elementKindSectionHeader:
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.setup(sections[indexPath.section].title)
        header.viewAllButton.isHidden = true
        header.headerTitleLabel.textAlignment = .left
        header.headerTitleLabel.textColor = .white
        header.headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        return header
        
    case UICollectionView.elementKindSectionFooter:
        footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HobbiesAddition.footerIdentifier, for: indexPath) as! HobbiesAddition
        footer.AddBtn.tag=indexPath.row
        footer.AddBtn.addTarget(self, action: #selector(AddHobbies), for: .touchUpInside)
        
        return footer
    default:
        
        assert(false, "Unexpected element kind")
    }
    
    
}
}

extension EditHobbiesVC {
    @objc func AddHobbies(sender:UIButton){
        if footer.hobbiesField.text != "" {
            if hobbiesType == "talent" {
                listTalent.append(footer.hobbiesField.text!)
            }else{
                listInterest.append(footer.hobbiesField.text!)
            }
            
        }
        
    }
    @objc func deleteHobbiesItem(sender:UIButton){
        let indexPath = NSIndexPath(row: sender.tag, section: 0)
        let cell:HobbiesCell = hobbiesCollectionview.cellForItem(at: indexPath as IndexPath) as! HobbiesCell
        if cell.hobbiesTitle.text != ""{
            
            if hobbiesType == "talent" {
                listTalent=listTalent.filter({ $0 != ""})
            }else{
                listInterest.append(footer.hobbiesField.text!)
            }
        }
      
        
        
        
    }
}
