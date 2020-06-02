//
//  SearchTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/23/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnProducts: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
