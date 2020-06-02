//
//  MaleAndFemalViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/27/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class MaleAndFemalViewController: UIViewController {

    @IBOutlet weak var btnFemal: UIButton!
     @IBOutlet weak var btnMale: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    btnMale.setTitle(sDefaults().getStringForKey(key:
            "Pages.MaleFemale.Male"), for: .normal)
    btnFemal.setTitle(sDefaults().getStringForKey(key:
        "Pages.MaleFemale.Female"), for: .normal)
        btnMale.layer.cornerRadius = 20
               btnMale.clipsToBounds = true
               btnMale.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
               btnMale.addShadowImage(parentview: btnMale, shadowColor: .lightGray)
        
        
        btnFemal.layer.cornerRadius = 20
        btnFemal.clipsToBounds = true
        btnFemal.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        btnFemal.addShadowImage(parentview: btnFemal, shadowColor: .lightGray)

    }
    
    @IBAction func MaleAndFemalAction(sender: UIButton)
      {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")as! LoginViewController
          
                vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
      }

   
}
