//
//  MallsNameViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/17/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class MallsNameViewController: UIViewController {
    let screenRect = UIScreen.main.bounds
    var screenWidth = 0.0
    
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var viewSearch: UIView!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        screenWidth = Double(screenRect.size.width) - 20

        
//        viewSearch.layer.cornerRadius = 6
//        
//        viewSearch.addShadowImage(parentview: viewSearch, shadowColor: .lightGray)
    }
    @IBAction func CartAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
         vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func FavoriteAction(_ sender: UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController")as! FilterANdArrangeViewController
              vc.modalPresentationStyle = .fullScreen
             present(vc, animated: true, completion: nil)
         }
    @IBAction func SearchAction(_ sender: Any) {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
           vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
          
          
          
      }
    
    @IBAction func NotificationAction(_ sender: Any) {
       
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestFeedBackViewController")as! RequestFeedBackViewController
     
         vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    
    
    

}

extension MallsNameViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FamousMallCollectionViewCell

//        cell.backgroundColor = .red
//cell.img.layer.cornerRadius = 8
//        cell.bgView.layer.cornerRadius = 8
//            cell.bgView.addShadowImage(parentview: cell.bgView, shadowColor:.lightGray)
            
             return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize (width:CGFloat(screenWidth/2-4),height: CGFloat(screenWidth/2-6));

    }
 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
            
             vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true, completion: nil)
            
       
    }
    
    
    
}
