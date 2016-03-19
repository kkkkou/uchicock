//
//  AppDelegate.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/02/20.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        // first time to launch this app
        let defaults = NSUserDefaults.standardUserDefaults()
        let dic = ["firstLaunch": true]
        defaults.registerDefaults(dic)
        if defaults.boolForKey("firstLaunch") {
            self.addSampleIngredient()
            self.addSampleRecipe()
            defaults.setBool(false, forKey: "firstLaunch")
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func addSampleIngredient(){
        addIngredient("テキーラ", stockFlag: false, memo: "メキシコ産")
        addIngredient("オレンジジュース", stockFlag: false, memo: "オレンジジュースです")
        addIngredient("グレナデンシロップ", stockFlag: false, memo: "シロップです")
        addIngredient("クリーム・ド・カシス", stockFlag: false, memo: "")
        addIngredient("ジン", stockFlag: false, memo: "")
        addIngredient("トニックウォーター", stockFlag: false, memo: "")
        addIngredient("カルーア", stockFlag: false, memo: "")
        addIngredient("牛乳", stockFlag: false, memo: "")
    }
    
    func addIngredient(ingredientName: String, stockFlag: Bool, memo: String){
        let realm = try! Realm()
        let ingredient = Ingredient()
        ingredient.ingredientName = ingredientName
        ingredient.stockFlag = stockFlag
        ingredient.memo = memo
        try! realm.write {
            realm.add(ingredient)
        }
    }
    
    func addSampleRecipe() {
        addRecipe("テキーラサンライズ", favorites: 1, memo: "きれいな色です", method: 1)
        addRecipe("カシスオレンジ", favorites: 1, memo: "ソフトドリンクみたい", method: 1)
        addRecipe("ジントニック", favorites: 1, memo: "定番", method: 1)
        addRecipe("カルーアミルク", favorites: 1, memo: "飲みやすい", method: 1)
    }
    
    func addRecipe(recipeName:String, favorites:Int, memo:String, method:Int){
        let realm = try! Realm()
        let recipe = Recipe()
        recipe.recipeName = recipeName
        recipe.favorites = favorites
        recipe.memo = memo
        recipe.method = method
        try! realm.write {
            realm.add(recipe)
        }
    }

}

