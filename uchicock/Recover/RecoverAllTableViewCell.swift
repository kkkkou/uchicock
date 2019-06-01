//
//  RecoverAllTableViewCell.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/04/30.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit

class RecoverAllTableViewCell: UITableViewCell {

    @IBOutlet weak var recoverAll: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recoverAll.textColor = Style.secondaryColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
