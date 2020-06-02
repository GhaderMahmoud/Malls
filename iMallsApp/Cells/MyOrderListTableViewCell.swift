//
//  MyOrderListTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/20/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class MyOrderListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblStatuse: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var lblRequestCode: UILabel!
    
    @IBOutlet weak var lblCodeNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
