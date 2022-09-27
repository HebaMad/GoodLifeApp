//
//  LessonDetails.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/09/2022.
//

import UIKit

class LessonDetails: UIViewController {

    @IBOutlet weak var overviewTxt: UILabel!
    @IBOutlet weak var keyAspectTxt: UILabel!
    @IBOutlet weak var keyTakeawayTxt: UILabel!

    var lesson:Lessons?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLessonData()

    }

    func setupLessonData(){
        overviewTxt.text = lesson?.overview?.html2Attributed?.string
        keyAspectTxt.text = lesson?.key_aspects?.html2Attributed?.string
        keyTakeawayTxt.text = lesson?.key_takeaways?.html2Attributed?.string

    }
 

}
