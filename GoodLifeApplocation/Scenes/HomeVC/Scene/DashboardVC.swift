//
//  DashboardVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 05/08/2022.
//

import UIKit
import SideMenu
import  SkeletonView
class DashboardVC: UIViewController {
    //MARK: - Outlet
    
    @IBOutlet weak var searchBar: SearchView!
    @IBOutlet weak var elementCollectionView: UICollectionView!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var notificationNumber: UILabelDesignable!
    
    //MARK: - properties
    
    private var menu :SideMenuNavigationController?
    private let sections = HomeCategories.shared.AllCategories
    
    let presenter = DashboardPresenter()
    var categories:[Categories]=[]
    var resource:[Resources]=[]
    var myCurrentTask:[Tasks]=[]
    var myCompletedTask:[Tasks]=[]
    private var isSkeleton: Bool = true {
        didSet {
            self.elementCollectionView.reloadData()
        }
    }
    
    
    
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isSkeleton = true
        setupSearchProperties()
        setUpSideMenu()
        setupCollectionview()
        menuBtnBinding()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        changeSideMenuSide()
        presenter.getCategories(opportunity_id: UserDefaults.standard.integer(forKey: "id"), searchTxt: "")
        presenter.getResource(searchTxt: "", category_id:  UserDefaults.standard.integer(forKey: "id"))
        presenter.getMyTask(searchTxt: "")
        presenter.delegate=self
        
    }
    
    //MARK: - Side menu setup
    
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
    
    private func setupCollectionview(){
        
        elementCollectionView.register(CategoriesCollectionViewCell.self)
        elementCollectionView.register(TaskCollectionViewCell.self)
        elementCollectionView.register(ResourceCollectionViewCell.self)
        
        elementCollectionView.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        elementCollectionView.collectionViewLayout = createCompositionalLayout()
        elementCollectionView.dataSource=self
        elementCollectionView.delegate=self
        
        elementCollectionView.reloadData()
    }
    
    
    
   func  setupSearchProperties(){
    searchBar.btnSearch.addTarget(self, action: #selector(searchActioon), for: .touchUpInside)

    searchBar.startHandler {
    }

    searchBar.endEditingHandler {

        self.HomeSearch()
    }

    }
    
    @objc func searchActioon(_ sender : UIButton ) {
        HomeSearch()
     
}
    
    
    func HomeSearch(){
        self.isSkeleton = true
 
        if (self.searchBar.txtSearch.text)?.count != 0{
        
            presenter.getCategories(opportunity_id: UserDefaults.standard.integer(forKey: "id"), searchTxt:self.searchBar.txtSearch.text!)
            presenter.getResource(searchTxt:self.searchBar.txtSearch.text! , category_id:  UserDefaults.standard.integer(forKey: "id"))
            presenter.getMyTask(searchTxt:self.searchBar.txtSearch.text!)
        }else{
            presenter.getCategories(opportunity_id: UserDefaults.standard.integer(forKey: "id"), searchTxt: "")
            presenter.getResource(searchTxt: "", category_id:  UserDefaults.standard.integer(forKey: "id"))
            presenter.getMyTask(searchTxt: "")
        }
        presenter.delegate=self

    }
    
    
    //MARK: - CompositionalLayout setup
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .categories:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(140))
                
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
            case .Task:
                
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.3))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                //                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
                
            case .Resource:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(140))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                //                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.99), heightDimension: .estimated(0.5))
                
                
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
    
    
    @objc func viewAllButton(_ sender:UIButton){
        
        switch sections[sender.tag]{
            
        case .categories:
            let vc = AllCategoriesVC.instantiate()
            vc.categories=categories
            navigationController?.pushViewController(vc, animated: true)
        case .Task:
            let vc = TaskVC.instantiate()
            vc.myCurrentTask = myCurrentTask
            vc.myCompletedTask = myCompletedTask
            navigationController?.pushViewController(vc, animated: true)
        case .Resource:
            let vc = AllResourceVC.instantiate()
            vc.resource=self.resource
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @objc func markDoneBtn(_ sender:UIButton){
        self.presenter.markMyTask(taskid: myCurrentTask[sender.tag].id ?? 0)
        self.elementCollectionView.reloadData()
        
    }
}
//MARK: - Binding

private extension DashboardVC{
    
    func menuBtnBinding(){
        menuBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        notificationBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
        
    }
    
}

//MARK: - Action
private extension DashboardVC{
    @objc func buttonWasTapped(_ sender:UIButton){
        
        switch  sender{
        case menuBtn:
            present(menu!, animated: true, completion: nil)
        case notificationBtn:
            let vc = NotificationVC()
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            print("error select")
        }
        
    }
}


//MARK: - UICollectionViewDelegate,DataSource & DelegateFlowLayout configuration

extension DashboardVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch sections[section]{
        case .categories: return self.isSkeleton ? 3 :categories.count
        case .Task :return self.isSkeleton ? 2 : myCurrentTask.count
        case .Resource:return self.isSkeleton ? 3 : resource.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        case .categories:
            
            let cell:CategoriesCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            guard !self.isSkeleton else {
                cell.startSkeleton()
                return cell
            }
            cell.stopSkeleton()
            cell.setup(categories[indexPath.row])
            return cell
            
        case .Task:
            let cell:TaskCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            guard !self.isSkeleton else {
                cell.startSkeleton()
                return cell
            }
            cell.stopSkeleton()
            cell.setup(myCurrentTask[indexPath.row])
            cell.DoneBtn.addTarget(self, action: #selector(markDoneBtn), for: .touchUpInside)
            cell.DoneBtn.tag=indexPath.row
            
            
            return cell
        case .Resource:
            
            let cell:ResourceCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
            guard !self.isSkeleton else {
                cell.startSkeleton()
                return cell
            }
            cell.stopSkeleton()
            cell.setup(resource[indexPath.row])
            
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch sections[indexPath.section] {
            
            
        case .categories:
         print("")
        case .Task:
           print("")
        case .Resource:
            presenter.getResourceDetails(categoryID: resource[indexPath.row].id ?? 0)
            self.presenter.delegate=self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.viewAllButton.addTarget(self, action: #selector(viewAllButton), for: .touchUpInside)
        header.viewAllButton.tag = indexPath.section
        
        header.setup(sections[indexPath.section].title)
        return header
    }
}
extension DashboardVC:Storyboarded{
    static var storyboardName: StoryboardName = .main
    
}

extension DashboardVC:DashboardDelegate{
    func getCategories(data: DahboardCategory) {
        self.isSkeleton = false
        notificationNumber.text = "\(data.notificationsCount ?? 0)"
        categories=data.categories ?? []
        elementCollectionView.reloadData()
    }
    
    func getNotification(data: AllNotifiaction) {}
    func getMyGoalAndBenchmark(data: GoalsAndBenchmark) {}

    func getResourceDetails(data: ResourceDetails) {
            
            let vc = ResourceDetailsVC.instantiate()
            vc.resourceTopic=data
            navigationController?.pushViewController(vc, animated: true)
        }
  
    func showAlerts(title: String, message: String) {}
    

    
    func getResource(data: [Resources]) {
        self.isSkeleton = false
        
        resource = data
        elementCollectionView.reloadData()
    }
    
    func getMyTask(data: DashboardTask) {
        self.isSkeleton = false
        
        myCompletedTask=data.completedTasks ?? []
        myCurrentTask = data.currentTasks ?? []
        elementCollectionView.reloadData()
        
    }
    
    
}
