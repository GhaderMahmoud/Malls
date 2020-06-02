//
//  FilterANdArrangeViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/20/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class FilterANdArrangeViewController: UIViewController {
    let screenRect = UIScreen.main.bounds
    var screenWidth = 0.0

    @IBOutlet weak var viewSearch: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        screenWidth = Double(screenRect.size.width) - 20
        viewSearch.addShadowImage(parentview: viewSearch, shadowColor: .lightGray)
        
    }
    

    @IBAction func ArrangeAction(_ sender: Any) {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "ArrangPopUpViewController")as!ArrangPopUpViewController
        controller.view.frame = self.view.bounds;
        controller.willMove(toParent: self)
        self.view.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    
   @IBAction func BackAction(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    
    
    }
    
    @IBAction func filterAction(_ sender: Any) {
        
        if #available(iOS 11.0, *) {
if  let controller = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController
            {
                
                controller.view.frame = self.view.bounds;
                controller.willMove(toParent: self)
                self.view.addSubview(controller.view)
                self.addChild(controller)
                controller.didMove(toParent: self)
            }
        } else {
            // Fallback on earlier versions
        }
       
    

}
}

extension FilterANdArrangeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OffersCollectionViewCell
        
        cell.lblPrice.text = "40 " + sDefaults().getStringForKey(key:"Pages.Common.EnKW")
        cell.bgView.addShadowImage(parentview:cell.bgView , shadowColor: .lightGray)
            
        cell.bgView.layer.borderColor = UIColor.gray.cgColor
        cell.bgView.layer.borderWidth = 0.3
        
             return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize (width:CGFloat(screenWidth/2-4),height: 210);

    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        
//        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
        
    }
  
}
