//
//  CommentPopUpViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/23/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import Cosmos
class CommentPopUpViewController: UIViewController,UITextViewDelegate
{

    var closeHandler: (() -> Void)?
    @IBOutlet weak var tvMessage: UITextView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var viewText: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tvMessage.delegate = self
        tvMessage.text = "Write your Comment ....."
        viewText.addShadowImage(parentview: viewText, shadowColor: .lightGray)
        
        btnSend.addShadowImage(parentview: btnSend, shadowColor: .lightGray)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.text == "Write your Comment ....."
        {
            textView.text = ""
            
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.count == 0
        {
            textView.text = "Write your Comment ....."
            
        }
    }
    class func instance() -> CommentPopUpViewController
       {
           let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
            
           if let popupVC = storyboard.instantiateViewController(withIdentifier: "CommentPopUpViewController") as? CommentPopUpViewController
           {
               return popupVC
           } else {
               fatalError("Unable to get storyboard")
           }
       }
    
    @IBAction func CloseAction(_ sender: Any)
    {
      closeHandler?()
     
    }
    
    

}
extension CommentPopUpViewController: PopupContentViewController
{
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize
    {
        return CGSize(width: 374, height: 374)
    }
}
