//
//  CategoriesVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 15/03/2023.
//

import UIKit

class CategoriesVC: UIViewController {
    //MARK: - outlet

    @IBOutlet weak var AddCategory: UIButton!
    @IBOutlet weak var categoriesCollectionview: UICollectionView!

    @IBOutlet weak var searchview: SearchView!
    
    //MARK: - Properties

    var categories:[mainType]=[]
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 2.0,left: 0.0,bottom: 2.0,right: 0.0)
    let presenter=OpportunitiesPresenter()

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
      }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindButtons()
        setupCollectionView()
        setupSearchProperties()
    }
    
    //MARK: - Binding

    func bindButtons(){
        AddCategory.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
    //MARK: - setup collectionview
    func setupCollectionView(){
        
        categoriesCollectionview.register(CategoryCell.self)
        
        categoriesCollectionview.collectionViewLayout = createCompositionalLayout()
        categoriesCollectionview.delegate=self
        categoriesCollectionview.dataSource=self
        
    }
    
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
            print("test")
            presenter.getFundType(search:  self.searchview.txtSearch.text ?? "")
            presenter.delegate=self

        }else{
            presenter.getFundType(search:  "")
            presenter.delegate=self


        }
    }
    

     

}


//MARK: - Private Handler

private extension CategoriesVC {
    
    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender {
   
        case AddCategory:
            let vc = AddFundTypes()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("error selection")
        }
    }
}
//MARK: - compsitional layout creation

extension CategoriesVC {
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else {return nil}
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(90))
            
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

    
}

//MARK: - confirm to UICollectionviewDelegate

extension CategoriesVC:UICollectionViewDelegate{}


//MARK: - confirm to UICollectionviewDataSource

extension CategoriesVC:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CategoryCell=collectionView.dequeueReusableCell(for: indexPath)
        cell.configureCell(data: categories[indexPath.row])
        cell.categoryTitle.font=UIFont.systemFont(ofSize: 11, weight: .medium)
        return cell
    }
}
//MARK: - confirm to UICollectionViewDelegateFlowLayout

extension CategoriesVC:UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 2)
        let availableWidth = view.frame.width - 16
        let widthPerItem = availableWidth / 2.2
        
        return CGSize(width: widthPerItem, height: 88)
    }
}

extension CategoriesVC:OpportunitiesDelegate{
    func showAlerts(title: String, message: String) {}
    
    func getFundTypeData(data: FundType) {
        print("3")
        categories=data.fund_types ?? []
        categoriesCollectionview.reloadData()
        
        
    }
    
    func getChannels(data: RecommendedChannel) { }
    
    
}

