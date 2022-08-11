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
    
    //MARK: - Properties

    var itemInfo: IndicatorInfo = "Liturgical"

    let targetMarkets = ["Prayer", "Worship", "Hyms"]
    let unitsSold = [57.0, 25.0, 18.0]
    var dataEntries: [ChartDataEntry] = []
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPieChart(dataPoints:targetMarkets , values:unitsSold )
        
    }

    
    
    func setupPieChart(dataPoints: [String], values: [Double]){
        pieChartview.chartDescription.enabled = false
        pieChartview.drawHoleEnabled = false
        pieChartview.rotationAngle = 0
        pieChartview.rotationEnabled = false
        pieChartview.isUserInteractionEnabled = false
//        pieChartView.legend.enabled = false
        
        let l = pieChartview.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .center
        l.orientation = .vertical
        l.xEntrySpace = 10
        l.yEntrySpace = 16
        l.yOffset = 30
        l.formSize = 20

        l.font = .systemFont(ofSize: 16, weight: .medium)

        pieChartview.drawEntryLabelsEnabled=false
        
     let pieDataEntries = setPieData(dataPoints: dataPoints, values: values)
        
        let pieChartDataSet = PieChartDataSet(entries: pieDataEntries, label: "")
        pieChartDataSet.colors = [NSUIColor(hex: 0x00B4D8),NSUIColor(hex: 0xF72585),NSUIColor(hex: 0x7209B7)]
        pieChartDataSet.drawValuesEnabled = false
        pieChartview.data = PieChartData(dataSet: pieChartDataSet)
        pieChartview.bounds = CGRect(x: -20, y:0, width: 150, height: 150)
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
extension GeneralLiturgicalPageVC: ChartViewDelegate{
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: Highlight) {
        
    }
}
