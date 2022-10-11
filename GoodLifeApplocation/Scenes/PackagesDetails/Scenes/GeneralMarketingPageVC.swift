//
//  GeneralMarketingPageVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip
import Charts

class GeneralMarketingPageVC: UIViewController, IndicatorInfoProvider {
    
    //MARK: - Outlet
    
    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var marketingTable: UITableView!
    
    
    //MARK: - Properties
    
    var itemInfo: IndicatorInfo = "Marketing"
    let targetMarkets = ["Families", "Orphans", "Infants"]
    let unitsSold = [67.0, 25.0, 8.0]
    var dataEntries: [ChartDataEntry] = []
    var item:[GeneralOppourtinityDetails]=[]

    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPieChart(dataPoints: targetMarkets, values: unitsSold)
        setupTableview()
    }
    
    
    //MARK: - SetupTableview
    
    func setupTableview(){
        marketingTable.register(GeneralMarketingBreakdown.self)
        marketingTable.delegate = self
        marketingTable.dataSource = self
    }

    //MARK: - setup pie Chart

    func setupPieChart(dataPoints: [String], values: [Double]){
        //pie chart properties

        pieChartView.chartDescription.enabled = false
        pieChartView.drawHoleEnabled = false
        pieChartView.rotationAngle = 0
        pieChartView.rotationEnabled = false
        pieChartView.isUserInteractionEnabled = false


        pieChartView.drawEntryLabelsEnabled=false
        
     let pieDataEntries = setPieData(dataPoints: dataPoints, values: values)
        
        let pieChartDataSet = PieChartDataSet(entries: pieDataEntries, label: "")
        pieChartDataSet.colors = [NSUIColor(hex: 0x00B4D8),NSUIColor(hex: 0xF72585),NSUIColor(hex: 0x7209B7)]
        pieChartDataSet.drawValuesEnabled = false
        pieChartView.data = PieChartData(dataSet: pieChartDataSet)
        pieChartView.bounds = CGRect(x: -20, y:0, width: 150, height: 150)
        
        // add legend
         
         let legendChart = pieChartView.legend
         legendChart.horizontalAlignment = .left
         legendChart.verticalAlignment = .center
         legendChart.orientation = .vertical
         legendChart.xEntrySpace = 10
         legendChart.yEntrySpace = 18
         legendChart.yOffset = 30
         legendChart.formSize = 20
         legendChart.font = .systemFont(ofSize: 16, weight: .medium)


    }
    // set pie data

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
extension GeneralMarketingPageVC:Storyboarded{
    static var storyboardName: StoryboardName = .main

}
extension GeneralMarketingPageVC:UITableViewDelegate{}
extension GeneralMarketingPageVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GeneralMarketingBreakdown = tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(item: item[indexPath.row])
        return cell
    }
    
 
    
    
}

