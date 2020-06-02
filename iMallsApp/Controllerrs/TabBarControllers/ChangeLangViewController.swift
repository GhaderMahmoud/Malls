//
//  ChangeLangViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/27/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import MOLH

class ChangeLangViewController: UIViewController
{

    var closeHandler: (() -> Void)?
    var isAppleSelected = 0
    @IBOutlet weak var btnEnglish: UIButton!
    @IBOutlet weak var btnArabic: UIButton!
    
    @IBOutlet weak var btnChange: UIButton!

        override func viewDidLoad()
        {
            super.viewDidLoad()
            btnEnglish.tag = 0
            btnArabic.tag = 1
            
        }
        class func instance() -> ChangeLangViewController
        {
            let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
             
            if let popupVC = storyboard.instantiateViewController(withIdentifier: "ChangeLangViewController") as? ChangeLangViewController
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
    @IBAction func ChoseLang(_ sender: UIButton)
    {
        if sender.tag == 0
        {
            isAppleSelected = 0
        }
        else if sender.tag == 1
        {
            isAppleSelected = 1
        }
    }
    
    
    
    @IBAction func ChangeAction(_ sender: UIButton)
    {
    
        MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
        let delegate = UIApplication.shared.delegate as? AppDelegate
                   delegate?.switchRoot()
    }
}
extension ChangeLangViewController : PopupContentViewController
{
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize
    {
        return CGSize(width: 374, height: 374)
    }
}
