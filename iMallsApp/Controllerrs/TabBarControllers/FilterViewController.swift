//
//  FilterViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/26/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import ExpandableCell



@available(iOS 11.0, *)
class FilterViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var filterTable: ExpandableTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        topView.clipsToBounds = true
        topView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        topView.addShadowImage(parentview: topView, shadowColor: .lightGray)
        
        
        bgView.layer.cornerRadius = 25
               bgView.clipsToBounds = true
               bgView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        filterTable.expandableDelegate = self
        filterTable.animation = .automatic
        
        filterTable.tableFooterView = UIView()
        
    }
    
    @IBAction func CloseAction(_ sender: Any) {
        
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    
    
}

@available(iOS 11.0, *)
extension FilterViewController:  ExpandableDelegate
{
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        
        
        if indexPath.row ==  0
        {
            let cell1 = expandableTableView.dequeueReusableCell(withIdentifier: "cellSub") as! SubTableViewCell
            
            cell1.lblSubsectionname.text = "sub category 1"
            
            
            
            let cell2 =  expandableTableView.dequeueReusableCell(withIdentifier: "cellSub") as! SubTableViewCell
            
            cell2.lblSubsectionname.text = "sub category 2"
            
            return [cell1, cell2]
        }
        else
        {
            let cell1 = expandableTableView.dequeueReusableCell(withIdentifier: "cellSub") as! SubTableViewCell
            cell1.lblSubsectionname.text = "sub category 11"
            let cell2 = expandableTableView.dequeueReusableCell(withIdentifier: "cellSub") as! SubTableViewCell
            cell2.lblSubsectionname.text = "sub category 22"
            
            return [cell1, cell2]
        }
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        
        if indexPath.row  == 0{
            
            return [44, 44]
        }
        else
        {
            return [44, 44]
            
        }
        
    }
    
    
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRow:\(indexPath.row)")
    
//        if let cell = expandedCell as? FilterTableViewCell {
//                    cell.imgSelect.isHidden = false
//        }
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath) {
        //        print("didSelectExpandedRowAt:\(indexPath)")
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        let index = indexPath.row
        print("row : \(index)")
        
                if let cell = expandedCell as? SubTableViewCell {
                    
                    cell.selecting()
                    
        }
    }
    
    
    
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = expandableTableView.dequeueReusableCell(withIdentifier: "cell") as! FilterTableViewCell
        
        cell.lblCategoryName.text = "category \(indexPath.row + 1)"
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        return cell
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 44
    }
    
    @objc(expandableTableView:didCloseRowAt:) func expandableTableView(_ expandableTableView: UITableView, didCloseRowAt indexPath: IndexPath) {
        
        let cell = expandableTableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor =  #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        cell?.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    }
    
    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func expandableTableView(_ expandableTableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        //        let cell = expandableTableView.cellForRow(at: indexPath)
        //        cell?.contentView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        //        cell?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    }
    
    
    
}
