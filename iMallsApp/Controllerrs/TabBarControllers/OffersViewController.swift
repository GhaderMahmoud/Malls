//
//  OffersViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/17/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController {

    @IBOutlet weak var btnNotification: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CartAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
//         vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func FavoriteAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController")as! FilterANdArrangeViewController
//              vc.modalPresentationStyle = .fullScreen
             present(vc, animated: true, completion: nil)
         }
    @IBAction func NotificationAction(_ sender: Any) {
       
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestFeedBackViewController")as! RequestFeedBackViewController
        btnNotification.setImage(UIImage.init(named: "notification"), for: .normal)
//         vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func SearchAction(_ sender: Any) {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
//           vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
          
          
          
      }
}

extension OffersViewController:  UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OffersTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.img.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)

        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
          return 205
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DiscountViewController") as! DiscountViewController
         vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
          
   
}
