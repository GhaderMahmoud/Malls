//
//  DiscountViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/26/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class DiscountViewController: UIViewController {
    
        let screenRect = UIScreen.main.bounds
        var screenWidth = 0.0
        
        @IBOutlet weak var viewSearch: UIView!
      
    override func viewDidLoad() {
            super.viewDidLoad()

            screenWidth = Double(screenRect.size.width) - 20

            
//            viewSearch.layer.cornerRadius = 6
//            
//            viewSearch.addShadowImage(parentview: viewSearch, shadowColor: .lightGray)
        }

    @IBAction func BackAction(_ sender: UIButton)
    {
           self.dismiss(animated: true, completion: nil)
           
       }
     @IBAction func CartAction(_ sender: UIButton)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
//             vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        @IBAction func FavoriteAction(_ sender: UIButton)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController")as! FilterANdArrangeViewController
//                  vc.modalPresentationStyle = .fullScreen
                 present(vc, animated: true, completion: nil)
             }
    @IBAction func SearchAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
//         vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func NotificationAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestFeedBackViewController")as! RequestFeedBackViewController
//             btnnotification.setImage(UIImage.init(named: "notification"), for: .normal)
//              vc.modalPresentationStyle = .fullScreen
             present(vc, animated: true, completion: nil)
         }
    
  @objc  func openAllProducts(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController")as! FilterANdArrangeViewController
//              vc.modalPresentationStyle = .fullScreen
             present(vc, animated: true, completion: nil)
         }
}
    extension DiscountViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
    {
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 3
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return 4
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OfferDiscountCollectionViewCell


                
                 return cell
        }
            
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            
    //             return CGSize(width:180, height: 191)
    //        return CGSize(width: (self.view.frame.width - 4)/2 , height:191)
            
            return CGSize (width:CGFloat(screenWidth/2-4),height: CGFloat(screenWidth/2-6));

        }
        
        
        
        
        

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            
            return CGSize(width: view.frame.size.width, height:50)

        }
        

        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

     
                   
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                      let reusableview = collectionView.dequeueReusableCell(withReuseIdentifier: "cellHeader", for: indexPath) as! OfferDiscountCollectionViewCell
                      reusableview.btnAllProducts.addTarget(self, action: #selector(openAllProducts(_:)), for: .touchUpInside)
                      
                
                           reusableview.frame = CGRect(x: 0 , y: 0, width: 137, height: 137)

       reusableview.btnShopName.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
                             
                           
                             
                         reusableview.btnShopName.layer.cornerRadius = 20
                             reusableview.btnShopName.clipsToBounds = true
                      
                      
                      if indexPath.section == 0 {
                        reusableview.btnAllProducts.isHidden = false
                      }else
                      {
                        reusableview.btnAllProducts.isHidden = true

                      }
                          
                          if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                              layout.sectionHeadersPinToVisibleBounds = true
                          }
                          
//                          reusableview.backgroundColor = .systemBackground
                          
                          
                          return reusableview

            default:  fatalError("Unexpected element kind")
                    }
                    
            }
            
        
        
        
    }
