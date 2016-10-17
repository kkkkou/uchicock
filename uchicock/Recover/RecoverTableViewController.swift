//
//  RecoverTableViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/04/30.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
import M13Checkbox
import SVProgressHUD

class RecoverTableViewController: UITableViewController {

    var userRecipeNameList = Array<String>()
    var recoverableSampleRecipeList = Array<SampleRecipeBasic>()
    var unrecoverableSampleRecipeList = Array<SampleRecipeBasic>()
    let queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL)
    var isRecovering = false
    let leastWaitTime = 0.2

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserRecipe()
        
        var config = Realm.Configuration(schemaVersion: 1)
        config.fileURL = Bundle.main.url(forResource: "default", withExtension: "realm")
        config.readOnly = true
        Realm.Configuration.defaultConfiguration = config

        loadSampleRecipe()
        setNavigationTitle()
        isRecovering = false
        
        self.tableView.estimatedRowHeight = 70
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.setContentOffset(tableView.contentOffset, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadUserRecipe(){
        let realm = try! Realm()
        let recipeList = realm.objects(Recipe.self).sorted(byProperty: "recipeName")
        for ur in recipeList{
            userRecipeNameList.append(ur.recipeName)
        }
    }
    
    func loadSampleRecipe(){
        let realm = try! Realm()
        let recipeList = realm.objects(Recipe.self).sorted(byProperty: "recipeName")
        for sr in recipeList{
            var isRecoverable = true
            for ur in userRecipeNameList{
                if sr.recipeName == ur{
                    isRecoverable = false
                    break
                }
            }

            let srb = SampleRecipeBasic(name: sr.recipeName, recoverable: isRecoverable, recoverTarget: false)
            if isRecoverable{
                recoverableSampleRecipeList.append(srb)
            }else{
                unrecoverableSampleRecipeList.append(srb)
            }
        }
        recoverableSampleRecipeList.sort(by: { $0.kanaName < $1.kanaName })
        unrecoverableSampleRecipeList.sort(by: { $0.kanaName < $1.kanaName })
    }
    
    func setNavigationTitle(){
        var recoverCount = 0
        for rr in recoverableSampleRecipeList{
            if rr.recoverTarget{
                recoverCount += 1
            }
        }
        self.navigationItem.title = "サンプルレシピ復元(" + String(recoverCount) + ")"
    }
    
    func isTargetTapped(sender: M13Checkbox){
        if isRecovering == false {
            var view = sender.superview
            while(view!.isKindOfClass(RecoverTargetTableViewCell) == false) {
                view = view!.superview
            }
            let cell = view as! RecoverTargetTableViewCell
            let touchIndex = self.tableView.indexPath(for: cell)
            
            if touchIndex!.row - 1 < recoverableSampleRecipeList.count{
                if sender.checkState == .checked{
                    recoverableSampleRecipeList[touchIndex!.row - 1].recoverTarget = true
                }else if sender.checkState == .unchecked{
                    recoverableSampleRecipeList[touchIndex!.row - 1].recoverTarget = false
                }
                setNavigationTitle()
            }            
        }
    }
    
    func recover(){
        var recoverRecipeList = Array<RecoverRecipe>()
        for rr in recoverableSampleRecipeList{
            if rr.recoverTarget{
                let realm = try! Realm()
                let recipe = realm.objects(Recipe.self).filter("recipeName == %@", rr.name).first!
                
                var recoverRecipe = RecoverRecipe(name: recipe.recipeName, method: recipe.method, ingredientList: [])
                for ri in recipe.recipeIngredients{
                    recoverRecipe.ingredientList.append(RecoverIngredient(name: ri.ingredient.ingredientName, amount: ri.amount, mustflag: ri.mustFlag))
                }
                recoverRecipeList.append(recoverRecipe)
            }
        }
        
        var config = Realm.Configuration(schemaVersion: 1)
        config.fileURL = config.fileURL!.URLByDeletingLastPathComponent?.URLByAppendingPathComponent("default.realm")
        Realm.Configuration.defaultConfiguration = config
        
        for recoverRecipe in recoverRecipeList{
            let realm = try! Realm()
            let rec = realm.objects(Recipe.self).filter("recipeName == %@",recoverRecipe.name)
            if rec.count < 1 {
                try! realm.write {
                    for recoverIngredient in recoverRecipe.ingredientList{
                        addIngredient(ingredientName: recoverIngredient.name, stockFlag: false, memo: "")
                    }
                    addRecipe(recipeName: recoverRecipe.name, favorites: 1, memo: "", method: recoverRecipe.method)
                    
                    for recoverIngredient in recoverRecipe.ingredientList{
                        addRecipeToIngredientLink(recipeName: recoverRecipe.name, ingredientName: recoverIngredient.name, amount: recoverIngredient.amount, mustFlag: recoverIngredient.mustflag)
                    }
                }
            }
        }
    }
    
    func addRecipe(recipeName:String, favorites:Int, memo:String, method:Int){
        let realm = try! Realm()
        let rec = realm.objects(Recipe.self).filter("recipeName == %@",recipeName)
        if rec.count < 1 {
            let recipe = Recipe()
            recipe.recipeName = recipeName
            recipe.favorites = favorites
            recipe.memo = memo
            recipe.method = method
            realm.add(recipe)
        }
    }
    
    func addIngredient(ingredientName: String, stockFlag: Bool, memo: String){
        let realm = try! Realm()
        let ing = realm.objects(Ingredient.self).filter("ingredientName == %@",ingredientName)
        if ing.count < 1 {
            let ingredient = Ingredient()
            ingredient.ingredientName = ingredientName
            ingredient.stockFlag = stockFlag
            ingredient.memo = memo
            realm.add(ingredient)
        }
    }
    
    func addRecipeToIngredientLink(recipeName:String, ingredientName:String, amount:String, mustFlag:Bool){
        let realm = try! Realm()
        let recipeIngredientLink = RecipeIngredientLink()
        recipeIngredientLink.amount = amount
        recipeIngredientLink.mustFlag = mustFlag
        realm.add(recipeIngredientLink)
        
        let ingredient = realm.objects(Ingredient.self).filter("ingredientName == %@",ingredientName).first!
        ingredient.recipeIngredients.append(recipeIngredientLink)
        
        let recipe = realm.objects(Recipe.self).filter("recipeName == %@",recipeName).first!
        recipe.recipeIngredients.append(recipeIngredientLink)
    }
    
    func waitAtLeast(time : TimeInterval, _ block: () -> Void) {
        let start = CFAbsoluteTimeGetCurrent()
        block()
        let end = CFAbsoluteTimeGetCurrent()
        let wait = max(0.0, time - (end - start))
        if wait > 0.0 {
            Thread.sleep(forTimeInterval: wait)
        }
    }

    // MARK: - Table view
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1{
            return 30
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableViewAutomaticDimension
        }else{
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                tableView.deselectRow(at: indexPath, animated: true)
                if isRecovering == false {
                    if recoverableSampleRecipeList.count == 0{
                        let alertView = UIAlertController(title: nil, message: "復元できるレシピはありません", preferredStyle: .alert)
                        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                        }))
                        self.present(alertView, animated: true, completion: nil)
                    }else{
                        let alertView = UIAlertController(title: nil, message: String(recoverableSampleRecipeList.count) + "個のサンプルレシピを\n復元します", preferredStyle: .alert)
                        alertView.addAction(UIAlertAction(title: "復元", style: .default, handler: {action in
                            self.isRecovering = true
                            SVProgressHUD.show(withStatus: "復元中...")
                            self.queue.asynchronously(){
                                self.waitAtLeast(self.leastWaitTime) {
                                    for i in 0..<self.recoverableSampleRecipeList.count {
                                        self.recoverableSampleRecipeList[i].recoverTarget = true
                                    }
                                    self.recover()
                                }
                                dispatch_async(dispatch_get_main_queue()){
                                    SVProgressHUD.showSuccessWithStatus("復元が完了しました")
                                    self.dismissViewControllerAnimated(true, completion: nil)
                                }
                            }
                        }))
                        alertView.addAction(UIAlertAction(title: "キャンセル", style: .cancel){action in})
                        self.present(alertView, animated: true, completion: nil)
                    }
                }
            }else{
                tableView.deselectRow(at: indexPath, animated: true)
                if isRecovering == false {
                    performSegue(withIdentifier: "PushPreview", sender: indexPath)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "復元したいレシピを選んでください"
        }else{
            return nil
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return recoverableSampleRecipeList.count + unrecoverableSampleRecipeList.count + 1
        }else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecoverDescription") as! RecoverDescriptionTableViewCell
            cell.recoverableRecipeNum = recoverableSampleRecipeList.count
            cell.sampleRecipeNum = recoverableSampleRecipeList.count + unrecoverableSampleRecipeList.count
            return cell
        case 1:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "RecoverAll") as! RecoverAllTableViewCell
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "RecoverTarget") as! RecoverTargetTableViewCell
                cell.isTarget.stateChangeAnimation = .fade(.fill)
                cell.isTarget.animationDuration = 0.0
                cell.isTarget.backgroundColor = UIColor.clear
                cell.isTarget.boxLineWidth = 1.0
                cell.isTarget.markType = .checkmark
                cell.isTarget.boxType = .circle
                cell.isTarget.secondaryTintColor = FlatGray()
                
                if indexPath.row - 1 < recoverableSampleRecipeList.count{
                    cell.recipeName.text = recoverableSampleRecipeList[indexPath.row - 1].name
                    cell.isTarget.isEnabled = true
                    cell.isTarget.tintColor = FlatSkyBlueDark()
                    if recoverableSampleRecipeList[indexPath.row - 1].recoverTarget{
                        //CheckedとMixedを直接変換するとエラーになる
                        cell.isTarget.setCheckState(.unchecked, animated: true)
                        cell.isTarget.setCheckState(.checked, animated: true)
                    }else{
                        cell.isTarget.setCheckState(.unchecked, animated: true)
                    }
                    cell.isRecoverable = true
                    cell.isTarget.addTarget(self, action: #selector(RecoverTableViewController.isTargetTapped(_:)), for: UIControlEvents.ValueChanged)
                }else{
                    cell.recipeName.text = unrecoverableSampleRecipeList[indexPath.row - 1 - recoverableSampleRecipeList.count].name
                    cell.isTarget.isEnabled = false
                    cell.isTarget.tintColor = FlatWhiteDark()
                    //CheckedとMixedを直接変換するとエラーになる
                    cell.isTarget.setCheckState(.unchecked, animated: true)
                    cell.isTarget.setCheckState(.mixed, animated: true)
                    cell.isRecoverable = false
                }
                return cell
            }
        default:
            return UITableViewCell()
        }
    }

    // MARK: - IBAction
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        if isRecovering == false {
            var config = Realm.Configuration(schemaVersion: 1)
            config.fileURL = config.fileURL!.URLByDeletingLastPathComponent?.URLByAppendingPathComponent("default.realm")
            Realm.Configuration.defaultConfiguration = config
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func recoverButtonTapped(_ sender: UIBarButtonItem) {
        if isRecovering == false{
            var recoverCount = 0
            for rr in recoverableSampleRecipeList{
                if rr.recoverTarget{
                    recoverCount += 1
                }
            }
            
            if recoverCount == 0{
                var config = Realm.Configuration(schemaVersion: 1)
                config.fileURL = config.fileURL!.URLByDeletingLastPathComponent?.URLByAppendingPathComponent("default.realm")
                Realm.Configuration.defaultConfiguration = config
                self.dismiss(animated: true, completion: nil)
            }else{
                let alertView = UIAlertController(title: nil, message: String(recoverCount) + "個のサンプルレシピを\n復元します", preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "復元", style: .default, handler: {action in
                    self.isRecovering = true
                    SVProgressHUD.show(withStatus: "復元中...")
                    self.queue.asynchronously(){
                        self.waitAtLeast(self.leastWaitTime) {
                            self.recover()
                        }
                        dispatch_async(dispatch_get_main_queue()){
                            SVProgressHUD.showSuccessWithStatus("復元が完了しました")
                            self.dismissViewControllerAnimated(true, completion: nil)
                        }
                    }
                }))
                alertView.addAction(UIAlertAction(title: "キャンセル", style: .cancel){action in})
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PushPreview" {
            let vc = segue.destination as! RecoverPreviewTableViewController
            if let indexPath = sender as? NSIndexPath{
                let realm = try! Realm()
                if indexPath.row - 1 < recoverableSampleRecipeList.count{
                    let recipe = realm.objects(Recipe.self).filter("recipeName == %@", recoverableSampleRecipeList[indexPath.row - 1].name).first!
                    vc.recipe = recipe
                }else{
                    let recipe = realm.objects(Recipe.self).filter("recipeName == %@", unrecoverableSampleRecipeList[indexPath.row - 1 - recoverableSampleRecipeList.count].name).first!
                    vc.recipe = recipe
                }
            }
        }
    }

}