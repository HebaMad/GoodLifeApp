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
    
    
    
    @IBOutlet weak var marketRateTxt: UILabel!
    @IBOutlet weak var socialChannelTxt: UITextField!
    @IBOutlet weak var socialChannelAction: UIButton!
    
    @IBOutlet weak var topAdvertisingAction: UIButton!
    @IBOutlet weak var topAdvertisingTxt: UITextField!
    
    @IBOutlet weak var marketDetailsTableview: UITableView!
    
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    
    let dropdown = DropDown()
    let presenter=OpportunitiesPresenter()
    
    var socialChannel:[String]=[]
    var topAdvertising:[String]=[]

    var socialChannelSelected:[String]=[]
    var topAdvertisingSelected:[String]=[]
    
    var marketGraph:[String:String]=[:]
    var marketGraphName:[String]=[]
    var marketGraphSize:[String]=[]
    var marketingInfo:MarketingInfos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUISliderValue()
        marketDetailsTableview.isHidden=true
        presenter.getChannels()
        presenter.delegate=self
        setupTableview()
        setupdata()
    }
    
    func setupdata(){
        socialChannelTxt.text=marketingInfo?.recommended_social_channels?.joined(separator: ",")
        socialChannelSelected=marketingInfo?.recommended_social_channels ?? []
        topAdvertisingTxt.text=marketingInfo?.top_advertising_platforms?.joined(separator: ",")
        topAdvertisingSelected=marketingInfo?.top_advertising_platforms ?? []
        
        if let graph = marketingInfo?.graphs {
            marketGraphName = graph.map { $0.title ?? "" }
            marketGraphSize = graph.map{ $0.percentage ?? ""}
            marketDetailsTableview.isHidden=false
            marketDetailsTableview.reloadData()
            tableviewHeight.constant = CGFloat(marketGraphName.count * 50)

        }
        makeParameter(key: marketGraphName, value: marketGraphSize)

      
    }
    
    
    func setupTableview(){
        marketDetailsTableview.register(GraphMarketSizeCell.self)
        marketDetailsTableview.delegate=self
        marketDetailsTableview.dataSource=self
        
    }
    
    @objc func deleteBtnWasTapped(_ sender:UIButton){
        marketGraphName.remove(at: sender.tag)
        marketGraphSize.remove(at: sender.tag)
        marketDetailsTableview.reloadData()
        tableviewHeight.constant = CGFloat(marketGraphName.count * 50)

    }
    
    func bindUISliderValue(){
        marketSize.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func addMoreBtn(_ sender: Any) {
        if marketName.text != "" && marketSize.value != 0.0 {
            marketGraphName.append(marketName.text!)
            marketGraphSize.append("\(Int(marketSize.value))")
            marketDetailsTableview.isHidden=false
            marketDetailsTableview.reloadData()
            tableviewHeight.constant = CGFloat(marketGraphName.count * 50)
            cleardata()
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
        marketRateTxt.text="0%"
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        marketRateTxt.text="\(Int(sender.value))%"
    }
}


extension MarketingOpportunitiesCreation:OpportunitiesDelegate{
    func opportunitiesDetails(data: opportunitiesData) {
        
    }
    
    
    func showAlerts(title: String, message: String) {}
    
    func getFundTypeData(data: FundType) {}
    
    func getChannels(data: RecommendedChannel) {
        socialChannel=data.social_channels ?? []
        topAdvertising=data.top_advertising_platforms ?? []
        
    }
}


extension MarketingOpportunitiesCreation:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        marketGraphName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:GraphMarketSizeCell=tableView.dequeueReusableCell(for: indexPath)
        cell.configureCell(MarketName: marketGraphName[indexPath.row], MarketSize: marketGraphSize[indexPath.row])
        cell.deleteBtn.tag=indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnWasTapped), for: .touchUpInside)
        return cell
    }
    
    
    
}
