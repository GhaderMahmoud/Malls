//
//  CateogriesViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/20/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class CateogriesViewController: UIViewController
{

    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var Cateogrytable: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
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
        @IBAction func SearchAction(_ sender: UIButton)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
//             vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        @IBAction func NotificationAction(_ sender: UIButton)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestFeedBackViewController")as! RequestFeedBackViewController
                 present(vc, animated: true, completion: nil)
             }

    

}

extension CateogriesViewController:  UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if indexPath.row % 2 == 0
        {
                 let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1") as! CateogryRightTableViewCell
            cell1.selectionStyle = UITableViewCell.SelectionStyle.none

            return cell1
            
        }else {

            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2") as! categoryLiftTableViewCell
            cell2.selectionStyle = UITableViewCell.SelectionStyle.none

            return cell2
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
          return 190
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController") as! FilterANdArrangeViewController
            
             vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true, completion: nil)

    }
    
}
