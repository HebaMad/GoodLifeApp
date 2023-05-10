//  ExploreMapVC.swift
//  GoodLifeApplocation
//  Created by heba isaa on 21/03/2023.

import UIKit
import FittedSheets
import MapKit


protocol OnFilterDissmissed{
    func filteredData(data:opportunitiesDetails)
}

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
    var locationCoordinate:[Double:Double]=[:]
    var latitudeList:[Double]=[]
    var longitudeList:[Double]=[]
    var generalFiltering:[MainCategories]=[]
    var specificFiltering:[MainCategories]=[]
    var opportuntites:[opportunitiesData]=[]
    var generalFilteringId=0
    var specificFilteringId=0
    var latitude:Double = UserDefaults.standard.double(forKey: "lat")
    var longitude:Double = UserDefaults.standard.double(forKey: "long")
    var city = ""
    var mainOpportunities:[String:[Double:Double]] = [:]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setupCollectionview()
        getCategoryData()
        specificFilterCollectionview.isHidden=true

    }
    
    func setupCollectionview(){
        categoriesCollectionview.register(HobbiesCell.self)
        categoriesCollectionview.collectionViewLayout = createCompositionalLayout()
        categoriesCollectionview.delegate=self
        categoriesCollectionview.dataSource=self
        
        generalFilterCollectionview.register(FilterCell.self)
        generalFilterCollectionview.collectionViewLayout=createCompositionalLayoutFilter()
        generalFilterCollectionview.delegate = self
        generalFilterCollectionview.dataSource = self
        
        specificFilterCollectionview.register(FilterCell.self)
        specificFilterCollectionview.collectionViewLayout=createCompositionalLayoutFilter()
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
        controller.onFilterDissmissed = self
        
        self.present(sheetController, animated: false, completion: nil)
    }
    
    @objc func generalFilterPressed(_ sender:UIButton){
        categoryMainId = generalFiltering[sender.tag].id ?? 0
        
        presenter.mapScreenData(fundTypeId: "\(needTypeID)", mainCategoryId: String(describing:categoryMainId), subCategoryId:"", interest: "")
        presenter.delegate=self
        specificFilterCollectionview.isHidden=false
        
    }
    
    @objc func specificFilterPressed(_ sender:UIButton){
        specificFilteringId=specificFiltering[sender.tag].id ?? 0

        presenter.mapScreenData(fundTypeId:"\(needTypeID)" , mainCategoryId: String(describing:generalFilteringId), subCategoryId: String(describing: specificFilteringId), interest: "")
        presenter.delegate=self
        
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
            
            
            let span = MKCoordinateSpan(latitudeDelta:10, longitudeDelta: 10)
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
    
    
    func createCompositionalLayoutFilter() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnviroment in
            //            guard let self = self  else {return nil}
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(60))
            
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
            specificFilterCollectionview.isHidden=false

            generalFilteringId=generalFiltering[indexPath.row].id ?? 0
            presenter.mapScreenData(fundTypeId: "\(needTypeID)", mainCategoryId: String(describing:generalFilteringId), subCategoryId:"", interest: "")
            presenter.delegate=self
            
        }else{
            
            specificFilteringId=specificFiltering[indexPath.row].id ?? 0
            presenter.mapScreenData(fundTypeId:"\(needTypeID)" , mainCategoryId: String(describing:generalFilteringId), subCategoryId: String(describing: specificFilteringId), interest: "")
            presenter.delegate=self
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! HobbiesCell
        cell.hobbyView.layer.borderColor = UIColor.clear.cgColor
        cell.hobbiesTitle.textColor = .black
    }
    

}




extension ExploreMapVC:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation!.title!!)
        checkOpportunity(name:view.annotation!.title!!)

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
    
    func opportunitiesDetails(data: opportunitiesDetails) {
        let controller = DetailsVC()
        controller.opportunitiesDetails=data
        
        let sheetController = SheetViewController(
            controller: controller,
            sizes: [ .marginFromTop(480), .percent(0.75), .intrinsic])
        controller.onFilterDissmissed=self
        self.present(sheetController, animated: false, completion: nil)
    }
    
    func getExploreMapData(data: ExploreMap) {
        latitudeList=[]
        longitudeList=[]
        
        opportuntites=data.opportunities ?? []
        
        latitudeList = makeLatitudeRandomList(opportuntites.count, lat:UserDefaults.standard.double(forKey: "lat"))
        longitudeList = makeLongtiudeRandomList(opportuntites.count, long:UserDefaults.standard.double(forKey: "long"))
        createLocationCoordinateRandomPoints(latList: latitudeList, longList: longitudeList)
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


extension ExploreMapVC:OnFilterDissmissed {
    
    func filteredData(data: opportunitiesDetails) {
        print("data")
        let vc = MainOpportuntiesTab.instantiate()
        vc.opportunityDetails=data
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


extension ExploreMapVC {
    
    func makeLatitudeRandomList(_ n: Int,lat:Double) -> [Double] {
        return (0..<n).map { _ in Double.random(in: lat...lat+1.1) }
    }
    func makeLongtiudeRandomList(_ n: Int,long:Double) -> [Double] {
        
        return (0..<n).map { _ in Double.random(in: long...long+1.1) }
        
    }
    
    func createLocationCoordinateRandomPoints(latList:[Double],longList:[Double]){
        for index in 0 ..< latList.count{
            locationCoordinate[latList[index]]=longList[index]
        }
        createAnnotation(location: locationCoordinate)
        
        func createAnnotation(location:[Double:Double]){
            mainOpportunities = [:]
            for indx in 0 ..< opportuntites.count{
                mainOpportunities[opportuntites[indx].name ?? ""] = [Array(location.keys)[indx] : Array(location.values)[indx]]
            }
            
        }
        print(mainOpportunities)
        
        setupAnnotation(points: mainOpportunities)
    }
    
    
    
    func setupAnnotation(points:[String:[Double:Double]]){
        
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        
        
        for (key, innerDictionary) in points {
            let point = MKPointAnnotation()
            
            point.title = key
            
            for (innerKey, innerValue) in innerDictionary {
                point.coordinate = CLLocationCoordinate2D(latitude: innerKey, longitude:innerValue )
            }
            mapView.addAnnotation(point)
            
        }
        
        mapView.delegate=self
    }
    
    func checkOpportunity(name:String){
        for  index in 0 ..< opportuntites.count{
            if name == opportuntites[index].name{
                presenter.getOpportunitiesDetails(opportunitiesId: String(describing:opportuntites[index].id!))
                presenter.delegate=self
                break
            }
        }
        
        
    }
    
}
