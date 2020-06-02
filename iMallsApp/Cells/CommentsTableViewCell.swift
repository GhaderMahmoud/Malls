//
//  CommentsTableViewCell.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/22/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import Cosmos
class CommentsTableViewCell: UITableViewCell {

   
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    
    @IBOutlet weak var viewRate: CosmosView!
    
    @IBOutlet weak var lblComment: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
