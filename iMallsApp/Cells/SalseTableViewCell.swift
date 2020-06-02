//
//  SalseTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/18/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import Cosmos
class SalseTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewRating: CosmosView!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var brnLike: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
