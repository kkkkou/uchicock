//
//  IngredientRecommendTableViewCell.swift
//  uchicock
//
//  Created by Kou Kinyo on 2019/06/22.
//  Copyright © 2019 Kou. All rights reserved.
//

import UIKit

class IngredientRecommendTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var ingredientName: String? = String(){
        didSet{
            ingredientNameLabel.textColor = Style.labelTextColor
            ingredientNameLabel.text = ingredientName
        }
    }

    var ingredientDescription: String? = String(){
        didSet{
            descriptionLabel.textColor = Style.secondaryColor
            descriptionLabel.text = ingredientDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
