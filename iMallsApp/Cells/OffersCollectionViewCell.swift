//
//  OffersCollectionViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/18/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import Cosmos

class OffersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewRating: CosmosView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var bgView: UIView!
    
}
