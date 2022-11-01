//
//  TermsAndConditions.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 31/08/2022.
//

import UIKit
import WebKit
import SVProgressHUD
class TermsAndConditions: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var termsAndConditionWebView: WKWebView!
    
    //MARK: - Properties

     var url = ""

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(url)
        SVProgressHUD.show()
        setupWebview(URl: url)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}

extension TermsAndConditions{
    private func setupWebview(URl:String){
        self.url=URl
        let urlvideoo = URL(string:self.url)
        let request = URLRequest(url: urlvideoo ?? URL(fileURLWithPath: ""))
        SVProgressHUD.dismiss()
        self.termsAndConditionWebView.load(request)
        self.termsAndConditionWebView.scrollView.isScrollEnabled=true
    }
}
