//  ExploreMapVC.swift
//  GoodLifeApplocation
//  Created by heba isaa on 21/03/2023.

import UIKit
import FittedSheets
import MapKit

class ExploreMapVC: UIViewController {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var categoriesCollectionview: UICollectionView!
    @IBOutlet weak var generalFilterCollectionview: UICollectionView!
    @IBOutlet weak var specificFilterCollectionview: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    
    var categories:[mainType]=[]
    var needTypeID=0
    var categoriesName = ""
    let presenter=MainPresenter()
    var categoryMainId = 0

    var generalFiltering:[MainCategories]=[]
    var specificFiltering:[MainCategories]=[]
    var opportuntites:[opportunitiesData]=[]
    var generalFilteringId=0
    var specificFilteringId=0
    var latitude:Double = UserDefaults.standard.double(forKey: "lat")
    var longitude:Double = UserDefaults.standard.double(forKey: "long")
    var city = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(categories)
        setupCollectionview()
    }
    
    func setupCollectionview(){
        categoriesCollectionview.register(HobbiesCell.self)
        categoriesCollectionview.collectionViewLayout = createCompositionalLayout()
        categoriesCollectionview.delegate=self
        categoriesCollectionview.dataSource=self
        
        generalFilterCollectionview.register(FilterCell.self)
        generalFilterCollectionview.delegate = self
        generalFilterCollectionview.dataSource = self
        
        specificFilterCollectionview.register(FilterCell.self)
        specificFilterCollectionview.delegate = self
        specificFilterCollectionview.dataSource = self
       
    }
    
    func getCategoryData(){
        
        presenter.mainStandardFilter()
        presenter.delegate = self
        
        presenter.subStandardFilter()
        presenter.delegate = self
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SelectionMenuBtn(_ sender: Any) {
        let controller = choosingMinistryNeedsVC()
        controller.categoryName=categoriesLabel.text ?? ""
        controller.needTypeID=needTypeID
        controller.generalFilteringId=generalFilteringId
        controller.specificFilteringId=specificFilteringId
        let sheetController = SheetViewController(
            
            controller: controller,
            // sizes: [ .intrinsic , .percent(0.80), .fixed(600), .intrinsic])
            sizes: [ .marginFromTop(520), .percent(0.7), .intrinsic])
        //          controller.onFilterDissmissed = self
        
        self.present(sheetController, animated: false, completion: nil)
    }
    
    @objc func generalFilterPressed(_ sender:UIButton){
        specificFilterCollectionview.isHidden = false
        categoryMainId = generalFiltering[sender.tag].id ?? 0
        
    }
    
    @objc func specificFilterPressed(_ sender:UIButton){
       
        
    }
    
    
    func setupMap(){

        
        mapView.delegate=self
                LocationManager.shared.getLocation { [self] location, error in
                let center = CLLocationCoordinate2DMake((location?.coordinate.latitude) ?? latitude , (location?.coordinate.longitude) ?? longitude)
                    latitude=location?.coordinate.latitude ?? 0.0
                    longitude=location?.coordinate.longitude ?? 0.0
                UserDefaults.standard.set(location?.coordinate.latitude,forKey: "lat")
                UserDefaults.standard.set(location?.coordinate.longitude,forKey: "long")
                    LocationManager.shared.getAddressFromLatLon(pdblLatitude: "\(self.latitude)", withLongitude: "\(self.longitude)") { status, mapaddress, mapcountry in
                     
                        self.city = mapcountry ?? ""

                    }
                
                    
                let span = MKCoordinateSpan(latitudeDelta:20, longitudeDelta: 20)
                let region = MKCoordinateRegion(center: center, span: span)
                self.mapView.region = region
            }
//                specificFilterCollectionview.isHidden = true

    }
    
}

extension ExploreMapVC{
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment in
            //            guard let self = self  else {return nil}
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .absolute(50))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98), heightDimension: .estimated(1))
            
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            
            section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
            
            section.supplementariesFollowContentInsets = false
            return section
        }
    }
    
    
    
    
}
extension ExploreMapVC:Storyboarded{
    
    static var storyboardName: StoryboardName = .main
    
}

extension ExploreMapVC:UICollectionViewDelegate{}
extension ExploreMapVC:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == generalFilterCollectionview{
            
