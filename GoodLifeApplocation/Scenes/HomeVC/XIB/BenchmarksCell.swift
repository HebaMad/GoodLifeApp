//
//  BenchmarksCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class BenchmarksCell: UITableViewCell ,ReusableView, NibLoadableView{
    //MARK: - Outlet

    @IBOutlet weak var YouprogressView: UIProgressView!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - configuration cell

}
