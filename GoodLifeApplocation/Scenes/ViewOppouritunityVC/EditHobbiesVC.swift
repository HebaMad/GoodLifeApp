//
//  EditHobbiesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 16/02/2023.
//

import UIKit
protocol hobbiesTransfered{
    func getHobbiesData(hobbies:[String],hobbiesType:String)
}
class EditHobbiesVC: UIViewController {
    
    @IBOutlet weak var hobbiesCollectionview: UICollectionView!
    
    //MARK: - Properties
    
//    var footer = HobbiesAddition()
    var footer2 = ButtonActionFooterCollectionview()
    private let sections = HobbiesItem.shared.AllHobbiesItem
    var listTalent:[String] = ["test","test","test","test","test"]
    var listInterest:[String] = ["test"]
    var hobbiesType : String?
    var onSheetDissmissed:hobbiesTransfered?
    let presenter = MenuPresenter()
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(listTalent)
        setupCollectionview()
    }
    
    private func setupCollectionview(){
        
        hobbiesCollectionview.register(HobbiesCell.self)
        hobbiesCollectionview.register(AddingItemCell.self)
        
        hobbiesCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
   
        hobbiesCollectionview.register(UINib(nibName:"ButtonActionFooterCollectionview", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionFooter, withReuseIdentifier: ButtonActionFooterCollectionview.footerIdentifier)

        hobbiesCollectionview.collectionViewLayout = createCompositionalLayout()
        hobbiesCollectionview.dataSource=self
        hobbiesCollectionview.delegate=self
        
        
        
    }
    //    //MARK: -  setup UICollectionViewCompositionalLayout
    //MARK: -  setup UICollectionViewCompositionalLayout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return nil }
            
            let section = self.sections[sectionIndex]
            switch section {
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

                
            case .interest:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .absolute(60))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryFooterItem()]
                section.supplementariesFollowContentInsets = false
                
                return section
                
                
            }
        }
    }
        func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        }
    func supplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
    }
    
}

extension EditHobbiesVC:UICollectionViewDelegate{}

extension EditHobbiesVC:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch sections[section]{

        case .talent:
         
            return hobbiesType == "talent" ? listTalent.count : listInterest.count
            
        case .interest: return 1
            
        default:return 0
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{

        case .talent :
            let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
            
            hobbiesType == "talent" ?  cell.setupCustomCell(hobbyTitle: listTalent[indexPath.row]): cell.setupCustomCell(hobbyTitle: listInterest[indexPath.row])
            cell.deleteItemBtn.isHidden=false
            cell.deleteItemBtn.tag=indexPath.row
            cell.deleteItemBtn.addTarget(self, action: #selector(deleteHobbiesItem), for: .touchUpInside)
            
            return cell
        case .interest:
            let cell :AddingItemCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.addBtn.tag = indexPath.row
            cell.addBtn.addTarget(self, action: #selector(AddHobbies), for: .touchUpInside)
            return cell
        default:return UICollectionViewCell()
            
        }
     
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return  CGSize(width:((self.view.frame.width / 4)-20), height: 100)
//    }


    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind{

        case UICollectionView.elementKindSectionHeader:

            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
            header.setup(sections[indexPath.section].title)
            header.viewAllButton.isHidden = true
            header.editBtn.isHidden = true
            header.headerTitleLabel.textAlignment = .left
            header.headerTitleLabel.textColor = .black
            header.headerTitleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
            if hobbiesType == "talent"{
                header.headerTitleLabel.text = "Talent"
            }else{
                header.headerTitleLabel.text = "Interest"
            }
            
            return header

        case UICollectionView.elementKindSectionFooter:
    
         footer2 = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ButtonActionFooterCollectionview.footerIdentifier, for: indexPath) as! ButtonActionFooterCollectionview
            footer2.saveBtn.addTarget(self, action: #selector(updateHobbies), for: .touchUpInside)
            return footer2
  
        default:

            return UICollectionReusableView()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 80)
    }
    
    }


extension EditHobbiesVC {
    
    @objc func AddHobbies(sender:UIButton){
        let indexPath = NSIndexPath(row: sender.tag, section: 1)
        let cell:AddingItemCell = hobbiesCollectionview.cellForItem(at: indexPath as IndexPath) as! AddingItemCell
        
        if cell.hobbiesTxtField.text != "" {
            if hobbiesType == "talent" {
                listTalent.append(cell.hobbiesTxtField.text!)
                cell.hobbiesTxtField.text = ""
            }else{
                listInterest.append(cell.hobbiesTxtField.text!)
                cell.hobbiesTxtField.text = ""

            }
            hobbiesCollectionview.reloadData()

        }
    }
    
    @objc func deleteHobbiesItem(sender:UIButton){
        let indexPath = NSIndexPath(row: sender.tag, section: 0)
        let cell:HobbiesCell = hobbiesCollectionview.cellForItem(at: indexPath as IndexPath) as! HobbiesCell
        if cell.hobbiesTitle.text != ""{

            if hobbiesType == "talent" {
                listTalent.remove(at: indexPath.row)
                hobbiesCollectionview.reloadData()
            }else{
                listInterest.remove(at: indexPath.row)
                hobbiesCollectionview.reloadData()
            }
        }
    }
    
    @objc func updateHobbies(){
        if hobbiesType == "talent" {
            
            listTalent.count != 0  ? presenter.updateTalent(talent: listTalent) : Alert.showErrorAlert(message:"please select your Talent ")
            self.dismiss(animated: true) {
                if let _delegate = self.onSheetDissmissed{
                    _delegate.getHobbiesData(hobbies: self.listTalent, hobbiesType: "talent")
                }
            }
          

        } else {
            listInterest.count != 0  ? presenter.updateIntrest(intrest: listInterest) : Alert.showErrorAlert(message:"please select your Intrest ")
            self.dismiss(animated: true) {
                if let _delegate = self.onSheetDissmissed{
                    _delegate.getHobbiesData(hobbies: self.listInterest, hobbiesType: "interest")
                }
            }
        }
    }
}
