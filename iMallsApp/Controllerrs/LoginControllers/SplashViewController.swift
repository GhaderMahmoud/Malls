//
//  SplashViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/18/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

 
    override func viewDidLoad() {
        super.viewDidLoad()

        OpenLogin()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0)
//        {
//            openTabBar()
//        }
    }
    
    func OpenLogin(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0)
        {
  
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "IntroViewController")as! IntroViewController

                 vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
    }
    }
    


}
extension UIViewController
{
    func openTabBar(){
    let objGeneral = General.sharedInstance
                               
    objGeneral.tabBarController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController
                               
        objGeneral.tabBarController.selectedIndex = 0 //home
    objGeneral.tabBarController.navigationController?.navigationBar.isHidden = true
                               
    objGeneral.tabBarController.modalPresentationStyle = .fullScreen
                        
    self.present(objGeneral.tabBarController, animated: false, completion: {
                            
        General.CreateCustomeTapBar()

    })
            }
        func popUpViewController(identifier:String) -> UIViewController
        {
        let popOverVC = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: identifier)
            self.addChild(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
        return popOverVC
        }
        func showAnimate()
        {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            UIView.animate(withDuration: 0.25, animations: {
                self.view.alpha = 1.0
                self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            });
        }
        
        func removeAnimate()
        {
            UIView.animate(withDuration: 0.25, animations: {
                self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
            });
        }
}
