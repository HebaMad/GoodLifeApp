//
//  MapVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import UIKit
import SideMenu
import SkeletonView
import FittedSheets

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
    let presenter = HomePresenter()
    var recentlyViewed:[mainType]=[]
    var recommendedMinistries:[mainType]=[]
    var generalFiltering:[MainCategories]=[]
    var specificFiltering:[MainCategories]=[]
    var categoriesFiltered:[mainType]=[]

    
    var categoryMainId = 0
    private var isSkeleton: Bool = true {
        didSet {
            self.communityCollectionview.reloadData()
        }
    }

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        specificFilterCollectionview.isHidden = true
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

        setupData()
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


//MARK: - setupData
private extension MapVC {
    
    func setupData(){
        
        self.isSkeleton = true
        presenter.getCategoriesData(searchTxt: "")
        presenter.delegate = self

        presenter.mainStandardFilter()
        presenter.delegate = self
        
        presenter.subStandardFilter()
        presenter.delegate = self

        
    }
    
    
    
    @objc func generalFilterPressed(_ sender:UIButton){
        specificFilterCollectionview.isHidden = false
        categoryMainId = generalFiltering[sender.tag].id ?? 0
//        self.presenter.markMyTask(taskid: myCurrentTask[sender.tag].id ?? 0)
//        self.elementCollectionView.reloadData()
        
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
            
            return generalFiltering.count
            
        } else if collectionView == communityCollectionview{
            
            switch sections[section]{
            case .recentlyViewed:return self.isSkeleton ? 3 :  recentlyViewed.count
            case .recommendedMinistries:return self.isSkeleton ? 3 : recommendedMinistries.count
            }
                
           
        }else{
            return specificFiltering.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == generalFilterCollectionview{
            let cell :FilterCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(category: generalFiltering[indexPath.row])
            cell.categoriesFilterBtn.addTarget(self, action: #selector(generalFilterPressed), for: .touchUpInside)
            cell.categoriesFilterBtn.tag=indexPath.row

            return cell
            
            
        }else if collectionView == communityCollectionview{
   
            switch sections[indexPath.section] {
            case .recentlyViewed:
                
                let cell:ActivityCell = collectionView.dequeueReusableCell(for: indexPath)
                guard !self.isSkeleton else {
                    cell.startSkeleton()
                    return cell
                }
                cell.stopSkeleton()
                
                cell.setup(recentlyViewed[indexPath.row])
                return cell
            case .recommendedMinistries:
                let cell:ActivityCell = collectionView.dequeueReusableCell(for: indexPath)
                guard !self.isSkeleton else {
                    cell.startSkeleton()
                    return cell
                }
                cell.stopSkeleton()
                
                cell.setup(recommendedMinistries[indexPath.row])
                return cell
            }
            
            
        }else {
            let cell :SpecificFilterCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.setupCell(icon: specificFiltering[indexPath.row].icon ?? "", title: specificFiltering[indexPath.row].name ?? "")
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == generalFilterCollectionview{


        }else if collectionView == specificFilterCollectionview{
            self.presenter.categriesFailtered(mainCategoriesID: "\(categoryMainId)", subCategoriesID: "\(specificFiltering[indexPath.row].id ?? 0)")
            self.presenter.delegate = self
//            let controller = choosingMinistryNeedsVC()
//            let sheetController = SheetViewController(
//                controller: controller,
//                sizes: [ .intrinsic , .percent(0.80), .fixed(600), .intrinsic])
//            self.present(sheetController, animated: false, completion: nil)
            
        }else{
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

extension MapVC :HomeDelegate{
    func getCategoriesFiltered(categories: CategoriesFiltering) {
        categoriesFiltered = categories.main_needs_types ?? []
    }
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) {
        specificFiltering = categories.data ?? []
        specificFilterCollectionview.reloadData()
    }
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {
        generalFiltering = categories.data ?? []
        print(generalFiltering)
        generalFilterCollectionview.reloadData()
    }
    
    func showAlerts(title: String, message: String) {
         
    }
    
    func getCategories(categories: Home) {
        self.isSkeleton = false

        recentlyViewed = categories.recentlyViewed ?? []
        recommendedMinistries = categories.recommendedMinistries ?? []
        communityCollectionview.reloadData()
        
    }
    
    
}
