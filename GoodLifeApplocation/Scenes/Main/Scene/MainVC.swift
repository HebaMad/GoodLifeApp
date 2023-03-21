//
//  MainVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/03/2023.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var HomeCollectionview: UICollectionView!
    
    //MARK: - Properties
    
    private let sections = MainCategoriesModel.shared.AllCategories
    var categories:[mainType]=[]
    var opportunities:[opportunitiesData]=[]
    var sliders:[sliderData]=[]
    let presenter=HomePresenter()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupCollectionview()
    }
    
    
    private func setupCollectionview(){
        presenter.getMainScreenData()
        presenter.delegate=self
        HomeCollectionview.register(OpportunitiesCollectionCell.self)
        HomeCollectionview.register(CategoryCell.self)
        HomeCollectionview.register(BannerCell.self)
        HomeCollectionview.register(MapCell.self)
        HomeCollectionview.register(CreateOpportunitiesCell.self)
        
        HomeCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        HomeCollectionview.collectionViewLayout = createCompositionalLayout()
        HomeCollectionview.dataSource=self
        HomeCollectionview.delegate=self
        
    }
    
}
extension MainVC{
    @objc func viewAllButton(_ sender:UIButton){
        
        switch sections[sender.tag]{
            
            
        case .Categories:
            let vc = CategoriesVC()
            vc.categories=categories
            navigationController?.pushViewController(vc, animated: true)
        case .Banner:
            print("No Actions")
        case .Map:
            print("No Actions")
            
        case .Opportunities:
            let vc = OpportunityListVC.instantiate()
            vc.hidesBottomBarWhenPushed = false
            navigationController?.pushViewController(vc, animated: true)
            
        }
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
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(110))
                
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
        case .Opportunities:return (opportunities.count)+1
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

            return cell
        case .Banner:
            let cell:BannerCell=collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(data: sliders[indexPath.row])
            return cell
        case .Opportunities:
            if indexPath.row == opportunities.count{
                let cell :CreateOpportunitiesCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.createOpportunitiesBtn.tag=indexPath.row
                return cell
            }else{
                
                let cell:OpportunitiesCollectionCell=collectionView.dequeueReusableCell(for: indexPath)
                cell.configureCell(data: opportunities[indexPath.row])
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
extension MainVC:HomeDelegate{
    func showAlerts(title: String, message: String) { }
    
    func getCategories(categories: Home) {}
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {}
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) {}
    
    func getCategoriesFiltered(categories: Home) {}
    
    func getOppourtinity(categories: Oppourtinity) { }
    
    func getOppourtinityDetails(categories: OppourtinityDetails) {}
    
    func getMainScreenData(data: MainScreenData) {
        categories=data.categories ?? []
        sliders=data.sliders ?? []
        opportunities=data.opportunities ?? []
        HomeCollectionview.reloadData()
    }
    
    
}