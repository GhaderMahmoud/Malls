//
//  RegisterViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/17/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
let MAX_LENGTH_PHONENUMBER = 100
let ACCEPTABLE_NUMBERS     = "0123456789"

class RegisterViewController: UIViewController {

      @IBOutlet weak var vW1: UIView!
      @IBOutlet weak var vW2: UIView!
      @IBOutlet weak var vW3: UIView!
      @IBOutlet weak var vW4: UIView!
      @IBOutlet weak var vW5: UIView!
    
    @IBOutlet weak var btnAccount: UIButton!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfPass
    : UITextField!
    @IBOutlet weak var tfConfirmPass: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tfUserName.textColor = UIColor.black
        tfPass.textColor = UIColor.black
        tfConfirmPass.textColor = UIColor.black
        tfPhone.textColor = UIColor.black
        tfEmail.textColor = UIColor.black
        

        vW1.addShadowImage(parentview: vW1, shadowColor:.lightGray)
        vW2.addShadowImage(parentview: vW2, shadowColor:.lightGray)
        vW3.addShadowImage(parentview: vW3, shadowColor:.lightGray)
        vW4.addShadowImage(parentview: vW4, shadowColor:.lightGray)
        vW5.addShadowImage(parentview: vW5, shadowColor:.lightGray)
        
        btnAccount.addShadowImage(parentview: btnAccount, shadowColor:.lightGray)
        btnAccount.setTitle(sDefaults().getStringForKey(key:"Pages.Register.CreateNewAccount"), for: .normal)
        tfPhone.placeholder = sDefaults().getStringForKey(key:"Pages.Register.PhoneNumber")
        tfUserName.placeholder = sDefaults().getStringForKey(key:"Pages.Login.UserName")
        tfEmail.placeholder = sDefaults().getStringForKey(key:"Pages.Register.Email")
        tfPass.placeholder = sDefaults().getStringForKey(key:"Pages.Register.Password")
        tfConfirmPass.placeholder = sDefaults().getStringForKey(key:"Pages.Register.ConfirmPassword")
        tfPass.placeholder = sDefaults().getStringForKey(key:"Pages.Login.Password")

    }
    func validateText() -> Bool
            {
            var result : Bool = true
                if (tfUserName.text == "")
                {
    AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Register.RequiredUserName"), vc: self)
                    result = false
                }
               else if (tfEmail.text == "")
                {
    AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Register.RequiredEmail"), vc: self)
                    result = false
                }
                else if !General.validateEmail(email:tfEmail.text)
                {
    AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Register.RequiredEmailNotValid"), vc: self)
                    result = false
                }
                else if (tfPhone.text == "")
                {
    AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Register.RequiredPhoneNumber"), vc: self)
                   result = false
                }
                 else if (tfPass.text == "")
                 {
    AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Register.RequiredPassword"), vc: self)
                                result = false
                 }
                    else if (tfPass.text!.count < 8)
                    {
    AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Register.RequiredPassword"), vc: self)
                       result = false
                    }
                else if (tfConfirmPass.text == "")
                {
    AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Register.RequiredConfirmPassword"), vc: self)
                    result = false
                }
                else if (tfConfirmPass.text != tfPass.text)
                {
    AlertManager().showToast(strMessage:sDefaults().getStringForKey(key:"Pages.Register.PasswordDontMatch"), vc: self)
                    result = false
                }
                return result
            }
       func textFieldDidEndEditing(_ textField: UITextField)
        {
            let _ = validateText()
        }
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
        {
            if textField == tfPhone
            {
            let newLength: Int = textField.text!.count + string.count - range.length
            let numberOnly = NSCharacterSet.init(charactersIn: ACCEPTABLE_NUMBERS).inverted
            let strValid = string.rangeOfCharacter(from: numberOnly) == nil
            return (strValid && (newLength <= MAX_LENGTH_PHONENUMBER))
        }
            return true
        }
        
    
    
    @IBAction func BackAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func CreatNewAccount(_ sender: Any)
    {
        openTabBar()
        
    }
   
}
