//
//  NibLoadableView.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import Foundation
import UIKit

 protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
