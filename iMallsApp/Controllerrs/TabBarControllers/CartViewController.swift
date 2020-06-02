//
//  CartViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/23/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import MOLH

class CartViewController: UIViewController {
    
    @IBOutlet weak var scrollviewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var btnPuchaseConfirm: UIButton!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblShipping: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if MOLHLanguage.currentAppleLanguage() == "ar"
        {
            btnBack.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }

        btnPuchaseConfirm.addShadowImage(parentview: btnPuchaseConfirm, shadowColor: .lightGray)
        
        tableHeight.constant = 15 * 125
        scrollviewHeight.constant += tableHeight.constant - 427
        
        self.loadViewIfNeeded()
        lblProductPrice.text = "4000 " + sDefaults().getStringForKey(key:"Pages.Common.EnKW")
        lblShipping.text = "1000 " + sDefaults().getStringForKey(key:"Pages.Common.EnKW")
        lblTotalPrice.text = "5000 " + sDefaults().getStringForKey(key:"Pages.Common.EnKW")
        
    }
    
    @IBAction func BackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func ConfirmPurchaseAction(_ sender: Any) {
        
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "MyOrdersListViewController") as! MyOrdersListViewController
//         vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func SearchAction(_ sender: Any) {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
//         vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func FavoriteAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController")as! FilterANdArrangeViewController
//              vc.modalPresentationStyle = .fullScreen
             present(vc, animated: true, completion: nil)
         }
        @IBAction func NotificationAction(_ sender: UIButton)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestFeedBackViewController")as! RequestFeedBackViewController
    //             btnnotification.setImage(UIImage.init(named: "notification"), for: .normal)
//                  vc.modalPresentationStyle = .fullScreen
                 present(vc, animated: true, completion: nil)
             }
}


extension CartViewController:  UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 15
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CartTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.lblLastPrice.text = "7.00 " + sDefaults().getStringForKey(key:"Pages.Common.EnKW")
        cell.lblNewPrice.text = "2.00 " + sDefaults().getStringForKey(key:"Pages.Common.EnKW")
        cell.bgView.addShadowImage(parentview: cell.bgView, shadowColor:.lightGray)
        
        cell.img.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        
        
        cell.img.layer.cornerRadius = 8
        cell.img.clipsToBounds = true
        cell.bgView.layer.cornerRadius = 8
        cell.img.clipsToBounds = true
        
        return cell
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 125
    }

    
}
