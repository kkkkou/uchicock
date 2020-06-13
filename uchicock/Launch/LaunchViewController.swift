//
//  LaunchViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2019/10/05.
//  Copyright © 2019 Kou. All rights reserved.
//

import UIKit
import RealmSwift

class LaunchViewController: UIViewController {

    @IBOutlet weak var prepareMessage: UILabel!
    
    var recipeList: Results<Recipe>?
    var calcIngredientList: Results<CalculatorIngredient>?
    var shouldShowIntroduction = false
    var initializedFullScreenPopGesture = false
    
    var widgetUrl: String? = nil

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UchicockStyle.statusBarStyle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UchicockStyle.loadTheme()

        let defaults = UserDefaults.standard
        defaults.register(defaults: [GlobalConstants.SaveImageSizeKey : 0])
        defaults.register(defaults: [GlobalConstants.FirstLaunchKey: true])
        if defaults.bool(forKey: GlobalConstants.FirstLaunchKey) {
            prepareMessage.alpha = 0.0
            shouldShowIntroduction = true
            defaults.set(false, forKey: GlobalConstants.FirstLaunchKey)
        }else{
            if widgetUrl == nil {
                prepareMessage.alpha = 1.0
            }else{
                prepareMessage.alpha = 0.0
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if shouldShowIntroduction{
            shouldShowIntroduction = false
            performSegue(withIdentifier: "usage", sender: nil)
        }else{
            prepareToShowRecipeList()
        }
    }
    
    func prepareToShowRecipeList(){
        if widgetUrl == nil {
            prepareMessage.alpha = 1.0
        }else{
            prepareMessage.alpha = 0.0
        }

        let realm = try! Realm()

        // DBに名前がないが存在する画像を削除する処理
        var dbFileNameList: [String] = []
        recipeList = realm.objects(Recipe.self)
        for recipe in recipeList!{
            if let imageFileName = recipe.imageFileName{
                dbFileNameList.append(imageFileName)
            }
        }
        
        let fileManager = FileManager.default
        var actualImageFileNames = try? fileManager.contentsOfDirectory(at: GlobalConstants.ImageFolderPath, includingPropertiesForKeys: nil).map{ $0.deletingPathExtension().lastPathComponent }
        for actualImageFileName in actualImageFileNames ?? [] {
            if dbFileNameList.contains(actualImageFileName) == false{
                let imageFilePath = GlobalConstants.ImageFolderPath.appendingPathComponent(actualImageFileName + ".png")
                try? fileManager.removeItem(at: imageFilePath)
            }
        }
        
        var actualThumbnailFileNames = try? fileManager.contentsOfDirectory(at: GlobalConstants.ThumbnailFolderPath, includingPropertiesForKeys: nil).map{ $0.deletingPathExtension().lastPathComponent }
        for actualThumbnailFileName in actualThumbnailFileNames ?? [] {
            if dbFileNameList.contains(actualThumbnailFileName) == false{
                let thumbnailFilePath = GlobalConstants.ThumbnailFolderPath.appendingPathComponent(actualThumbnailFileName + ".png")
                try? fileManager.removeItem(at: thumbnailFilePath)
            }
        }
        
        // サムネイルがない画像のサムネイルを作成
        try? FileManager.default.createDirectory(atPath: GlobalConstants.ThumbnailFolderPath.path, withIntermediateDirectories: true, attributes: nil)

        actualImageFileNames = try? fileManager.contentsOfDirectory(at: GlobalConstants.ImageFolderPath, includingPropertiesForKeys: nil).map{ $0.deletingPathExtension().lastPathComponent }
        actualThumbnailFileNames = try? fileManager.contentsOfDirectory(at: GlobalConstants.ThumbnailFolderPath, includingPropertiesForKeys: nil).map{ $0.deletingPathExtension().lastPathComponent }
        for actualImageFileName in actualImageFileNames ?? [] {
            if let actualThumbnailFileNames = actualThumbnailFileNames, actualThumbnailFileNames.contains(actualImageFileName) == false{
                let imageFilePath = GlobalConstants.ImageFolderPath.appendingPathComponent(actualImageFileName + ".png")
                let thumbnailFilePath = GlobalConstants.ThumbnailFolderPath.appendingPathComponent(actualImageFileName + ".png")
                let loadedImage: UIImage? = UIImage(contentsOfFile: imageFilePath.path)
                if let loadedImage = loadedImage{
                    try? loadedImage.resizedUIImage(maxLongSide: GlobalConstants.ThumbnailMaxLongSide)?.pngData()?.write(to: thumbnailFilePath)
                }
            }
        }

        // 念のためにレシピの不足材料数を一括更新
        try! realm.write {
            for recipe in recipeList!{
                recipe.updateShortageNum()
            }
        }
        
        // レシピ修正処理
        correct_v_8_0()
        
        // どこでもスワイプで戻れるようにするための処理
        if initializedFullScreenPopGesture == false{
            BasicNavigationController.initializeFullScreenPopGesture()
            initializedFullScreenPopGesture = true
        }
        
        // 遷移
        let tabBarC = UIStoryboard(name: "Launch", bundle:nil).instantiateViewController(withIdentifier: "tabBar") as! BasicTabBarController
        tabBarC.modalPresentationStyle = .fullScreen
        tabBarC.modalTransitionStyle = .crossDissolve

        switch widgetUrl{
        case "uchicock://bookmark":
            tabBarC.selectedIndex = 0
            tabBarC.lastSelectedIndex = 0
            let navC = tabBarC.viewControllers![0] as! UINavigationController
            let recipeVC = navC.visibleViewController as? RecipeListViewController
            recipeVC?.isBookmarkMode = true
            recipeVC?.shouldShowBookmarkGuide = true
        case "uchicock://reminder":
            tabBarC.selectedIndex = 1
            tabBarC.lastSelectedIndex = 1
            let navC = tabBarC.viewControllers![1] as! UINavigationController
            let ingredientVC = navC.visibleViewController as? IngredientListViewController
            ingredientVC?.isReminderMode = true
            ingredientVC?.shouldShowReminderGuide = true
        case "uchicock://album":
            tabBarC.selectedIndex = 3
            tabBarC.lastSelectedIndex = 3
        case "uchicock://calc":
            tabBarC.selectedIndex = 4
            tabBarC.lastSelectedIndex = 4

            let navC = tabBarC.viewControllers![4] as! UINavigationController
            let settingsVC = navC.visibleViewController as? SettingsTableViewController
            if settingsVC != nil{
                settingsVC!.selectedIndexPath = IndexPath(row: 4, section: 0)
            }
            let calcVC = UIStoryboard(name: "AlcoholCalc", bundle:nil).instantiateViewController(withIdentifier: "calc") as! AlcoholCalcViewController
            navC.pushViewController(calcVC, animated: false)
        default:
            tabBarC.selectedIndex = 0
            tabBarC.lastSelectedIndex = 0
        }

        let reminderNum = realm.objects(Ingredient.self).filter("reminderSetDate != nil").count
        if let tabItems = tabBarC.tabBar.items {
            let tabItem = tabItems[1]
            tabItem.badgeColor = UchicockStyle.badgeBackgroundColor
            if reminderNum == 0{
                tabItem.badgeValue = nil
            }else{
                tabItem.badgeValue = "!"
            }
        }
        
        let defaults = UserDefaults.standard
        let version80newRecipeViewed = defaults.bool(forKey: GlobalConstants.Version80NewRecipeViewedKey)
        let version81newRecipeViewed = defaults.bool(forKey: GlobalConstants.Version81NewRecipeViewedKey)
        if let tabItems = tabBarC.tabBar.items {
            let tabItem = tabItems[4]
            tabItem.badgeColor = UchicockStyle.badgeBackgroundColor
            if version80newRecipeViewed || version81newRecipeViewed{
                tabItem.badgeValue = nil
            }else{
                tabItem.badgeValue = "N"
            }
        }

        widgetUrl = nil
        self.present(tabBarC, animated: false, completion: nil)
    }
    
    func dismissIntroductionAndPrepareToShowRecipeList(_ introduction: IntroductionPageViewController){
        introduction.dismiss(animated: true, completion: {
            self.prepareToShowRecipeList()
        })
    }
    
    // MARK: - Correction
    // コモドアーはコモドールと一緒なので消す
    func correct_v_8_0(){
        let defaults = UserDefaults.standard
        defaults.register(defaults: [GlobalConstants.Version80CorrectedKey: false])
        if defaults.bool(forKey: GlobalConstants.Version80CorrectedKey) == false {
            defaults.set(true, forKey: GlobalConstants.Version80CorrectedKey)

            let realm = try! Realm()
            let rec = realm.objects(Recipe.self).filter("recipeName == %@", "コモドアー")
            if rec.count > 0{
                let deletingRecipeIngredientList = List<RecipeIngredientLink>()
                for ri in rec.first!.recipeIngredients{
                    let recipeIngredient = realm.object(ofType: RecipeIngredientLink.self, forPrimaryKey: ri.id)!
                    deletingRecipeIngredientList.append(recipeIngredient)
                }
                ImageUtil.remove(imageFileName: rec.first!.imageFileName)

                try! realm.write{
                    for ri in deletingRecipeIngredientList{
                        let ingredient = realm.objects(Ingredient.self).filter("ingredientName == %@",ri.ingredient.ingredientName).first!
                        for i in 0 ..< ingredient.recipeIngredients.count where i < ingredient.recipeIngredients.count{
                            if ingredient.recipeIngredients[i].id == ri.id{
                                ingredient.recipeIngredients.remove(at: i)
                            }
                        }
                    }
                    for ri in deletingRecipeIngredientList{
                        realm.delete(ri)
                    }
                    realm.delete(rec.first!)
                }
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "usage" {
            let vc = segue.destination as! IntroductionPageViewController
            vc.launchVC = self
            vc.introductions = introductions()
        }
    }
    
    func introductions() -> [introductionInfo]{
        var infos: [introductionInfo] = []

        let info1 = introductionInfo(title: "Thank you for downloading!!",
                                     description: GlobalConstants.IntroductionDescriptionThanks,
                                    image: nil)
        let info2 = introductionInfo(title: "レシピ",
                                     description: GlobalConstants.IntroductionDescriptionRecipe,
                                     image: UIImage(named:"screen-recipe"))
        let info3 = introductionInfo(title: "材料",
                                     description: GlobalConstants.IntroductionDescriptionIngredient,
                                     image: UIImage(named:"screen-ingredient"))
        let info4 = introductionInfo(title: "逆引き",
                                     description: GlobalConstants.IntroductionDescriptionReverseLookup,
                                     image: UIImage(named:"screen-reverse-lookup"))
        let info5 = introductionInfo(title: "アルバム",
                                     description: GlobalConstants.IntroductionDescriptionAlbum,
                                     image: UIImage(named:"screen-album"))
        infos.append(info1)
        infos.append(info2)
        infos.append(info3)
        infos.append(info4)
        infos.append(info5)
        return infos
    }
}
