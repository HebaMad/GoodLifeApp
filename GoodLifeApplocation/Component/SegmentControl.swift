//
//  SegmentControl.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import Foundation
import UIKit

class PlainSegmentedControl: UISegmentedControl {
    override init(items: [Any]?) {
        super.init(items: items)

        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    // Used for the unselected labels
    override var tintColor: UIColor! {
        didSet {
            setTitleTextAttributes([.foregroundColor: tintColor!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)], for: .normal)
        }
    }

    // Used for the selected label
    override var selectedSegmentTintColor: UIColor? {
        didSet {
            setTitleTextAttributes([.foregroundColor: selectedSegmentTintColor ?? tintColor!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)], for: .selected)
        }
    }

    private func setup() {
        backgroundColor = .clear

        // Use a clear image for the background and the dividers
//        let tintColorImage = UIImage(size: CGSize(width: 1, height: 32))
//        setBackgroundImage(tintColorImage, for: .normal, barMetrics: .default)
//        setDividerImage(tintColorImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

        // Set some default label colors
        setTitleTextAttributes([.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)], for: .normal)
        setTitleTextAttributes([.foregroundColor: tintColor!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)], for: .selected)
    }
}
