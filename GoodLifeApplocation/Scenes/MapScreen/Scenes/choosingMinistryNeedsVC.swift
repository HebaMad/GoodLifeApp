//
//  choosingMinistryNeedsVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 20/08/2022.
//

import UIKit
import FittedSheets

protocol DataFiltered {
    func filteredData(data:Oppourtinity)
    
}
class choosingMinistryNeedsVC: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var typeTitle: UILabel!
    @IBOutlet weak var socialCommitmentsBtn: UIButtonDesignable!
    @IBOutlet weak var lifeBtn: UIButtonDesignable!
    @IBOutlet weak var movementLifeBtn: UIButtonDesignable!
    @IBOutlet weak var MinistrySubscriptionCollectionview: UICollectionView!
    @IBOutlet weak var smartRecommendationTxt: UILabel!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var recommendationView: UIStackView!
    
    //MARK: - Properties
    
    var interest = 0
    var needTypeID = 0
    let presenter = HomePresenter()
    var oppourtinity:[OppourtinityDetails] = []
    var model:[SubscriptionCollectionViewCell.ViewModel]?
    var onFilterDissmissed : OnFilterDissmissed?
    var categoryName=""
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeTitle.text=categoryName
        setupMinistryCollectionview()
    }
    
    //MARK: - SetupCollectionview
    
    private func setupMinistryCollectionview(){
        bindBackButton()
        MinistrySubscriptionCollectionview.register(SubscriptionCollectionViewCell.self)
        
        
    }
    
    @objc func ministrySubscriptionDetails( _ sender:UIButton){
        print(oppourtinity[sender.tag].id ?? 0)
        presenter.oppourtinityDetails(opportunityID: oppourtinity[sender.tag].id ?? 0)
        presenter.delegate=self
        
        
    }}

//MARK: - Binding

private extension choosingMinistryNeedsVC {
    func bindBackButton(){
        socialCommitmentsBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchDown)
        lifeBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchDown)
        movementLifeBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchDown)
        filterBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        socialCommitmentsBtn.setTitleColor(.black, for: .normal)
        lifeBtn.setTitleColor(.black, for: .normal)
        movementLifeBtn.setTitleColor(.black, for: .normal)
        
    }
}


//MARK: - PrivateHandler

private extension choosingMinistryNeedsVC {
    
    @objc func buttonWasTapped( _ sender:UIButton){
        sender.setTitleColor(UIColor(named: "BgColor"), for: .selected)
        sender.layer.borderWidth = sender.isSelected ? 1 : 0
        sender.layer.borderColor = UIColor(named: "BgColor")?.cgColor
        
        switch sender{
            
        case socialCommitmentsBtn:
            
            recommendationView.isHidden = false
            interest = 3
            presenter.getSmartRecommendation(interestId: interest, needTypeId: needTypeID)
            presenter.delegate = self
            sender.tintColor = sender.backgroundColor
            
            sender.isSelected = true
            
            // reset other button colors and borders
            lifeBtn.isSelected = false
            
            movementLifeBtn.isSelected = false
            
        case lifeBtn:
            
            recommendationView.isHidden = false
            interest = 2
            print( UserDefaults.standard.integer(forKey: "id"))
            presenter.getSmartRecommendation(interestId: interest, needTypeId: needTypeID)
            presenter.delegate = self
            sender.tintColor = sender.backgroundColor
            
            sender.isSelected = true
            
            // reset other button colors and borders
            socialCommitmentsBtn.isSelected = false
            
            movementLifeBtn.isSelected = false
            
        case movementLifeBtn:
            
            recommendationView.isHidden = false
            interest = 1
            presenter.getSmartRecommendation(interestId: interest, needTypeId: UserDefaults.standard.integer(forKey: "id"))
            presenter.delegate = self
            sender.tintColor = sender.backgroundColor
            
            sender.isSelected = true
            // reset other button colors and borders
            socialCommitmentsBtn.isSelected = false
            lifeBtn.isSelected = false
            
            
        case filterBtn:
            
            let vc = FilterVC()
            vc.onFilterDissmissed = self
            self.present(vc, animated: false, completion: nil)
            
            
            
        default:
            break
        }
    }
}


//MARK: - conform to UICollectionViewDelegate protocol

extension choosingMinistryNeedsVC:UICollectionViewDelegate{}


//MARK: - conform to UICollectionViewDataSource protocol

extension choosingMinistryNeedsVC:UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return oppourtinity.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:SubscriptionCollectionViewCell=collectionView.dequeueReusableCell(for: indexPath)
        
        cell.configureCell(viewModel: oppourtinity[indexPath.row])
        
        //        cell.tag=indexPath.row
        //        cell.nextBtn.addTarget(self, action: #selector(ministrySubscriptionDetails), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(oppourtinity[indexPath.row].id ?? 0)
        presenter.oppourtinityDetails(opportunityID: oppourtinity[indexPath.row].id ?? 0)
        UserDefaults.standard.set(oppourtinity[indexPath.row].id, forKey: "oppourtinity")
        
        presenter.delegate=self
    }
}
//MARK: - conform to UICollectionViewDelegateFlowLayout protocol

extension choosingMinistryNeedsVC:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.view.frame.width - 10)/2.5, height: 220)
        
    }
}


//MARK: - conform to HomeDelegate protocol

extension choosingMinistryNeedsVC:HomeDelegate{
    
    func showAlerts(title: String, message: String) {}
    func getCategories(categories: Home) {}
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {}
    func getsubCategoriesFiltering(categories: SubHomeCategories) {}
    func getCategoriesFiltered(categories: Home) {}
    func getMainScreenData(data: MainScreenData) {}
    
    func getOppourtinityDetails(categories: OppourtinityDetails) {
        let data =  try! JSONEncoder().encode(categories)
        
        UserDefaults.standard.set(data, forKey:"oppourtinityID")
        
        self.dismiss(animated: true) {
            if let _delegate = self.onFilterDissmissed{
                print(categories)
                _delegate.filteredData(data:categories)
            }}
    }
    
    func getOppourtinity(categories: Oppourtinity) {
        print(categories.items ?? [])
        self.oppourtinity = categories.items ?? []
        self.MinistrySubscriptionCollectionview.reloadData()
        
    }
    
}

extension choosingMinistryNeedsVC:DataFiltered{
    
    func filteredData(data: Oppourtinity) {
        oppourtinity=data.items ?? []
        MinistrySubscriptionCollectionview.reloadData()
        
    }
}

