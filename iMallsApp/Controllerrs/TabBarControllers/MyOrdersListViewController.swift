//
//  MyOrdersListViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/20/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class MyOrdersListViewController: UIViewController {

    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var lblAttribute: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let attributedString = NSMutableAttributedString(string: "My Orders List", attributes: [
            .font:UIFont.boldSystemFont(ofSize: 18),
          .foregroundColor: UIColor(red: 210.0 / 255.0, green: 161.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
        ])
        attributedString.addAttributes([
          .font: UIFont.boldSystemFont(ofSize: 18),
          .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
        ], range: NSRange(location: 9, length: 5))
        
        
        lblAttribute.attributedText = attributedString

        
    }
    
    
    @IBAction func BackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func SearchAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
         vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func CartAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
         vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func FavoriteAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController")as! FilterANdArrangeViewController
              vc.modalPresentationStyle = .fullScreen
             present(vc, animated: true, completion: nil)
         }
    @IBAction func NotificationAction(_ sender: Any) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestFeedBackViewController")as! RequestFeedBackViewController
         vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    
    
}

extension MyOrdersListViewController:  UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 15
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MyOrderListTableViewCell
       
        cell.bgView.layer.cornerRadius = 8
        cell.bgView.addShadowImage(parentview: cell.bgView, shadowColor:.lightGray)
        cell.lblPrice.text = "400 " +  sDefaults().getStringForKey(key:"Pages.Common.EnKW")
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
          return 100
        
    }
    
}
