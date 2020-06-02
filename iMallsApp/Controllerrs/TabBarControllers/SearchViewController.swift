//
//  SearchViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/23/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    
    @IBOutlet weak var ViewSearch: UIView!
    @IBOutlet weak var SearchTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ViewSearch.addShadowImage(parentview: ViewSearch, shadowColor: .lightGray)
        
    }
    
    @IBAction func BackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func CartAction(_ sender: UIButton)
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
//                 vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            @IBAction func FavoriteAction(_ sender: UIButton)
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController")as! FilterANdArrangeViewController
//                      vc.modalPresentationStyle = .fullScreen
                     present(vc, animated: true, completion: nil)
                 }
       
        @IBAction func NotificationAction(_ sender: UIButton)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestFeedBackViewController")as! RequestFeedBackViewController
//                  vc.modalPresentationStyle = .fullScreen
                 present(vc, animated: true, completion: nil)
             }
   @objc func openProducts(sender:UIButton)
{
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController")as! FilterANdArrangeViewController
//     vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
}
    
}

extension SearchViewController:  UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchTableViewCell
        
        cell.bgView.addShadowImage(parentview: cell.bgView, shadowColor: .lightGray)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        cell.img.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        cell.btnProducts.tag = indexPath.row
        cell.btnProducts.addTarget(self, action: #selector(openProducts(sender:)), for: .touchUpInside)

        cell.img.layer.cornerRadius = 8
        cell.img.clipsToBounds = true
        cell.bgView.layer.cornerRadius = 8
        cell.img.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 135
        
        
    }
    
}
