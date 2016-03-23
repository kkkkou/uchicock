//
//  RecipeEditTableViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/03/23.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit
import RealmSwift

class RecipeEditTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var method: UISegmentedControl!
    @IBOutlet weak var memo: UITextView!
    
    var recipe = Recipe()
    var isAddMode = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if recipe.recipeName == "" {
            self.navigationItem.title = "レシピ登録"
            star1.setTitle("★", forState: .Normal)
            star2.setTitle("☆", forState: .Normal)
            star3.setTitle("☆", forState: .Normal)
            method.selectedSegmentIndex = 0
            isAddMode = true
        } else {
            self.navigationItem.title = "レシピ編集"
            switch recipe.favorites{
            case 1:
                star1.setTitle("★", forState: .Normal)
                star2.setTitle("☆", forState: .Normal)
                star3.setTitle("☆", forState: .Normal)
            case 2:
                star1.setTitle("★", forState: .Normal)
                star2.setTitle("★", forState: .Normal)
                star3.setTitle("☆", forState: .Normal)
            case 3:
                star1.setTitle("★", forState: .Normal)
                star2.setTitle("★", forState: .Normal)
                star3.setTitle("★", forState: .Normal)
            default:
                star1.setTitle("★", forState: .Normal)
                star2.setTitle("☆", forState: .Normal)
                star3.setTitle("☆", forState: .Normal)
            }
            method.selectedSegmentIndex = recipe.method
            isAddMode = false
        }
        
        recipeName.text = recipe.recipeName
        recipeName.delegate = self
        memo.text = recipe.memo
        memo.layer.masksToBounds = true
        memo.layer.cornerRadius = 5.0
        memo.layer.borderWidth = 1
        memo.layer.borderColor = UIColor.grayColor().CGColor

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool{
        recipeName.resignFirstResponder()
        return true
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        } else {
            return 30
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        if isAddMode {
            return 1
//        }else{
//            return 2
//        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }else if section == 1 {
            return recipe.recipeIngredients.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "材料"
        }else{
            return nil
        }
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            if indexPath.row == 0 {
//                let cell = tableView.dequeueReusableCellWithIdentifier("RecipeEditName") as! RecipeEditNameTableViewCell
//                cell.recipe = recipe
//                return cell
//            }else if indexPath.row == 1 {
//                let cell = tableView.dequeueReusableCellWithIdentifier("RecipeEditFavorite") as! RecipeEditFavoriteTableViewCell
//                cell.recipe = recipe
//                return cell
//            }else if indexPath.row == 2 {
//                let cell = tableView.dequeueReusableCellWithIdentifier("RecipeEditMethod") as! RecipeEditMethodTableViewCell
//                cell.recipe = recipe
//                return cell
//            }else if indexPath.row == 3 {
//                let cell = tableView.dequeueReusableCellWithIdentifier("RecipeEditMemo") as! RecipeEditMemoTableViewCell
//                cell.recipe = recipe
//                return cell
//            }
//        }else if indexPath.section == 1 {
//            let cell = tableView.dequeueReusableCellWithIdentifier("RecipeEditIngredient") as! RecipeEditIngredientTableViewCell
//            cell.recipeIngredient = recipe.recipeIngredients[indexPath.row]
//            return cell
//        }
//        return UITableViewCell()
//    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: - IBAction
    @IBAction func star1Tapped(sender: UIButton) {
        star1.setTitle("★", forState: .Normal)
        star2.setTitle("☆", forState: .Normal)
        star3.setTitle("☆", forState: .Normal)
    }
    
    @IBAction func star2Tapped(sender: UIButton) {
        star1.setTitle("★", forState: .Normal)
        star2.setTitle("★", forState: .Normal)
        star3.setTitle("☆", forState: .Normal)
    }
    
    @IBAction func star3Tapped(sender: UIButton) {
        star1.setTitle("★", forState: .Normal)
        star2.setTitle("★", forState: .Normal)
        star3.setTitle("★", forState: .Normal)
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if recipeName.text == nil || recipeName.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())==""{
            //名前を入れていない
            let noNameAlertView = UIAlertController(title: "", message: "レシピ名を入力してください", preferredStyle: .Alert)
            noNameAlertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in}))
            presentViewController(noNameAlertView, animated: true, completion: nil)
            
            //TODO:材料を一つも入れていない場合もアラートを出す
            
        }else{
            let realm = try! Realm()
            
            if isAddMode {
                let sameNameRecipe = realm.objects(Recipe).filter("recipeName == %@",recipeName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
                if sameNameRecipe.count != 0{
                    //同じ名前の材料がすでに登録されている
                    let sameNameAlertView = UIAlertController(title: "", message: "同じ名前のレシピが既に登録されています", preferredStyle: .Alert)
                    sameNameAlertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in}))
                    presentViewController(sameNameAlertView, animated: true, completion: nil)
                }else{
                    let newRecipe = Recipe()
                    newRecipe.recipeName = recipeName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                    if star3.currentTitle == "★" {
                        newRecipe.favorites = 3
                    }else if star2.currentTitle == "★" {
                        newRecipe.favorites = 2
                    }else{
                        newRecipe.favorites = 1
                    }
                    
                    newRecipe.method = method.selectedSegmentIndex
                    newRecipe.memo = memo.text
                    
                    //TODO:一番先にリレーションシップを登録する
                    //TODO:材料がない場合は材料も登録する
                    
                    try! realm.write {
                        realm.add(newRecipe)
                    }
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }else{
                let sameNameRecipe = realm.objects(Recipe).filter("recipeName == %@",recipeName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
                if sameNameRecipe.count != 0 && recipe.recipeName != recipeName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()){
                    //同じ名前の材料がすでに登録されている
                    let sameNameAlertView = UIAlertController(title: "", message: "同じ名前のレシピが既に登録されています", preferredStyle: .Alert)
                    sameNameAlertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in}))
                    presentViewController(sameNameAlertView, animated: true, completion: nil)
                }else{
                    try! realm.write {
                        recipe.recipeName = recipeName.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                        if star3.currentTitle == "★" {
                            recipe.favorites = 3
                        }else if star2.currentTitle == "★" {
                            recipe.favorites = 2
                        }else{
                            recipe.favorites = 1
                        }
                        recipe.method = method.selectedSegmentIndex
                        recipe.memo = memo.text
                    }
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func screenTapped(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
