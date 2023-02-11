//
//  OnBoardingFrame3.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit
import RangeSeekSlider
class OnBoardingFrame3: UIViewController {

    //MARK: - Outlet

    @IBOutlet weak var priceSlidering: RangeSeekSlider!
    @IBOutlet weak var investmentAmountLabel: UILabel!
    
    //MARK: - Properties
    
    var minvalue:Float=0.0
    var maxvalue:Float=0.0
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRangeSlider()
    }

   //MARK: - Setup RangeSlider
    func setupRangeSlider(){
    priceSlidering.numberFormatter.positivePrefix = "$"
    priceSlidering.numberFormatter.positiveSuffix = "k"
    priceSlidering.delegate = self
    }
    
    
    
}
extension OnBoardingFrame3:RangeSeekSliderDelegate{
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        minvalue=Float(minValue)
        maxvalue=Float(maxValue)
        investmentAmountLabel.text = "\(Int(maxvalue-minvalue))" + "k"
    }
}
