//
//  TabBarViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/20/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController  {
        
    @IBAction func OpenTab1()
    {
        self.selectedIndex = 0
    }
    
    @IBAction func OpenTab2()
    {
        self.selectedIndex = 1
    }
    
    @IBAction func OpenTab3()
    {
        self.selectedIndex = 2
    }
    
    @IBAction func OpenTab4()
    {
        self.selectedIndex = 3
    }
    
    @IBAction func OpenTab5()
    {
        self.selectedIndex = 4
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        NotificationCenter.default.addObserver(self, selector: #selector(OpenTab1), name: NSNotification.Name(rawValue: "OpenTab1"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(OpenTab2), name: NSNotification.Name(rawValue: "OpenTab2"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(OpenTab3), name: NSNotification.Name(rawValue: "OpenTab3"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(OpenTab4), name: NSNotification.Name(rawValue: "OpenTab4"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(OpenTab5), name: NSNotification.Name(rawValue: "OpenTab5"), object: nil)

        
        tabBar.tintColor = .white
//        tabBar.barTintColor = .petrol
        
        let tabBarItem0 = tabBar.items?[0]
//        let unselectedImage = UIImage(named: "tab0.png")
//        let selectedImage = UIImage(named: "tab0selected.png")
//        tabBarItem0?.image = unselectedImage?.withRenderingMode(.alwaysOriginal)
//        tabBarItem0?.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        tabBarItem0?.title = "Home"
        
        
        
        let tabBarItem1 = tabBar.items?[1]
//        let unselectedImage1 = UIImage(named: "tab1.png")
//        let selectedImage1 = UIImage(named: "tab1selected.png")
//        tabBarItem1?.image = unselectedImage1?.withRenderingMode(.alwaysOriginal)
//        tabBarItem1?.selectedImage = selectedImage1?.withRenderingMode(.alwaysOriginal)
        tabBarItem1?.title = "Categories"
        
        
        let tabBarItem2 = tabBar.items?[2]
//        let unselectedImage2 = UIImage(named: "tab2.png")
//        let selectedImage2 = UIImage(named: "tab2selected.png")
//        tabBarItem2?.image = unselectedImage2?.withRenderingMode(.alwaysOriginal)
//        tabBarItem2?.selectedImage = selectedImage2?.withRenderingMode(.alwaysOriginal)
        tabBarItem2?.title = "Offers"
        
        
        
        let tabBarItem3 = tabBar.items?[3]
//        let unselectedImage3 = UIImage(named: "tab3.png")
//        let selectedImage3 = UIImage(named: "tab3selected.png")
//        tabBarItem3?.image = unselectedImage3?.withRenderingMode(.alwaysOriginal)
//        tabBarItem3?.selectedImage = selectedImage3?.withRenderingMode(.alwaysOriginal)
        tabBarItem3?.title = "Malls"
        
        
        let tabBarItem4 = tabBar.items?[4]
//        let unselectedImage4 = UIImage(named: "tab4.png")
//        let selectedImage4 = UIImage(named: "tab4selected.png")
//        tabBarItem4?.image = unselectedImage4?.withRenderingMode(.alwaysOriginal)
//        tabBarItem4?.selectedImage = selectedImage4?.withRenderingMode(.alwaysOriginal)
        tabBarItem4?.title = "More"
        
        
        
        
        
        
    }
    
    
   
}
