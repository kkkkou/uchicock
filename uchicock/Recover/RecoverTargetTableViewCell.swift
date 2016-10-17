//
//  RecoverTargetTableViewCell.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/04/30.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit
import ChameleonFramework
import M13Checkbox

class RecoverTargetTableViewCell: UITableViewCell {

    @IBOutlet weak var isTarget: M13Checkbox!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    
    var isRecoverable: Bool = Bool(){
        didSet{
            isTarget.stateChangeAnimation = .expand(.fill)
            isTarget.animationDuration = 0.3
            previewLabel.textColor = FlatGrayDark()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}