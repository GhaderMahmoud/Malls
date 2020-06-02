//
//  AppDelegate.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/16/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import MOLH
let defaults = UserDefaults.standard
let uuid = UIDevice.current.identifierForVendor?.uuidString

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable
{
    func reset()
    {
        switchRoot()
    }
    
 var window: UIWindow?
//window = window ?? UIWindow()
//
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
         let  vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController

         self.window!.rootViewController = vc
         self.window!.makeKeyAndVisible()
               MOLHLanguage.setDefaultLanguage("en")
               MOLH.shared.activate(true)
               MOLH.shared.specialKeyWords = ["Cancel","Done"]
        return true
    }
    func switchRoot()
    {
        let objGeneral = General.sharedInstance

        objGeneral.tabBarController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController

            objGeneral.tabBarController.selectedIndex = 0 //home
        objGeneral.tabBarController.navigationController?.navigationBar.isHidden = true

        objGeneral.tabBarController.modalPresentationStyle = .fullScreen
            
        
        if let delegate:AppDelegate = UIApplication.shared.delegate as? AppDelegate
        {
            
            delegate.window!.rootViewController = objGeneral.tabBarController
             General.CreateCustomeTapBar()
        }

}
}

