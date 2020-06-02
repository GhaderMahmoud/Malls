//
//  ArrangPopUpViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/20/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
@available(iOS 11.0, *)
class ArrangPopUpViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var lblArrangeBy: UILabel!
    @IBOutlet weak var ArrangeTable: UITableView!
    var selectionArry :[Bool] = []
    
    var titlesArray = ["Pages.ArrangePop.MostOrder",
    "Pages.ArrangePop.MostPrice",
    "Pages.ArrangePop.LeastPrice"]
    
    var layerMaxXMaxYCorner: CACornerMask?
    var layerMaxXMinYCorner: CACornerMask?
    var layerMinXMaxYCorner: CACornerMask?
    var layerMinXMinYCorner: CACornerMask?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectionArry = [true, false, false]
        
        ArrangeTable.tableFooterView = UIView()
        viewTop.addShadowImage(parentview: viewTop, shadowColor: .lightGray)
        
        viewTop.layer.cornerRadius = 20
        viewTop.clipsToBounds = true
        viewTop.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        bgView.layer.cornerRadius = 25
        bgView.clipsToBounds = true
        bgView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    @IBAction func CloseAction(_ sender: Any) {
        
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    
}


@available(iOS 11.0, *)
extension ArrangPopUpViewController:  UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titlesArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ArrangTableViewCell
        cell.lblTitle.text = sDefaults().getStringForKey(key:titlesArray[indexPath.row])
        
        if selectionArry[indexPath.row] == false
        {
            cell.btnCheckBox.setImage(UIImage(named:"unselect"), for: .normal)
            
        }
            
        else
        {
            cell.btnCheckBox.setImage(UIImage(named:"selecte"), for: .normal)
            
        }
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var  statusArrayTemp  :[Bool] = []
        for _ in selectionArry{
            statusArrayTemp.append(false)
        }
        
        if selectionArry[indexPath.row] == false
        {
            statusArrayTemp[indexPath.row] = true
        }
        
        selectionArry = statusArrayTemp
        ArrangeTable.reloadData()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
        
    }
    
}
