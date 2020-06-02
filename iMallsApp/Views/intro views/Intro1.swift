//
//  Intro1.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/27/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import FSPagerView

class Intro1: FSPagerViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.backgroundColor = .clear
        // Initialization code
    }
}
