//
//  HomeViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/17/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import Cosmos

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblStrFamous: UILabel!
    @IBOutlet weak var lblStrSales: UILabel!
    @IBOutlet weak var lblStrOffers: UILabel!
    
    @IBOutlet weak var viewScrollHeight: NSLayoutConstraint!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var padgingCollection: UICollectionView!
    @IBOutlet weak var famousMallCollection: UICollectionView!
    @IBOutlet weak var RecentOfferCollection: UICollectionView!
    @IBOutlet weak var SalesTable: UITableView!
    @IBOutlet weak var btnFamousNext: UIButton!
    @IBOutlet weak var btnFamousPrevious: UIButton!
    @IBOutlet weak var btnOfferNext: UIButton!
    @IBOutlet weak var btnOfferPrevious: UIButton!
    @IBOutlet weak var btnNextPadger: UIButton!
    @IBOutlet weak var btnPreviousPadger: UIButton!
    
    override func viewWillAppear(_ animated: Bool)
    {
//        toggleSideMenuView()
//     showSideMenuView()
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
              vc.modalPresentationStyle = .fullScreen
             present(vc, animated: true, completion: nil)
         }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblStrSales.text = sDefaults().getStringForKey(key:"Pages.Home.RecentSales")
        lblStrFamous.text = sDefaults().getStringForKey(key:"Pages.Home.FamousMall")
        lblStrOffers.text = sDefaults().getStringForKey(key:"Pages.Home.RecentOffers")
        tableHeight.constant = 10 * 87
        viewScrollHeight.constant += ( tableHeight.constant - 361)
        self.loadViewIfNeeded()
        padgingCollection.reloadData()
        
        btnNextPadger.layer.cornerRadius = btnNextPadger.frame.width / 2
         btnPreviousPadger.layer.cornerRadius = btnPreviousPadger.frame.width / 2
        
        btnOfferNext.layer.cornerRadius = btnOfferNext.frame.width / 2
        btnOfferPrevious.layer.cornerRadius = btnOfferPrevious.frame.width / 2
        
        btnFamousNext.layer.cornerRadius = btnFamousNext.frame.width / 2
         btnFamousPrevious.layer.cornerRadius = btnOfferPrevious.frame.width / 2
      
    }
    
    
    @IBAction func TestAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController")as! CartViewController
        
        
              vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true, completion: nil)
        
    }
    
    
}

extension HomeViewController:  UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var layerMaxXMaxYCorner: CACornerMask?
//        var layerMaxXMinYCorner: CACornerMask?
//        var layerMinXMaxYCorner: CACornerMask?
//        var layerMinXMinYCorner: CACornerMask?
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SalseTableViewCell

        cell.lblPrice.text = "40 " + sDefaults().getStringForKey(key:"Pages.Common.EnKW")
        
         cell.lblProductName.text = "product Name"
         cell.bgView.addShadowImage(parentview: cell.bgView, shadowColor: .lightGray)
        
        cell.bgView.layer.cornerRadius = 8
    
       cell.img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        cell.img.layer.cornerRadius = 8
        cell.img.clipsToBounds = true
            
            
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
          return 87
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc =  self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController")as! ProductDetailsViewController
          vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
}


extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if   collectionView == padgingCollection {
            return 5
            
        }else if collectionView == padgingCollection {
            
            return 10
        }else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        if collectionView == padgingCollection
        {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PadgerCollectionViewCell
            
            
            
            
            return cell
            
        }else if collectionView == famousMallCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FamousMallCollectionViewCell
//
            cell.bgView.layer.cornerRadius = 6
            cell.bgView.layer.cornerRadius = 6
            cell.bgView.addShadowImage(parentview: cell.bgView, shadowColor:.lightGray)
            
            
             return cell
            
            
        }else {
            
          let collectionView = RecentOfferCollection
            let cell = collectionView!.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OffersCollectionViewCell
      cell.bgView.layer.cornerRadius = 6
      cell.bgView.layer.cornerRadius = 6
            cell.bgView.addShadowImage(parentview: cell.bgView, shadowColor:.lightGray)
            cell.lblPrice.text = "40 " + sDefaults().getStringForKey(key:"Pages.Common.EnKW")
             
            return cell
            
        }
        
       
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == padgingCollection{
        
            return CGSize(width: self.view.frame.width, height:198)
       
        } else if collectionView == famousMallCollection
        {
             return CGSize(width:137 , height: 137)
            
        }else {
              return CGSize(width: 137 , height: 179)
            
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == RecentOfferCollection
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterANdArrangeViewController") as! FilterANdArrangeViewController
            
             vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true, completion: nil)
            
        }
        if collectionView == famousMallCollection
        {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
            
             vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: true, completion: nil)
            
        }
    }
}
