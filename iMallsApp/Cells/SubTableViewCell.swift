//
//  SubTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/26/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit

class SubTableViewCell: UITableViewCell {
    @IBOutlet weak var imgSelect: UIImageView!

    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var lblSubsectionname: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func selecting()
    {
        self.imgSelect.isHidden = !self.imgSelect.isHidden

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
