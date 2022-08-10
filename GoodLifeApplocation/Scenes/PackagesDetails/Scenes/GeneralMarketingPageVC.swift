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
    let unitsSold = [50.0, 25.0, 25.0]


    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setChart(dataPoints: targetMarkets, values: unitsSold)

    }

    func setChart(dataPoints: [String], values: [Double]) {
            
            var dataEntries: [ChartDataEntry] = []
            
            for i in 0..<dataPoints.count {
                let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
                dataEntries.append(dataEntry)
            }
            
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Units Sold")
            let pieChartData = PieChartData(dataSet: pieChartDataSet)
            pieChartView.data = pieChartData
//        pieChartView.bounds = CGRect(x: .zero, y: .zero, width: 150.0, height: 150.0)
            var colors: [UIColor] = []

            for i in 0..<dataPoints.count {
                let red = Double(arc4random_uniform(256))
                let green = Double(arc4random_uniform(256))
                let blue = Double(arc4random_uniform(256))

                let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
                colors.append(color)
            }
        pieChartDataSet.colors = colors
//        pieChartDataSet.colors = [UIColor(named: "ColorChart")!,UIColor(named: "color2Chart")!,UIColor(named: "button")!]
            
   
            
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
