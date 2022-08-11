//
//  GeneralFinicialPagerVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.
//

import UIKit
import XLPagerTabStrip
import Charts

class GeneralFinicialPagerVC: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var lineView: LineChartView!

    
    //MARK: - Properties
    
    var itemInfo: IndicatorInfo = "Finicial"
    let yValue:[ChartDataEntry] =
    [
    ChartDataEntry(x: 0.0, y: 10.0),
     ChartDataEntry(x: 1.0, y: 5.0),
     ChartDataEntry(x: 2.0, y: 4.0),
    ChartDataEntry(x: 3.0, y: 5.0),
    ChartDataEntry(x: 4.0, y: 2.0),
    ChartDataEntry(x: 5.0, y: 2.0),
    ChartDataEntry(x: 6.0, y: 4.0),
    ChartDataEntry(x: 7.0, y: 2.0),
    ChartDataEntry(x:12.0, y: 1.0)

    ]
    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLineChart()
    }
    private func setupLineChart(){
        setData()
        lineView.rightAxis.enabled=false
        lineView.leftAxis.enabled=false
        lineView.xAxis.enabled = false
//        lineView.yAxis.enabled = false
        lineView.legend.enabled = false
        lineView.borderColor = .black
        lineView.borderLineWidth = 2
        
 
    }
    
    func setData(){
        let set1 = LineChartDataSet(entries:yValue, label:"")
        set1.mode = .cubicBezier
        let data = LineChartData(dataSet: set1)
//        data.setDrawValues(false)
        set1.drawCirclesEnabled=true
        set1.lineWidth = 3
        set1.circleRadius = .zero
        set1.valueColors = [.clear]
        let xAxis = lineView.rightAxis

        xAxis.axisRange = 1-12
        xAxis.valueFormatter = IndexAxisValueFormatter(values: ["1","2","2","2","2","2","2","2","2"])
        lineView.chartDescription.enabled = false
        lineView.dragEnabled = true
        lineView.setScaleEnabled(true)
//        let gradientColors = [ChartColorTemplates.colorFromString("#FFFFFF").cgColor,
//                              ChartColorTemplates.colorFromString("#A159FF").cgColor]
//        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
//        set1.gradientPositions = [0, 40, 100]
//
//        set1.fill = LinearGradientFill(gradient: gradient, angle: 90)
//        set1.isDrawLineWithGradientEnabled = true
        set1.setColor(NSUIColor(hex: 0xA159FF))
        set1.fill = ColorFill(color: NSUIColor(hex: 0xA159FF))
        lineView.data=data
        
        
    }
    
    
    
    //MARK: - configuration

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}
