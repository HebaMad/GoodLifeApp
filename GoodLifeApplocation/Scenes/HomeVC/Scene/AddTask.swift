//
//  AddTask.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class AddTask: UIViewController {

    //MARK: - Outlet
    
    @IBOutlet private(set) weak var AddBtn: UIButton!
    @IBOutlet private(set) weak var closeBtn: UIButton!
    @IBOutlet private(set) weak var categorySelectionBtn: UIButton!
    @IBOutlet private(set) weak var startTimeBtn: UIButton!
    @IBOutlet private(set) weak var endTimeBtn: UIButton!
    
    
    @IBOutlet private(set) weak var titleTxtfield: UITextField!
    @IBOutlet private(set) weak var alertSwitch: UISwitch!
    @IBOutlet private(set) weak var timeStartingAlertText: UILabel!
    @IBOutlet private(set) weak var timeEndingAlertText: UILabel!
    
    
    //MARK: - Properties
    
    
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }




}
