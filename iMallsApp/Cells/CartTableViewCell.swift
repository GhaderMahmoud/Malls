//
//  CartTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/23/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var btnBlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblLastPrice: UILabel!
    @IBOutlet weak var lblNewPrice: UILabel!
    @IBOutlet weak var lblQuantityNum: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblProductNam: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
