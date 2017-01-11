//
//  RootTableViewCell.swift
//  JFPorject
//
//  Created by dujinfeng481 on 14-11-26.
//  Copyright (c) 2014年 djf. All rights reserved.
//

import UIKit

class RootTableViewCell: UITableViewCell {

    @IBOutlet weak var leftIconImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
