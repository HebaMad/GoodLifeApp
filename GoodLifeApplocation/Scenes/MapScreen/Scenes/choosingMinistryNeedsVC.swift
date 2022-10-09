//
//  choosingMinistryNeedsVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 20/08/2022.
//

import UIKit

class choosingMinistryNeedsVC: UIViewController {

    //MARK: - Outlet
    
    @IBOutlet weak var socialCommitmentsBtn: UIButtonDesignable!
    @IBOutlet weak var lifeBtn: UIButtonDesignable!
    @IBOutlet weak var movementLifeBtn: UIButtonDesignable!
    @IBOutlet weak var MinistrySubscriptionCollectionview: UICollectionView!
    @IBOutlet weak var smartRecommendationTxt: UILabel!
    @IBOutlet weak var recommendationView: UIStackView!
    
    //MARK: - Properties
    
    var interest = 0
    var needTypeID = 0
    let presenter = HomePresenter()
    var oppourtinity:[OppourtinityDetails] = []
    var model:[SubscriptionCollectionViewCell.ViewModel]?
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMinistryCollectionview()
    }

    //MARK: - SetupCollectionview

    private func setupMinistryCollectionview(){
        bindBackButton()
        MinistrySubscriptionCollectionview.register(SubscriptionCollectionViewCell.self)
        MinistrySubscriptionCollectionview.delegate=self
        MinistrySubscriptionCollectionview.dataSource=self

    }
    
    @objc func ministrySubscriptionDetails( _ sender:UIButton){
        presenter.oppourtinityDetails(opportunityID: oppourtinity[sender.tag].id ?? 0)
        presenter.delegate=self

    }

}

     //MARK: - Binding

private extension choosingMinistryNeedsVC {
    
    func bindBackButton(){
        socialCommitmentsBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        lifeBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        movementLifeBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)

    }
}
    //MARK: - PrivateHandler

private extension choosingMinistryNeedsVC{

    @objc func buttonWasTapped( _ sender:UIButton){
       
        switch sender{
            
        case socialCommitmentsBtn:
            
            recommendationView.isHidden = false
            interest = 3
            presenter.getSmartRecommendation(interestId: interest, needTypeId: 5)
            presenter.delegate = self
            
        case lifeBtn:
         
            recommendationView.isHidden = false
            interest = 2
            presenter.getSmartRecommendation(interestId: interest, needTypeId: 5)
            presenter.delegate = self

        case movementLifeBtn:
            
            recommendationView.isHidden = false
            interest = 1
            presenter.getSmartRecommendation(interestId: interest, needTypeId: 5)
            presenter.delegate = self

        default:
            print("")
        }
}
}


      //MARK: - conform to UICollectionViewDelegate protocol

extension choosingMinistryNeedsVC:UICollectionViewDelegate{}


     //MARK: - conform to UICollectionViewDataSource protocol
 
extension choosingMinistryNeedsVC:UICollectionViewDataSource{
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return 3
//        return oppourtinity.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SubscriptionCollectionViewCell=collectionView.dequeueReusableCell(for: indexPath)
//        model=SubscriptionCollectionViewCell.ViewModel(title: oppourtinity[indexPath.row].title ?? "", subTitleTxt: oppourtinity[indexPath.row].sub_title ?? "", financialModelTxt: oppourtinity[indexPath.row].models ?? "", businessPlanTxt: oppourtinity[indexPath.row].plans ?? "", websiteTxt: oppourtinity[indexPath.row].websites ?? "", matchesPercentageTxt: oppourtinity[indexPath.row].opportunity_match ?? 0 , review: oppourtinity[indexPath.row].reviews_count ?? 0 )
//        print()
//        cell.configureCell(viewModel: model!)
//        cell.configureCell(viewModel: oppourtinity[indexPath.row])
        
        cell.tag=indexPath.row
        cell.nextBtn.addTarget(self, action: #selector(ministrySubscriptionDetails), for: .touchUpInside)
        return cell
    }
}
      //MARK: - conform to UICollectionViewDelegateFlowLayout protocol

    extension choosingMinistryNeedsVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.view.frame.width - 20)/2.5, height: 380)
        
    }
}


//MARK: - conform to HomeDelegate protocol

extension choosingMinistryNeedsVC:HomeDelegate{
    func getOppourtinityDetails(categories: packageDetails) {
        let vc = PackageDetailsVC()
        vc.oppourtinityDetails = categories
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAlerts(title: String, message: String) {}
    
    func getCategories(categories: Home) {}
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {}
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) {}
    
    func getCategoriesFiltered(categories: CategoriesFiltering) {}
    
    func getOppourtinity(categories: Oppourtinity) {
        
        oppourtinity = categories.items ?? []
        MinistrySubscriptionCollectionview.reloadData()
       
    }
    
    
}



