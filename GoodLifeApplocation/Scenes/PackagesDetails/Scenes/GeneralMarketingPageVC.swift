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
    
    //MARK: - Properties
    
    var itemInfo: IndicatorInfo = "Marketing"
    let targetMarkets = ["Families", "Orphans", "Infants"]
    let unitsSold = [67.0, 25.0, 8.0]
    var dataEntries: [ChartDataEntry] = []


    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPieChart(dataPoints: targetMarkets, values: unitsSold)

    }

    
    func setupPieChart(dataPoints: [String], values: [Double]){
        pieChartView.chartDescription.enabled = false
        pieChartView.drawHoleEnabled = false
        pieChartView.rotationAngle = 0
        pieChartView.rotationEnabled = false
        pieChartView.isUserInteractionEnabled = false
//        pieChartView.legend.enabled = false
        let l = pieChartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .center
        l.orientation = .vertical
        l.xEntrySpace = 10
        l.yEntrySpace = 18
        l.yOffset = 30
        l.formSize = 20

        l.font = .systemFont(ofSize: 16, weight: .medium)

        pieChartView.drawEntryLabelsEnabled=false
        
     let pieDataEntries = setPieData(dataPoints: dataPoints, values: values)
        
        let pieChartDataSet = PieChartDataSet(entries: pieDataEntries, label: "")
        pieChartDataSet.colors = [NSUIColor(hex: 0x00B4D8),NSUIColor(hex: 0xF72585),NSUIColor(hex: 0x7209B7)]
        pieChartDataSet.drawValuesEnabled = false
        pieChartView.data = PieChartData(dataSet: pieChartDataSet)
        pieChartView.bounds = CGRect(x: -20, y:0, width: 150, height: 150)
//        pieChartView.
    }
    
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
extension GeneralMarketingPageVC: ChartViewDelegate{
    
  
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: Highlight) {
        
    }
}
