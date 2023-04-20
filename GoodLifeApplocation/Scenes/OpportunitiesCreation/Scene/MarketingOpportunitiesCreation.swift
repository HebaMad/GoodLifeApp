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
    
    var marketGraph:[String:String]=[:]
    var marketGraphName:[String]=[]
    var marketGraphSize:[String]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getChannels()
        presenter.delegate=self
//        bindButtons()
    }
    

    @IBAction func addMoreBtn(_ sender: Any) {
        if marketName.text != "" && marketSize.value != 0.0{
            marketGraphName.append(marketName.text!)
            marketGraphSize.append("\(marketSize.value)")
            makeParameter(key: marketGraphName, value: marketGraphSize)
        }else{
            showSnackBar(message: "Add your Market Size")
        }
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
            if marketName.text != "" && marketSize.value != 0.0{
                marketGraphName.append(marketName.text!)
                marketGraphSize.append("\(marketSize.value)")
                cleardata()
                makeParameter(key: marketGraphName, value: marketGraphSize)
            }else{
                showSnackBar(message: "Add your Market Size")
            }
        default:
            print("")

        }
    }
}


extension MarketingOpportunitiesCreation{
    func makeParameter(key:[String],value:[String]){
        marketGraph=[:]
        for indx in 0 ..< key.count{
            marketGraph["marketing_graphs[\(indx)][title]"]=key[indx]
            marketGraph["marketing_graphs[\(indx)][percentage]"]=value[indx]

        }
    }
    
    func cleardata(){
        marketSize.value=0.0
        marketName.text=""
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
