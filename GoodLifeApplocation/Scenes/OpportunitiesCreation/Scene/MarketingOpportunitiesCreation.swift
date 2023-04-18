//
//  MarketingOpportunitiesCreation.swift
//  GoodLifeApplocation
//
//  Created by heba isaa on 27/03/2023.
//

import UIKit
import DropDown
class MarketingOpportunitiesCreation: UIViewController {
    @IBOutlet weak var marketName: UITextField!
    
    @IBOutlet weak var addMarket: UIButton!
    @IBOutlet weak var marketSize: UISlider!
    
    
    
    @IBOutlet weak var socialChannelTxt: UITextField!
    @IBOutlet weak var socialChannelAction: UIButton!
    
    @IBOutlet weak var topAdvertisingAction: UIButton!
    @IBOutlet weak var topAdvertisingTxt: UITextField!
    
    let dropdown = DropDown()
    let presenter=OpportunitiesPresenter()
    
    var socialChannel:[String]=[]
    var topAdvertising:[String]=[]

    var socialChannelSelected:[String]=[]
    var topAdvertisingSelected:[String]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getChannels()
        presenter.delegate=self
        bindButtons()
    }
    
    @IBAction func socialChannelBtn(_ sender: Any) {
        
        self.dropdown.anchorView = self.socialChannelAction
        self.dropdown.dataSource = self.socialChannel
        self.dropdown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        self.dropdown.multiSelectionAction = { [self] (index: [Int], item: [String]) in
            print("Selected item: \(item) at index: \(index)")
            self.socialChannelTxt.textColor = UIColor.black
            socialChannelSelected = item
            let selectedchannel = socialChannelSelected.joined(separator: ",")
            self.socialChannelTxt.text = selectedchannel
            
        }
        
        self.dropdown.width = self.socialChannelTxt.frame.size.width
        self.dropdown.bottomOffset = CGPoint(x: 0, y:(self.dropdown.anchorView?.plainView.bounds.height)!)
        self.dropdown.show()
        
    }
    
    
    @IBAction func topAdvertisingBtn(_ sender: Any) {
        
        self.dropdown.anchorView = self.topAdvertisingAction
        self.dropdown.dataSource = self.topAdvertising
        self.dropdown.cellNib = UINib(nibName: "DropDownCell", bundle: Bundle(for: DropDownCell.self))
        
        self.dropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
        }
        
        
        self.dropdown.multiSelectionAction = { [self] (index: [Int], item: [String]) in
            print("Selected item: \(item) at index: \(index)")
            self.topAdvertisingTxt.textColor = UIColor.black
            topAdvertisingSelected = item
            let selectedchannel = topAdvertisingSelected.joined(separator: ",")
            self.topAdvertisingTxt.text = selectedchannel
            
        }
        
     
        self.dropdown.width = self.topAdvertisingTxt.frame.size.width
        self.dropdown.bottomOffset = CGPoint(x: 0, y:(self.dropdown.anchorView?.plainView.bounds.height)!)
        self.dropdown.show()
        
    }

}

extension MarketingOpportunitiesCreation {
    
    func bindButtons(){
        addMarket.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }

    @objc func buttonWasTapped(_ sender:UIButton){
        switch sender{

        case addMarket:
            print("")
        default:
            print("")

        }
    }
}


extension MarketingOpportunitiesCreation:OpportunitiesDelegate{
    
    func showAlerts(title: String, message: String) {}
    
    func getFundTypeData(data: FundType) {}
    
    func getChannels(data: RecommendedChannel) {
        socialChannel=data.social_channels ?? []
        topAdvertising=data.top_advertising_platforms ?? []
        
    }
}
