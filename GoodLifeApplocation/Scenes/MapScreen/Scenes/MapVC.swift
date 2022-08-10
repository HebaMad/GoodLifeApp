//
//  MapVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit
import SideMenu
class MapVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var communityCollectionview: UICollectionView!
    @IBOutlet weak var generalFilterCollectionview: UICollectionView!
    @IBOutlet weak var specificFilterCollectionview: UICollectionView!
    @IBOutlet weak var menuBtn: UIButton!
    
    
    
    //MARK: - properties
    private let sections = MapFilterList.shared.AllCategories

    private var menu :SideMenuNavigationController?
    private var categories=["Poverty","Orphans","Widows","Neighbor"]

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSideMenu()
        setupCollectionview()
        menuBtnBinding()

    }
    override func viewWillAppear(_ animated: Bool) {
        changeSideMenuSide()

    }
    
    //MARK: - SETUP side menu

    private func changeSideMenuSide(){
       
               menu?.leftSide = true
               SideMenuManager.default.rightMenuNavigationController = nil
               SideMenuManager.default.leftMenuNavigationController = menu
        
    }
    
    private func setUpSideMenu() {
            let vc = OpportunityViewVC()
            menu = SideMenuNavigationController(rootViewController: vc)
            menu?.setNavigationBarHidden(true, animated: false)
            menu?.presentationStyle = .menuSlideIn
            menu?.presentationStyle.onTopShadowColor = .black
            menu?.presentationStyle.onTopShadowRadius = 0
            menu?.presentationStyle.onTopShadowOffset = .zero
            menu?.presentationStyle.onTopShadowOpacity = 0
        menu?.presentationStyle.presentingScaleFactor = 0.99
        menu?.menuWidth = 280

            SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        }

    //MARK: - SETUP Collection
    private func setupCollectionview(){
        generalFilterCollectionview.register(FilterCell.self)
        generalFilterCollectionview.delegate = self
        generalFilterCollectionview.dataSource = self

        specificFilterCollectionview.register(SpecificFilterCell.self)
        specificFilterCollectionview.delegate = self
        specificFilterCollectionview.dataSource = self
        
        communityCollectionview.register(ActivityCell.self)
        communityCollectionview.register(UINib(nibName:"FilterHeaderReusableview", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: FilterHeaderReusableview.headerIdentifier)
        communityCollectionview.collectionViewLayout = createCompositionalLayout()
        communityCollectionview.dataSource=self
        communityCollectionview.delegate=self

        communityCollectionview.reloadData()

    }
    //MARK: - compositional layout creation

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .recentlyViewed:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
//                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .recommendedMinistries:
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
               
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


//MARK: - Binding

private extension MapVC{
    
    func menuBtnBinding(){
        menuBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
}

//MARK: - Action
private extension MapVC{
    @objc func buttonWasTapped(){
        present(menu!, animated: true, completion: nil)

    }
}
//MARK: - delegate & datasource confirmation

extension MapVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == communityCollectionview{
            return sections.count
        }else{
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if collectionView == generalFilterCollectionview{
            
            return 5
            
        } else if collectionView == communityCollectionview{
                
            return sections[section].count
        }else{
            return 4
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == generalFilterCollectionview{
            let cell :FilterCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        }else if collectionView == communityCollectionview{
            switch sections[indexPath.section] {
            case .recentlyViewed(let items):
                
                let cell:ActivityCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.setup(items[indexPath.row])
                return cell
            case .recommendedMinistries(let items ):
                let cell:ActivityCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.setup(items[indexPath.row])
                return cell
            }
        }else {
            let cell :SpecificFilterCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.setupCell(icon: categories[indexPath.row])
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == generalFilterCollectionview{
            return  CGSize(width:((self.view.frame.width/5)-12), height: 45)


        }else if collectionView == specificFilterCollectionview{
            return  CGSize(width:((self.view.frame.width / 4)-12), height:66)
        }else{
            return  CGSize(width:(self.view.frame.width), height:30)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FilterHeaderReusableview.headerIdentifier, for: indexPath) as! FilterHeaderReusableview
        header.setup(sections[indexPath.section].title)
        return header
    }
    
}
