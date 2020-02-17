//
//  Recipe.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/02/24.
//  Copyright © 2016年 Kou. All rights reserved.
//

import RealmSwift

class Recipe: Object {
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var recipeName = ""
    @objc dynamic var katakanaLowercasedNameForSearch = ""
    @objc dynamic var strength = 4
    @objc dynamic var favorites = 0
    @objc dynamic var method = 0
    @objc dynamic var memo = ""
    @objc dynamic var imageFileName: String? = nil
    @objc dynamic var shortageNum = 0
    @objc dynamic var lastViewDate : Date? = nil
    @objc dynamic var madeNum = 0
    @objc dynamic var style = 3
    @objc dynamic var bookmarkDate : Date? = nil
    var recipeIngredients = List<RecipeIngredientLink>()
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    func updateShortageNum(){
        var num = 0
        for ri in self.recipeIngredients{
            if ri.mustFlag && ri.ingredient.stockFlag == false {
                num += 1
            }
        }
        self.shortageNum = num
    }    
}
