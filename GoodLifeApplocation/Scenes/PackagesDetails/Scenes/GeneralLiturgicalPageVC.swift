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

