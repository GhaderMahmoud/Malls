//
//  FilterTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/26/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import ExpandableCell

class FilterTableViewCell: ExpandableCell {
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var imgSelect: UIImageView!
    @IBOutlet weak var lblCategoryName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func selecting()
       {
           self.imgSelect.isHidden = !self.imgSelect.isHidden

       }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
