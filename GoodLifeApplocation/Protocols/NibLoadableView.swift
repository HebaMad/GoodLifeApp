//
//  NibLoadableView.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 08/08/2022.
//

import Foundation
import UIKit

public protocol NibLoadableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
