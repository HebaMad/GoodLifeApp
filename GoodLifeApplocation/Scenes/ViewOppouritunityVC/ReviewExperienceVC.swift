//
//  ReviewExperienceVC.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 03/08/2022.
//

import UIKit

class ReviewExperienceVC: UIViewController {
    
    //MARK: - Outlet

    @IBOutlet weak var coverImage: UIImageViewDesignable!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var titleProjectText: UITextField!
    @IBOutlet weak var projectReview: UITextView!
    @IBOutlet weak var reviewRate: RatingControl!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var addDocumentBtn: UIButton!
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }



}
