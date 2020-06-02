//
//  RequestFeedBackViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/23/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class RequestFeedBackViewController: UIViewController
{

    @IBOutlet weak var feedBackTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

feedBackTable.tableFooterView = UIView()
        
        
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

     @IBAction func BackAction(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
     }
     
   
    

}

extension RequestFeedBackViewController:  UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RequestFeedBackTableViewCell
       
               cell.selectionStyle = UITableViewCell.SelectionStyle.none

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
          return 55
        
        
    }
    
    
    

}
