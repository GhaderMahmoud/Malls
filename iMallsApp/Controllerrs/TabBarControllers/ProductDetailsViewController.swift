//
//  ProductDetailsViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/21/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import Cosmos

class ProductDetailsViewController: UIViewController ,UIPickerViewDataSource,UIPickerViewDelegate {

    
    var oldView : UIView?
    var selectedView : UIView?
    
    @IBOutlet weak var numbers: UIPickerView!
    var selectedValue = ""

    let NUmbers = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20"]
    
    var colorsArray = [#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) , #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) ,#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)]
    var sizesArray = ["2XL","XL","L","M","S"]
    @IBOutlet weak var tableHeightConstrains: NSLayoutConstraint!
    
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var btnFavorit: UIButton!
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var colorCollection: UICollectionView!
    @IBOutlet weak var SizesCollection: UICollectionView!
    @IBOutlet weak var CommentsTable: UITableView!
    @IBOutlet weak var viewRating: CosmosView!
    @IBOutlet weak var lblSizes: UILabel!
    @IBOutlet weak var lblSpecifications: UILabel!
    @IBOutlet weak var lblColors: UILabel!
    @IBOutlet weak var viewpic: UIView!
    @IBOutlet weak var btnAddComments: UIButton!
    
    @IBOutlet weak var img: UIImageView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return NUmbers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return NUmbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        

        selectedValue = NUmbers[row]
        
    }
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        img.layer.cornerRadius = 8
        img.clipsToBounds = true
        img.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    
        
        numbers.delegate = self
        numbers.dataSource = self
        
        viewpic.layer.borderWidth = 0.4
        
        viewpic.addShadowImage(parentview:viewpic , shadowColor: .gray)
        tableHeightConstrains.constant = 10 * 60
//        scrollViewHeight.constant += tableHeightConstrains.constant - 250
        scrollViewHeight.constant += tableHeightConstrains.constant
        self.loadViewIfNeeded()
        btnAddComments.addShadowImage(parentview: btnAddComments, shadowColor: .lightGray)
            
        selectedValue = NUmbers[0] // default value
        
       
        
    }
    
    
    @IBAction func BackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        @IBAction func SearchAction(_ sender: UIButton)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
             vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        @IBAction func NotificationAction(_ sender: UIButton)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RequestFeedBackViewController")as! RequestFeedBackViewController
    //             btnnotification.setImage(UIImage.init(named: "notification"), for: .normal)
                  vc.modalPresentationStyle = .fullScreen
                 present(vc, animated: true, completion: nil)
             }

    
    @IBAction func AddToCartAction(_ sender: Any)
    {
    let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        
         vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
   
    @IBAction func AddComentAction(_ sender: UIButton)
    {
    let popup = PopupController
            .create(self)
            .customize(
                [
                    .layout(.center),
                    .animation(.fadeIn),
                    .scrollable(false),
                    .dismissWhenTaps(false),
                    .backgroundStyle(.blackFilter(alpha: 0))
                ]
            )
            .didShowHandler { _ in
                print("showed popup!")
            }
            .didCloseHandler { _ in
                print("closed popup!")
        }

        let container = CommentPopUpViewController.instance()
        container.closeHandler =
            {
            popup.dismiss()
        }

        popup.show(container)

    }
    

}

extension ProductDetailsViewController:  UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CommentsTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
          return 79
        
    }
    
    
    
    
    
    
}


extension ProductDetailsViewController: UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ColorsCollectionViewCell
        
        if collectionView == SizesCollection{
            cell.lblSize.text = sizesArray[indexPath.row]
//            cell.bgView.backgroundColor = colorsArray[indexPath.row]

        }else
        {
            cell.bgView.backgroundColor = colorsArray[indexPath.row]

        }
        
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
       
        return CGSize(width: 40 , height:40)
        
        
        
        
    
}

}
