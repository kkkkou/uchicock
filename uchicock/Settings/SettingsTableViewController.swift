//
//  SettingsTableViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2017/02/28.
//  Copyright © 2017年 Kou. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var introductionImage: UIImageView!
    @IBOutlet weak var recoverImage: UIImageView!
    @IBOutlet weak var changeThemeImage: UIImageView!
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var recoverLabel: UILabel!
    @IBOutlet weak var changeThemeLabel: UILabel!
    
    let selectedCellBackgroundView = UIView()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return Style.statusBarStyle
    }

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
        self.tableView.indicatorStyle = Style.isBackgroundDark ? .white : .black
        tableView.backgroundColor = Style.basicBackgroundColor

        tableView.reloadData()
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
            performSegue(withIdentifier: "usage", sender: nil)
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
        cell.selectedBackgroundView = selectedCellBackgroundView
        cell.backgroundColor = Style.basicBackgroundColor
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "usage" {
            let vc = segue.destination as! IntroductionPageViewController
            vc.introductions = introductions()
            vc.backgroundImage = UIImage(named:"launch-background")
        }
    }
    
    func introductions() -> [introductionInfo]{
        let info1 = introductionInfo(title: "レシピ",
                                     description: "レシピの検索や新規登録はこの画面から。\nサンプルレシピですら、編集して自前でアレンジ可能！\nカクテルをつくったらぜひ写真を登録してみよう！",
                                     image: UIImage(named:"screen-recipe"))
        let info2 = introductionInfo(title: "材料",
                                     description: "ワンタップで材料の在庫を登録できます。\n在庫を登録すると、今の手持ちで作れるレシピがわかります。",
                                     image: UIImage(named:"screen-ingredient"))
        let info3 = introductionInfo(title: "逆引き",
                                     description: "3つまで材料を指定して、それらをすべて使うレシピを逆引きできます。\n「あの材料とあの材料を使うカクテル何だっけ？」\nそんなときに活用しよう！",
                                     image: UIImage(named:"screen-reverse-lookup"))
        let info4 = introductionInfo(title: "アルバム",
                                     description: "アプリに登録されているレシピの写真だけを取り出して表示します。\n表示順をシャッフルして、気まぐれにカクテルを選んでみては？",
                                     image: UIImage(named:"screen-album"))
        
        var infos: [introductionInfo] = []
        infos.append(info1)
        infos.append(info2)
        infos.append(info3)
        infos.append(info4)
        return infos
    }

}
