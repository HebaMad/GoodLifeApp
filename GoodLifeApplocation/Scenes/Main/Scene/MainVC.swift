//
//  MainVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/03/2023.
//

import UIKit
import SideMenu

class MainVC: UIViewController {
    
    @IBOutlet weak var HomeCollectionview: UICollectionView!
    
    //MARK: - Properties
    
    private let sections = MainCategoriesModel.shared.AllCategories
    var categories:[mainType]=[]
    var allOpportunities:[opportunitiesData]=[]
    var sliders:[sliderData]=[]
    let presenter=MainPresenter()
    private var menu :SideMenuNavigationController?
    var opportuntites:[opportunitiesData]=[]
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupCollectionview()
        setUpSideMenu()
        changeSideMenuSide()
    }
    
    
    @IBAction func menuBtn(_ sender: Any) {
        
        present(menu!, animated: true, completion: nil)
        
    }
    
    @IBAction func notificationBtn(_ sender:Any){
        let vc = NotificationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupCollectionview(){
        
        self.showLoading()
        presenter.getMainScreenData(search: "")
        presenter.delegate=self
        HomeCollectionview.register(SubscriptionCollectionViewCell.self)
        HomeCollectionview.register(CategoryCell.self)
        HomeCollectionview.register(BannerCell.self)
        HomeCollectionview.register(MapCell.self)
        HomeCollectionview.register(CreateOpportunitiesCell.self)
        
        HomeCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        HomeCollectionview.collectionViewLayout = createCompositionalLayout()
        HomeCollectionview.dataSource=self
        HomeCollectionview.delegate=self
        presenter.mapScreenData(fundTypeId:"", mainCategoryId: "", subCategoryId: "", interest: "")
        presenter.delegate=self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showLoading()
        presenter.getMainScreenData(search: "")
        presenter.delegate=self
    }
    
}


extension MainVC {
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
    
    
    @objc func  AddOpportunitiesForm(_ sender:UIButton){
        let vc = CreateOppourtinityVC.instantiate()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func moreDetailsBtnTapped(_ sender:UIButton){
        //      print(allOpportunities[sender.tag].id!)
        print([sender.tag])
        print(allOpportunities)
        print(allOpportunities[sender.tag].id ?? 0)
        
        presenter.getOpportunitiesDetails(opportunitiesId: String(describing: allOpportunities[sender.tag].id ?? 0))
        presenter.delegate=self
        
        
    }
    
}
extension MainVC {
    @objc func viewAllButton(_ sender:UIButton){
        
        switch sections[sender.tag] {
            
        case .Categories:
            
            let vc = CategoriesVC()
            vc.categories=categories
            navigationController?.pushViewController(vc, animated: true)
            
        case .Banner:
            
            print("No Actions")
            
        case .Map:
            
            print("")
        case .Opportunities:
            print("")
            let vc = AllOpportunitiesVC()
            vc.allOpportunities=allOpportunities
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func exploreMapBtn () {
        let vc = ExploreMapVC.instantiate()
        print(opportuntites)
        vc.categories=categories
        vc.opportuntites=opportuntites
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension MainVC {
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else {return nil}
            let section = self.sections[sectionIndex]
            switch section{
                
            case .Categories:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(90))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .Map:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .absolute(140))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.supplementariesFollowContentInsets = false
                return section
            case .Banner:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .absolute(140))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.supplementariesFollowContentInsets = false
                
                return section
            case .Opportunities:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(200))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.5))
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
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

extension MainVC:UICollectionViewDelegate{}
extension MainVC:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sections[section]{
            
        case .Categories:return categories.count
        case .Map:return 1
        case .Banner:return sliders.count
        case .Opportunities:return (allOpportunities.count)+1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section]{
        case .Categories:
            let cell:CategoryCell=collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(data: categories[indexPath.row])
            return cell
        case .Map:
            let cell:MapCell=collectionView.dequeueReusableCell(for: indexPath)
            cell.exploreOpportunitiesBtn.tag=indexPath.row
            cell.exploreOpportunitiesBtn.addTarget(self, action: #selector(exploreMapBtn), for: .touchUpInside)
            return cell
        case .Banner:
            let cell:BannerCell=collectionView.dequeueReusableCell(for: indexPath)
            cell.pageControlView.currentPage=indexPath.row
            cell.pageControlView.numberOfPages=sliders.count
            cell.configureCell(data: sliders[indexPath.row])
            return cell
        case .Opportunities:
            
            if indexPath.row == allOpportunities.count{
                
                let cell :CreateOpportunitiesCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.createOpportunitiesBtn.tag=indexPath.row
                cell.createOpportunitiesBtn.addTarget(self, action: #selector(AddOpportunitiesForm), for: .touchUpInside)
                
                return cell
                
            }else{
                
                let cell:SubscriptionCollectionViewCell=collectionView.dequeueReusableCell(for: indexPath)
                cell.configureCell(viewModel: allOpportunities[indexPath.row])
                cell.nextBtn.tag=indexPath.row
                cell.nextBtn.addTarget(self, action: #selector(moreDetailsBtnTapped), for: .touchUpInside)
                return cell
                
            }
            
        }
    }
    
    
}

extension MainVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.viewAllButton.addTarget(self, action: #selector(viewAllButton), for: .touchUpInside)
        header.viewAllButton.tag = indexPath.section
        header.editView.isHidden=true
        
        header.setup(sections[indexPath.section].title)
        return header
    }
    
}
extension MainVC:MainDelegate{
    func opportunitiesFullDetails(data: OpportunityData) {}
    
    func opportunitiesDetails(data: opportunitiesDetails) {
        let vc = MainOpportuntiesTab.instantiate()
        print(data)
        vc.opportunityDetails=data
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func getExploreMapData(data: ExploreMap) {
        opportuntites=data.opportunities ?? []
        self.hideLoading()
        
    }
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) { }
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) { }
    
    func getOpportunitiesData(data: ListOpportunities) {}
    
    func showAlerts(title: String, message: String) { }
    
    
    
    func getMainScreenData(data: MainScreenData) {
        categories=data.categories ?? []
        sliders=data.sliders ?? []
        allOpportunities=data.opportunities ?? []
        self.hideLoading()
        
        HomeCollectionview.reloadData()
    }
}
