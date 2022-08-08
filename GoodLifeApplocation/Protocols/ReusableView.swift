//
//  ReusableView.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import Foundation

import UIKit
protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