            return generalFiltering.count
            
        } else if collectionView == specificFilterCollectionview {
            
            return specificFiltering.count
            
        }else{
            return categories.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == generalFilterCollectionview{
            let cell :FilterCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(category: generalFiltering[indexPath.row])
            cell.categoriesFilterBtn.addTarget(self, action: #selector(generalFilterPressed), for: .touchUpInside)
            cell.categoriesFilterBtn.tag=indexPath.row
            
            return cell
            
            
        }else if collectionView == specificFilterCollectionview{
            let cell :FilterCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.configureCell(category: specificFiltering[indexPath.row])
            cell.categoriesFilterBtn.addTarget(self, action: #selector(specificFilterPressed), for: .touchUpInside)
            cell.categoriesFilterBtn.tag=indexPath.row
            return cell
        }else{
            
            let cell:HobbiesCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.deleteItemBtn.isHidden=true
            cell.hobbyView.backgroundColor = .white
            cell.hobbiesTitle.text = categories[indexPath.row].name
            cell.hobbyView.layer.cornerRadius = 0
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionview {
            
            let cell = collectionView.cellForItem(at: indexPath) as! HobbiesCell
            cell.hobbyView.layer.borderColor = UIColor(named: "BgColor")?.cgColor
            cell.hobbiesTitle.textColor = UIColor(named: "BgColor")
            presenter.mapScreenData(fundTypeId: "\(categories[indexPath.row].id ?? 0)", mainCategoryId: "", subCategoryId: "", interest: "")
            presenter.delegate=self
            categoriesLabel.text = categories[indexPath.row].name
            needTypeID=categories[indexPath.row].id ?? 0
            
        }else if collectionView == generalFilterCollectionview {
            
            generalFilteringId=generalFiltering[indexPath.row].id ?? 0
            presenter.mapScreenData(fundTypeId: "", mainCategoryId: String(describing:generalFilteringId), subCategoryId:"", interest: "")
            presenter.delegate=self
            
        }else{
            
            specificFilteringId=specificFiltering[indexPath.row].id ?? 0
            presenter.mapScreenData(fundTypeId: "", mainCategoryId: String(describing:generalFilteringId), subCategoryId: String(describing: specificFilteringId), interest: "")
            presenter.delegate=self
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! HobbiesCell
        cell.hobbyView.layer.borderColor = UIColor.clear.cgColor
        cell.hobbiesTitle.textColor = .black
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == generalFilterCollectionview{
//            return  CGSize(width:((self.view.frame.width/5)-12), height: 45)
//
//
//        }else if collectionView == specificFilterCollectionview{
//            return  CGSize(width:((self.view.frame.width / 4)-12), height:66)
//        }else{
//            return CGSize()
//        }
//
//    }
}




extension ExploreMapVC:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation!.title!!)
//        getAnnotationId(title:view.annotation!.title!!)
        let controller = choosingMinistryNeedsVC()
        controller.needTypeID = categoryMainId
        
        let sheetController = SheetViewController(
            controller: controller,
            //                sizes: [ .intrinsic , .percent(0.80), .fixed(600), .intrinsic])
            sizes: [ .marginFromTop(480), .percent(0.75), .intrinsic])
//        controller.onFilterDissmissed = self
        
        self.present(sheetController, animated: false, completion: nil)
    }
    
    
}


extension ExploreMapVC {
//    func getAnnotationId(title:String){
//        for indx in 0 ..< mainNeedType.count{
//            if mainNeedType[indx].name == title {
//                UserDefaults.standard.set(mainNeedType[indx].id, forKey: "id")
//                break
//            }
//        }
//    }
}

extension ExploreMapVC:MainDelegate{
    
    func opportunitiesDetails(data: opportunitiesDetails) {}
    
    func getExploreMapData(data: ExploreMap) {
        opportuntites=data.opportunities ?? []
    }
    
    func showAlerts(title: String, message: String) {}
    
    func getMainScreenData(data: MainScreenData) {}
    
    func getOpportunitiesData(data: ListOpportunities) {}
    
    func getsubCategoriesFiltering(categories: SubHomeCategories) {
        specificFiltering = categories.categories ?? []
        specificFilterCollectionview.reloadData()
    }
    
    func getStandardCategoriesFiltering(categories: MainHomeCategories) {
        generalFiltering = categories.categories ?? []
        print(generalFiltering)
        generalFilterCollectionview.reloadData()
    }
    
    
}
