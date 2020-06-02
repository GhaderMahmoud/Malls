//
//  LoginViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/17/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var vW1: UIView!
    @IBOutlet weak var btnForgotPass: UIButton!
    @IBOutlet weak var vW2: UIView!
    @IBOutlet weak var btnAccount: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblWith: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfUserName.textColor = UIColor.black
        tfPassword.textColor = UIColor.black
btnAccount.setTitle(sDefaults().getStringForKey(key:"Pages.Login.NewAccount"), for: .normal)
btnLogin.setTitle(sDefaults().getStringForKey(key:"Pages.Login.Login"), for: .normal)
    tfUserName.placeholder = sDefaults().getStringForKey(key:"Pages.Login.UserName")
    tfPassword.placeholder = sDefaults().getStringForKey(key:"Pages.Login.Password")
 btnForgotPass.setTitle(sDefaults().getStringForKey(key:"Pages.Login.ForgetPassword"), for: .normal)
lblWith.text = sDefaults().getStringForKey(key:"Pages.Login.ThroughSocialMedia")

        vW1.addShadowImage(parentview: vW1, shadowColor: .lightGray)
     
        vW2.addShadowImage(parentview: vW2, shadowColor: .lightGray)
        btnLogin.addShadowImage(parentview: btnLogin, shadowColor: .lightGray)
    }
    
 @IBAction func LoginAction(_ sender: Any)
    { if (Utilites.sharedInstance.trim(tfUserName.text!)).count == 0
        {
            AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Login.RequiredUserName"), vc: self)
            return
        } else if (Utilites.sharedInstance.trim(tfPassword.text!)).count == 0
        {
            AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Login.RequiredPassword"), vc: self)
        return
        }
    //calling Service
     openTabBar()
    }
    
    @IBAction func NewAccountAction(_ sender: Any)
    {
    
        let vc  =  self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController")as! RegisterViewController
        
      vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    

    @IBAction func ForgotPassAction(_ sender: Any) {
    }
}
