//
//  RecoverTargetTableViewCell.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/04/30.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit

class RecoverTargetTableViewCell: UITableViewCell {

    @IBOutlet weak var isTarget: CircularCheckbox!
    @IBOutlet weak var recipeNameLabel: CustomLabel!
    @IBOutlet weak var previewLabel: UILabel!
    @IBOutlet weak var newRecipeLabel: UILabel!
    @IBOutlet weak var newRecipeLabelWidthConstraint: NSLayoutConstraint!
    
    var version73NewDownload = false

    var isRecoverable: Bool = Bool(){
        didSet{
            isTarget.stateChangeAnimation = .expand
            isTarget.animationDuration = 0.3
            previewLabel.textColor = UchicockStyle.labelTextColorLight
        }
    }
    
    var recipeName = String(){
        didSet{
            recipeNameLabel.text = recipeName
            if recipeName.isNewRecipe() && version73NewDownload == false {
                newRecipeLabel.isHidden = false
                newRecipeLabelWidthConstraint.constant = 30
                newRecipeLabel.backgroundColor = UIColor.clear
                newRecipeLabel.textColor = UchicockStyle.alertColor
            }else{
                newRecipeLabel.isHidden = true
                newRecipeLabelWidthConstraint.constant = 0
            }
        }
    }
}
