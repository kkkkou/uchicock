//
//  SettingsTableViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2017/02/28.
//  Copyright © 2017年 Kou. All rights reserved.
//

import UIKit
import MYBlurIntroductionView
import ChameleonFramework

class SettingsTableViewController: UITableViewController, MYIntroductionDelegate {

    @IBOutlet weak var introductionImage: UIImageView!
    @IBOutlet weak var recoverImage: UIImageView!
    @IBOutlet weak var changeThemeImage: UIImageView!
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var recoverLabel: UILabel!
    @IBOutlet weak var changeThemeLabel: UILabel!
    
    let selectedCellBackgroundView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        introductionImage.image = introductionImage.image!.withRenderingMode(.alwaysTemplate)
        recoverImage.image = recoverImage.image!.withRenderingMode(.alwaysTemplate)
        changeThemeImage.image = changeThemeImage.image!.withRenderingMode(.alwaysTemplate)

        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        introductionImage.tintColor = Style.secondaryColor
        recoverImage.tintColor = Style.secondaryColor
        changeThemeImage.tintColor = Style.secondaryColor
        introductionLabel.textColor = Style.labelTextColor
        recoverLabel.textColor = Style.labelTextColor
        changeThemeLabel.textColor = Style.labelTextColor
        selectedCellBackgroundView.backgroundColor = Style.tableViewCellSelectedBackgroundColor
        
        self.tableView.backgroundColor = Style.basicBackgroundColor
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showIntroduction(){
        let desc0 = "ダウンロードしていただき、ありがとうございます！使い方を簡単に説明します。"
        let introductionPanel0 = MYIntroductionPanel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), title: "Thank you for downloading!!", description: desc0)
        
        let desc1 = "レシピの検索や新規登録はこの画面から。\nサンプルレシピですら、編集して自前でアレンジ可能！\nカクテルをつくったらぜひ写真を登録してみよう！"
        let introductionPanel1 = MYIntroductionPanel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), title: "レシピ", description: desc1, image: UIImage(named: "screen-recipe"))
        introductionPanel1!.panelImageView.contentMode = UIViewContentMode.scaleAspectFit
        
        let desc2 = "ワンタップで材料の在庫を登録できます。在庫を登録することで、今の手持ちでつくれるレシピがわかります。\n材料からレシピを探すのもこの画面から。"
        let introductionPanel2 = MYIntroductionPanel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), title: "材料", description: desc2, image: UIImage(named: "screen-ingredient"))
        introductionPanel2!.panelImageView.contentMode = UIViewContentMode.scaleAspectFit
        
        let desc3 = "アプリに登録されているレシピの写真だけを取り出して表示します。\n表示順をシャッフルして、気まぐれにカクテルを選んでみては？"
        let introductionPanel3 = MYIntroductionPanel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), title: "アルバム", description: desc3, image: UIImage(named: "screen-album"))
        introductionPanel3!.panelImageView.contentMode = UIViewContentMode.scaleAspectFit
        
        let introductionView = MYBlurIntroductionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        introductionView.backgroundImageView.image = UIImage(named: "launch-background")
        introductionView.rightSkipButton.backgroundColor = UIColor.clear
        introductionView.pageControl.currentPageIndicatorTintColor = FlatYellow()
        introductionView.pageControl.pageIndicatorTintColor = FlatOrange()
        introductionView.delegate = self
        introductionView.buildIntroduction(withPanels: [introductionPanel0!,introductionPanel1!,introductionPanel2!,introductionPanel3!])
        
        let window = UIApplication.shared.keyWindow!
        window.addSubview(introductionView)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            tableView.deselectRow(at: indexPath, animated: true)
            showIntroduction()
        case 1:
            performSegue(withIdentifier: "PushRecoverRecipe", sender: indexPath)
        case 2:
            performSegue(withIdentifier: "ChangeTheme", sender: indexPath)
        default: break
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = Style.basicBackgroundColor
        cell.selectedBackgroundView = selectedCellBackgroundView
        return cell
    }

}