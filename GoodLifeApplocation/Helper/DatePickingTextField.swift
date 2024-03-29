//
//  DatePickingTextField.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 01/09/2022.
//

import Foundation
import UIKit

final class DatePickingTextField: UITextField {
    private let picker = UIDatePicker()
    private let toolbar = UIToolbar()
    private var dateFormatter = DateFormatter()
    
    var isOldDateHidden:Bool = true {
        didSet{
            picker.minimumDate = isOldDateHidden ? Date():nil
        }
    }
    
    var doneBtnAction:(() -> Void)?


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        withToolbar()
        self.inputView = self.picker
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .wheels
        self.inputAccessoryView = self.toolbar
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_us")
        picker.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControl.Event.valueChanged)
    }

    
    func setDatePickerMode(mode:UIDatePicker.Mode){
           picker.datePickerMode = mode
       }
    
    
    
    
    
    func setFormat(format:String){
        self.dateFormatter.dateFormat = format
    }
    
    
    private func withToolbar() {
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(removeToolBar))

        toolbar.setItems([space, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
    }

    @objc func removeToolBar() {
        
        doneBtnAction?()
        self.resignFirstResponder()
    }
    @objc func datePickerValueChanged(sender:UIDatePicker) {
            self.text = dateFormatter.string(from: sender.date)
    
        }

}
