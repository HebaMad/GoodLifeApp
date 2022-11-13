//
//  OnBoardingFrame2.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 24/07/2022.
//

import UIKit
import MapKit

class OnBoardingFrame2: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var findCityBtn: UIButtonDesignable!
    
    //MARK: - Outlet
    var lat = ""
    var long = ""
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupButtonAction()
    }
    
    
}

extension OnBoardingFrame2{
    func setupButtonAction(){
        findCityBtn.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
}

extension OnBoardingFrame2{
    @objc func buttonWasTapped(){
        LocationManager.shared.getLocation { (location:CLLocation?, error:NSError?) in
            
//            if let error = error {
//                //                        self.showNoLocationVC()
//                return
//            }
            
            guard let location = location else {
//                self.showAlert(title: "Location Permission Required", message: "You should activate your location ", confirmBtnTitle: "OK", cancelBtnTitle: "", hideCancelBtn: true) { (action) in
                    UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
//                }
                return
            }
            self.lat = "\(location.coordinate.latitude)"
            self.long = "\(location.coordinate.longitude)"
            
            print("Latitude: \(location.coordinate.latitude) Longitude: \(location.coordinate.longitude)")
            do{
                
                
            }catch(let error){

            }
        }
    }
}
