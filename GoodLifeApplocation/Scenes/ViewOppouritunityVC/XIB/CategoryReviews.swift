//
//  CategoryReviews.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 04/02/2023.
//

import UIKit

protocol CategoryReviewsDelegate: AnyObject {
    func categoryReviewsDidChangeRating(_ cell: CategoryReviews,_ ratingControl: RatingControl, rating: Int)
}

class CategoryReviews: UITableViewCell , NibLoadableView {

    @IBOutlet weak var categoryRate: RatingControl!
    @IBOutlet weak var categoryName: UILabel!
    
//    weak var delegate: ratingViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
