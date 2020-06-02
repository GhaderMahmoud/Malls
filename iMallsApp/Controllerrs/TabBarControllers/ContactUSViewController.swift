//
//  ContactUSViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/25/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class ContactUSViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var btnnotification: UIButton!
    @IBOutlet weak var btnFavorit: UIButton!
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var tvMessage: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tvMessage.delegate = self
        tvMessage.text = "Message body will write here ..."
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
           
           if textView.text ==    "Message body will write here ..."
           {
               textView.text = ""
               
           }
           
       }
       
       func textViewDidEndEditing(_ textView: UITextView) {
           
           if textView.text.count == 0
           {
               textView.text = "Message body will write here ..."
               
           }
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
    //             btnnotification.setImage(UIImage.init(named: "notification"), for: .normal)
//                  vc.modalPresentationStyle = .fullScreen
                 present(vc, animated: true, completion: nil)
             }

    @IBAction func BackAction(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
        }
        
    
   
}
