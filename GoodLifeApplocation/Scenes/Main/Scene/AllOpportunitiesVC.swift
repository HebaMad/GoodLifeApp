//
//  AllOpportunities.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 14/05/2023.
//

import UIKit

class AllOpportunitiesVC: UIViewController {

    @IBOutlet weak var opportunitiesCollectionview: UICollectionView!
    @IBOutlet weak var searchview: SearchView!
    
    let presenter=MainPresenter()
    var allOpportunities:[opportunitiesData]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchProperties()
        setupCollectionview()
    }

    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupCollectionview(){
        
        opportunitiesCollectionview.register(SubscriptionCollectionViewCell.self)
        opportunitiesCollectionview.collectionViewLayout = createCompositionalLayout()
        opportunitiesCollectionview.delegate=self
        opportunitiesCollectionview.dataSource=self
    }
    
    

}

extension AllOpportunitiesVC{
    func  setupSearchProperties(){
        searchview.btnSearch.addTarget(self, action: #selector(searchActioon), for: .touchUpInside)

        searchview.startHandler {
     }

        searchview.endEditingHandler {
            self.opportunitiesSearch()
     }

     }
     
     @objc func searchActioon(_ sender : UIButton ) {
         opportunitiesSearch()
      
 }
    
    func opportunitiesSearch(){
        if (self.searchview.txtSearch.text)?.count != 0 {
            presenter.getMainScreenData(search:  self.searchview.txtSearch.text ?? "")
            presenter.delegate=self

        }else{
            presenter.getMainScreenData(search:  "")
            presenter.delegate=self


        }
    }
}


extension AllOpportunitiesVC{
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else {return nil}
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(200))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            //            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
//            section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
            section.supplementariesFollowContentInsets = false
            return section
        }
        
    }
    
    @objc func moreDetailsBtnTapped(_ sender:UIButton){
        presenter.getOpportunitiesDetails(opportunitiesId: String(describing: allOpportunities[sender.tag].id ?? 0))
        presenter.delegate=self
        
    }
}

extension AllOpportunitiesVC:UICollectionViewDelegate{}
extension AllOpportunitiesVC:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allOpportunities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SubscriptionCollectionViewCell=collectionView.dequeueReusableCell(for: indexPath)
        cell.configureCell(viewModel: allOpportunities[indexPath.row])
        cell.nextBtn.tag=indexPath.row
        cell.nextBtn.addTarget(self, action: #selector(moreDetailsBtnTapped), for: .touchUpInside)
        return cell
    }
    
    
    
}


extension AllOpportunitiesVC:MainDelegate{
    
    func showAlerts(title: String, message: String) {}
    
    func getMainScreenData(data: MainScreenData) {

        allOpportunities=data.opportunities ?? []
        opportunitiesCollectionview.reloadData()
    }
    
    func getOpportunitiesData(data: ListOpportunities) {}
    
    func opportunitiesFullDetails(data: OpportunityData) {}

    func getStandardCategoriesFiltering(categories: MainHomeCategories) {}
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) {}
    
    func getExploreMapData(data: ExploreMap) { }
    
    func opportunitiesDetails(data: opportunitiesDetails) {
        let vc = MainOpportuntiesTab.instantiate()
        vc.opportunityDetails=data
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}


