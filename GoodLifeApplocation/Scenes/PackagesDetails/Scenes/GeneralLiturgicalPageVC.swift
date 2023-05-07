//
//  GeneralLiturgicalPageVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip
import Charts
class GeneralLiturgicalPageVC: UIViewController, IndicatorInfoProvider{
    //MARK: - Outlet

    @IBOutlet weak var pieChartview: PieChartView!
    @IBOutlet weak var liturgicalTable: UITableView!

    //MARK: - Properties

    var itemInfo: IndicatorInfo = "Liturgical"
    var targetMarkets:[String] = []
    var unitsSold:[Double] = []
    var dataEntries: [ChartDataEntry] = []
    var item:[GeneralOppourtinityDetails]=[]
    var graph:[Graph]=[]
    var ligutrical:LiturgicalInfo?

    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGrphData()
    }

    
        func setupGrphData(){
            graph=ligutrical?.graphs ?? []
            for x in 0 ..< graph.count{
                
                targetMarkets.append(graph[x].title ?? "")
                unitsSold.append(Double(graph[x].percentage ?? "") ?? 0.0)

            }
            setupPieChart(dataPoints:targetMarkets , values:unitsSold )
            setupTableview()
    }
    
    //MARK: - SetupTableview
    
    func setupTableview(){
        liturgicalTable.register(GeneralMarketingBreakdown.self)
        liturgicalTable.delegate = self
        liturgicalTable.dataSource = self
        NotificationCenter.default.post(name: .init(rawValue: "containerHeight"), object: liturgicalTable.bounds.height+300)

    }

    //MARK: - setup pie Chart

    func setupPieChart(dataPoints: [String], values: [Double]){
        
        //pie chart properties
        
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

//MARK: - configuration
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
extension GeneralLiturgicalPageVC:Storyboarded{
    
    static var storyboardName: StoryboardName = .main

}

extension GeneralLiturgicalPageVC:UITableViewDelegate{}
extension GeneralLiturgicalPageVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GeneralMarketingBreakdown = tableView.dequeueReusableCell(for: indexPath)
//        cell.approachStackview.isHidden = true
        cell.configureCell(item: item[indexPath.row],id:indexPath.row)
        return cell
    }
    
 
    
    
}
