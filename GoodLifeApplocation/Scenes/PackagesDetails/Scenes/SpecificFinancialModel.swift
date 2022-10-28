//
//  SpecificFinancialModel.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 12/08/2022.
//

import UIKit
import Charts
import XLPagerTabStrip

class SpecificFinancialModel: UIViewController {

    //MARK: - Outlet

    @IBOutlet weak var FinancialModelCollectionview: UICollectionView!
    @IBOutlet weak var pieChartview: PieChartView!
    @IBOutlet weak var collectionviewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollviewHeight: UIScrollView!
    @IBOutlet weak var stackHeight: NSLayoutConstraint!
    
    
    //MARK: - Properties
    private var sections = BusinessPlanList.shared.AllCategories
    let targetMarkets = ["Ticket Price", "Subscription", "Fee"]
    let unitsSold = [57.0, 25.0, 18.0]
    var dataEntries: [ChartDataEntry] = []
    var itemNumber = 0
    var itemInfo: IndicatorInfo = "FinancialModel"
    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPieChart(dataPoints: targetMarkets, values: unitsSold)
        setupCollectionview()
        
    }
    
    //MARK: - Collectionview

    private func setupCollectionview(){
        FinancialModelCollectionview.layer.cornerRadius = 8
        FinancialModelCollectionview.layer.borderColor =  CGColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        FinancialModelCollectionview.layer.borderWidth = 1
        FinancialModelCollectionview.backgroundColor = .white
        FinancialModelCollectionview.register(BusinessPlanCell.self)
        FinancialModelCollectionview.register(UINib(nibName:"HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier)
        FinancialModelCollectionview.collectionViewLayout = createCompositionalLayout()
        FinancialModelCollectionview.delegate = self
        FinancialModelCollectionview.dataSource = self
        noOfItem()

    }

    //MARK: -  setup UICollectionViewCompositionalLayout
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnviroment in
            guard let self = self  else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .MovieAndDinner:
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.4))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
//                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .DriveInMovie:
                
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120))

                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0.4))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
               
                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
                
            }
            
        }
    }
        private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        }
    
    private func noOfItem(){
        for index in 0 ..< sections.count{
            itemNumber+=sections[index].count
        }
        collectionviewHeight.constant = CGFloat((itemNumber * 120) + (sections.count * 60))
     

        NotificationCenter.default.post(name: .init(rawValue: "containerHeight"), object: scrollviewHeight.bounds.height+40)

        
    }
    
    //MARK: - setup pie Chart

    func setupPieChart(dataPoints: [String], values: [Double]){
        
        //pie chart properties
        pieChartview.layer.cornerRadius = 8
        pieChartview.layer.borderColor =  CGColor(red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        pieChartview.layer.borderWidth = 1
        pieChartview.backgroundColor = .white
        pieChartview.chartDescription.enabled = false
        pieChartview.drawHoleEnabled = false
        pieChartview.rotationAngle = 0
        pieChartview.rotationEnabled = false
        pieChartview.isUserInteractionEnabled = false
        
        pieChartview.drawEntryLabelsEnabled=false
        
     let pieDataEntries = setPieData(dataPoints: dataPoints, values: values)
        
        let pieChartDataSet = PieChartDataSet(entries: pieDataEntries, label: "")
        pieChartDataSet.colors = [NSUIColor(hex: 0x00B4D8),NSUIColor(hex: 0xF72585),NSUIColor(hex: 0x7209B7)]
        pieChartDataSet.drawValuesEnabled = false
        pieChartview.data = PieChartData(dataSet: pieChartDataSet)
        pieChartview.bounds = CGRect(x: -20, y:0, width: 150, height: 150)
        
        // add chart legend
         
         let legendChart = pieChartview.legend
         legendChart.horizontalAlignment = .left
         legendChart.verticalAlignment = .center
         legendChart.orientation = .vertical
         legendChart.xEntrySpace = 10
         legendChart.yEntrySpace = 18
         legendChart.yOffset = 30
         legendChart.formSize = 20
         legendChart.font = .systemFont(ofSize: 16, weight: .medium)

    }
    
        // add chart legend

    private func setPieData(dataPoints: [String], values: [Double]) -> [ChartDataEntry] {
        for i in 0..<dataPoints.count {
            
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i])
            dataEntries.append(dataEntry)
        }
        return dataEntries
    }
  

}


extension SpecificFinancialModel:UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return sections[section].count

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        switch sections[indexPath.section]{
            
        
        case .MovieAndDinner(let items):
            
            let cell:BusinessPlanCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.setupCell(items: items[indexPath.row])
            return cell
        case .DriveInMovie(let items):
            let cell:BusinessPlanCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.setupCell(items: items[indexPath.row])

            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.headerIdentifier, for: indexPath) as! HeaderCollectionReusableView
        header.setup(sections[indexPath.section].title)
        header.viewAllButton.isHidden = true
        return header
    }
    
    
}
extension SpecificFinancialModel: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
}
