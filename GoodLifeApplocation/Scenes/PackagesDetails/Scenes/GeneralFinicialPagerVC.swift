//
//  GeneralFinicialPagerVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 07/08/2022.

import UIKit
import XLPagerTabStrip
import Charts


class GeneralFinicialPagerVC: UIViewController, IndicatorInfoProvider {
    
    
    //MARK: - Outlet
    
    @IBOutlet weak var lineView: LineChartView!
    
    @IBOutlet weak var firstTopicTitle: UILabel!
    @IBOutlet weak var firstTopicCost: UILabel!
    @IBOutlet weak var firstSubTopicValue: UILabel!
    @IBOutlet weak var firstSubTopicTitle: UILabel!
    @IBOutlet weak var secondSubTopicTitle: UILabel!
    @IBOutlet weak var secondSubTopicValue: UILabel!
    
    @IBOutlet weak var secondTopicTitle: UILabel!
    @IBOutlet weak var secondTopicCost: UILabel!
    @IBOutlet weak var firstSubTopicTxt: UILabel!
    @IBOutlet weak var firstSubTopicCost: UILabel!
    @IBOutlet weak var SecondSubTopicTxt: UILabel!
    @IBOutlet weak var secondSubTopicCost: UILabel!
    
    @IBOutlet weak var ThirdTopicTitle: UILabel!
    @IBOutlet weak var ThirdTopicCost: UILabel!
    @IBOutlet weak var firstSubTopiicTxt: UILabel!
    @IBOutlet weak var firstSubTopiicCost: UILabel!
    @IBOutlet weak var SecondSubTopiicTxt: UILabel!
    @IBOutlet weak var SecondSubTopiicCost: UILabel!
    

    //MARK: - Properties
    
    var item:[GeneralOppourtinityDetails]=[]

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
        print(item)
        
        setupData()
        setupLineChart()
        
    }
    
    
    private func setupLineChart(){
        setData()
        lineView.rightAxis.enabled=false
        lineView.leftAxis.enabled=false
        lineView.xAxis.enabled = false
//      lineView.yAxis.enabled = false
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
extension GeneralFinicialPagerVC{
    func setupData(){
        NotificationCenter.default.post(name: .init(rawValue: "containerHeight"), object: 950)

        let fmt = NumberFormatter()
        fmt.maximumFractionDigits = 1
        fmt.minimumFractionDigits = 1
        
        firstTopicTitle.text = item[0].title ?? ""
        firstTopicCost.text =  fmt.string(from: Float((item[0].cost ?? ""))! as NSNumber)!  + " " + "K"
        firstSubTopicValue.text = item[0].childs?[0].cost ?? "" + " " + "k"
        firstSubTopicTitle.text = item[0].childs?[0].title ?? ""
        secondSubTopicTitle.text = item[0].childs?[1].title ?? ""
        secondSubTopicValue.text = item[0].childs?[1].cost ?? "" + " " + "k"
        
        secondTopicTitle.text = item[1].title ?? ""
        secondTopicCost.text =  fmt.string(from: Float((item[1].cost ?? ""))! as NSNumber)! + " "  + "K"
        firstSubTopicCost.text = item[1].childs?[0].cost ?? ""  + " " + "k"
        firstSubTopicTxt.text = item[1].childs?[0].title ?? ""
        SecondSubTopicTxt.text = item[1].childs?[1].title ?? ""
        secondSubTopicCost.text = item[1].childs?[1].cost ?? "" + " "  + "k"

        ThirdTopicTitle.text = item[2].title ?? ""
        ThirdTopicCost.text = fmt.string(from: Float((item[2].cost ?? ""))! as NSNumber)!  + " " + "K"
        firstSubTopiicCost.text = item[2].childs?[0].cost ?? "" + " "  + "k"
        firstSubTopiicTxt.text = item[2].childs?[0].title ?? ""
        SecondSubTopiicTxt.text = item[2].childs?[1].title ?? ""
        SecondSubTopiicCost.text = item[2].childs?[1].cost ?? "" + " "  + "k"
        
        
        let earning = (Float(item[1].cost ?? "") ?? 0.0)  + (Float((item[0].cost ?? "")) ?? 0.0) + (Float((item[2].cost ?? "")) ?? 0.0)
        
       
        let output = fmt.string(from: earning as NSNumber)!
        
    }
}
