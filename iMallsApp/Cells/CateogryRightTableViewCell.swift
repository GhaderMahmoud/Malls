//
//  CateogryRightTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/20/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class CateogryRightTableViewCell: UITableViewCell
{
    @IBOutlet weak var btnCategory: UIButton!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
