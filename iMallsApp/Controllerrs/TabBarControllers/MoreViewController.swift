//
//  MoreViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/26/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController
{

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    let titlesArry = [sDefaults().getStringForKey(key:"Pages.More.MyOrders"),sDefaults().getStringForKey(key:"Pages.More.ChangeLanguage"),
        sDefaults().getStringForKey(key:"Pages.More.ChangePassword"),
        sDefaults().getStringForKey(key:"Pages.More.ShareApp"),
        sDefaults().getStringForKey(key:"Pages.More.ContactUs")]
       
    override func viewDidLoad() {
        super.viewDidLoad()

        tableHeight.constant = CGFloat(titlesArry.count * 55)

        scrollViewHeight.constant += tableHeight.constant - 317

        self.loadViewIfNeeded()

        userImg.cornerRadius = userImg.frame.width / 2
        userImg.clipsToBounds = true
    }
    
    @objc func openMore(sender:UIButton)
    {
        //        var notificationName = ""
                
                if sender.tag == 0 {
                    
                    handelMyOrdersListAction()
        //            notificationName = "openMyOrders"
                    
                }else if sender.tag == 1
                {
                    handleChangeLang()
        //            notificationName = "OpenChangeLangPopUp"

                }
                    else if sender.tag == 3
                            {
                                
                                share(message:"", link:"https://www.google.com/?client=safari&channel=iphone_bm" )
                    //            notificationName = "openContactUs"
                                
                            }
                else if sender.tag == 4
                {
                    
                    handleCntactUs()
        //            notificationName = "openContactUs"
                    
                }

        //         NotificationCenter.default.post(name: Notification.Name(notificationName), object: nil,userInfo:nil )
    }

}

extension MoreViewController:  UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titlesArry.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MoreTableViewCell
       
        cell.lblTxt.text = titlesArry[indexPath.row]
        cell.btnAction.tag = indexPath.row
        cell.btnAction.addTarget(self, action: #selector(openMore(sender:)), for: .touchUpInside)
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
          return 55
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        

          
        
    }
  func handelMyOrdersListAction()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyOrdersListViewController") as! MyOrdersListViewController
         vc.modalPresentationStyle = .fullScreen
        
        General.sharedInstance.tabBarController.present(vc, animated:true, completion: nil)

    }
    
    
     func handleCntactUs()
      {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactUSViewController") as! ContactUSViewController
           vc.modalPresentationStyle = .fullScreen
          
          self.present(vc, animated:true, completion: nil)

      }
    
    
     func handleChangeLang()
         {
            let popup = PopupController
                .create(self)
                .customize(
                    [
                        .layout(.center),
                        .animation(.fadeIn),
                        .backgroundStyle(.blackFilter(alpha: 0.8)),
                        .dismissWhenTaps(true)
                    ]
                )
                .didShowHandler { _ in
                    
                }
                .didCloseHandler { _ in
                    
            }

            let container = ChangeLangViewController.instance()

            container.closeHandler =
                {
                popup.dismiss()
            }

            popup.show(container)

           
         }
    
    func share(message: String, link: String)
    {
        if let link = NSURL(string: link) {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    
}





