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
    @IBOutlet weak var levelOfDifficuilty: UILabel!
    @IBOutlet weak var footerTitleTxt: UILabel!
    var marketing:MarketingInfo?
    //MARK: - Properties
    
    var itemInfo: IndicatorInfo = "Marketing"
    var targetMarkets:[String] = []
    var unitsSold:[Double] = []
    var dataEntries: [ChartDataEntry] = []
    var item:[GeneralOppourtinityDetails]=[]
    var footerTitle: String = ""
    var footerValue: String = ""
    var graph:[Graph]=[]

    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        graph=marketing?.graphs ?? []
        setupGrphData()

        
    }
    
    
    //MARK: - SetupTableview
    
    func setupTableview(){
        
        marketingTable.register(GeneralMarketingBreakdown.self)
        marketingTable.delegate = self
        marketingTable.dataSource = self
        print(marketingTable.bounds.height)
        NotificationCenter.default.post(name: .init(rawValue: "containerHeight"), object: marketingTable.bounds.height + 200)

    }

    
    func setupGrphData(){
        for x in 0 ..< graph.count{
            
            targetMarkets.append(graph[x].title ?? "")
            unitsSold.append(Double(graph[x].percentage ?? "") ?? 0.0)

        }
        setupPieChart(dataPoints: targetMarkets, values: unitsSold)
        setupTableview()
        levelOfDifficuilty.text = "       "
        footerTitleTxt.text = footerTitle
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
        cell.configureMarketingCell(item: item[indexPath.row])
        return cell
    }
    
}

