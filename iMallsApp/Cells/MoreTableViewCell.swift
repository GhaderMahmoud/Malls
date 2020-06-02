//
//  MoreTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/26/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTxt : UILabel!
    @IBOutlet weak var btnAction : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
