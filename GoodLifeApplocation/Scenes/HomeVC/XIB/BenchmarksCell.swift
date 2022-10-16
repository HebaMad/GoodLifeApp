//
//  BenchmarksCell.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/08/2022.
//

import UIKit

class BenchmarksCell: UITableViewCell , NibLoadableView{
    //MARK: - Outlet

    @IBOutlet weak var YouprogressView: UIProgressView!
    @IBOutlet weak var youValue: UILabel!
    @IBOutlet weak var nicheProgressView: UIProgressView!
    @IBOutlet weak var nicheValue: UILabel!
    @IBOutlet weak var benchmarkTopic: UILabel!
    
    //MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - configuration cell
    func configureCell(title:String,value:String,progress:Int){
        nicheProgressView.progress = Float(progress)
        benchmarkTopic.text = title
        nicheValue.text = value


    }

}

