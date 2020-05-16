//
//  IngredientListViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/03/18.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit
import RealmSwift

class IngredientListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIViewControllerTransitioningDelegate, ScrollableToTop {

    @IBOutlet weak var reminderButton: BadgeBarButtonItem!
    @IBOutlet weak var addIngredientButton: UIBarButtonItem!
    @IBOutlet weak var searchTextField: CustomTextField!
    @IBOutlet weak var segmentedControlContainer: UIView!
    @IBOutlet weak var category: CustomSegmentedControl!
    @IBOutlet weak var stockState: CustomSegmentedControl!
    @IBOutlet weak var ingredientRecommendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerSeparator: UIView!
    
    @IBOutlet weak var searchTextFieldTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextFieldBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var categoryHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var categoryBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var stockStateHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var stockStateBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var ingredientRecommendButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerSeparatorTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerSeparatorLandscapeTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerSeparatorHeightConstraint: NSLayoutConstraint!
    
    var ingredientList: Results<Ingredient>?
    var ingredientBasicList = Array<IngredientBasic>()
    
    var scrollBeginingYPoint: CGFloat = 0.0
    let selectedCellBackgroundView = UIView()
    var selectedIngredientId: String? = nil
    var hasIngredientAtAll = true
    var textFieldHasSearchResult = false
    var isTyping = false
    var isReminderMode = false
    var shouldShowReminderGuide = false

    let interactor = Interactor()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UchicockStyle.statusBarStyle
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.layer.cornerRadius = searchTextField.frame.size.height / 2
        searchTextField.clipsToBounds = true

        category.layer.borderWidth = 1.0
        category.layer.masksToBounds = true
        stockState.layer.borderWidth = 1.0
        stockState.layer.masksToBounds = true
        
        if #available(iOS 13.0, *) {
            category.selectedSegmentTintColor = .clear
            stockState.selectedSegmentTintColor = .clear
        }

        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setReminderBadge()
        isReminderMode ? changeToReminderMode() : changeToIngredientMode()
        self.view.backgroundColor = UchicockStyle.basicBackgroundColor

        segmentedControlContainer.backgroundColor = UchicockStyle.filterContainerBackgroundColor
        tableView.backgroundColor = UchicockStyle.basicBackgroundColor
        tableView.separatorColor = UchicockStyle.tableViewSeparatorColor
        tableView.indicatorStyle = UchicockStyle.isBackgroundDark ? .white : .black
        selectedCellBackgroundView.backgroundColor = UchicockStyle.tableViewCellSelectedBackgroundColor

        searchTextField.backgroundColor = UchicockStyle.searchTextViewBackgroundColor
        searchTextField.attributedPlaceholder = NSAttributedString(string: "材料名で検索", attributes: [NSAttributedString.Key.foregroundColor: UchicockStyle.labelTextColorLight])
        searchTextField.adjustClearButtonColor(with: 4)
        searchTextField.setSearchIcon()

        NotificationCenter.default.addObserver(self, selector:#selector(IngredientListViewController.searchTextFieldDidChange(_:)), name: CustomTextField.textDidChangeNotification, object: self.searchTextField)
        NotificationCenter.default.addObserver(self, selector: #selector(IngredientListViewController.searchTextFieldDidChange(_:)), name: .textFieldClearButtonTappedNotification, object: self.searchTextField)

        category.layer.borderColor = UchicockStyle.primaryColor.cgColor
        category.layoutSubviews()
        stockState.layer.borderColor = UchicockStyle.primaryColor.cgColor
        stockState.layoutSubviews()

        ingredientRecommendButton.layer.borderColor = UchicockStyle.primaryColor.cgColor
        ingredientRecommendButton.layer.borderWidth = 1.5
        ingredientRecommendButton.layer.cornerRadius = ingredientRecommendButton.frame.size.height / 2
        ingredientRecommendButton.setTitleColor(UchicockStyle.primaryColor, for: .normal)
        ingredientRecommendButton.backgroundColor = UchicockStyle.basicBackgroundColor
        
        containerSeparator.backgroundColor = UchicockStyle.labelTextColorLight
        
        reloadIngredientList()
        tableView.reloadData()
        
        highlightSelectedRow()
    }
    
    private func highlightSelectedRow(){
        if tableView.indexPathsForVisibleRows != nil && selectedIngredientId != nil {
            for indexPath in tableView.indexPathsForVisibleRows! {
                if ingredientBasicList.count > indexPath.row {
                    if ingredientBasicList[indexPath.row].id == selectedIngredientId! {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                        }
                        break
                    }
                }
            }
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.verticalSizeClass == .compact && isTyping {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }else{
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTableBackgroundView() // 画面リサイズ時や実行端末のサイズがStoryboardsと異なる時、EmptyDataの表示位置がずれないようにするために必要
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setTableBackgroundView() // 実行端末のサイズがStoryboardsと異なる時、EmptyDataの表示位置がずれないようにするために必要
        super.viewDidAppear(animated)

        if let path = tableView.indexPathForSelectedRow{
            tableView.deselectRow(at: path, animated: true)
        }
        selectedIngredientId = nil
        tableView.flashScrollIndicators()
        
        if shouldShowReminderGuide{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                MessageHUD.show("←材料に戻る", for: 2.0, withCheckmark: false, isCenter: false)
            }
            shouldShowReminderGuide = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func scrollToTop() {
        tableView?.setContentOffset(CGPoint.zero, animated: true)
    }
    
    private func setReminderBadge(){
        let realm = try! Realm()
        let reminderNum = realm.objects(Ingredient.self).filter("reminderSetDate != nil").count

        if let tabItems = self.tabBarController?.tabBar.items {
            let tabItem = tabItems[1]
            tabItem.badgeColor = UchicockStyle.badgeBackgroundColor
            if reminderNum == 0{
                tabItem.badgeValue = nil
                reminderButton.badgeText = nil
            }else{
                tabItem.badgeValue = "!"
                reminderButton.badgeText = "!"
            }
        }
    }
    
    // MARK: - Manage Data
    private func reloadIngredientList(){
        let realm = try! Realm()
        ingredientList = realm.objects(Ingredient.self)
        reloadIngredientBasicList()
    }
    
    private func reloadIngredientBasicList(){
        ingredientBasicList.removeAll()
        
        if isReminderMode{
            for ingredient in ingredientList!{
                if ingredient.reminderSetDate != nil{
                    ingredientBasicList.append(IngredientBasic(id: ingredient.id, name: ingredient.ingredientName, nameYomi: ingredient.ingredientNameYomi, katakanaLowercasedNameForSearch: ingredient.katakanaLowercasedNameForSearch , stockFlag: ingredient.stockFlag, category: ingredient.category, contributionToRecipeAvailability: ingredient.contributionToRecipeAvailability, usedRecipeNum: ingredient.recipeIngredients.count, reminderSetDate: ingredient.reminderSetDate))
                }
            }
            
            ingredientBasicList.sort(by: { $0.reminderSetDate! > $1.reminderSetDate! })
            self.navigationItem.title = "購入リマインダー(" + String(ingredientBasicList.count) + ")"
        }else{
            for ingredient in ingredientList!{
                ingredientBasicList.append(IngredientBasic(id: ingredient.id, name: ingredient.ingredientName, nameYomi: ingredient.ingredientNameYomi, katakanaLowercasedNameForSearch: ingredient.katakanaLowercasedNameForSearch , stockFlag: ingredient.stockFlag, category: ingredient.category, contributionToRecipeAvailability: ingredient.contributionToRecipeAvailability, usedRecipeNum: ingredient.recipeIngredients.count, reminderSetDate: ingredient.reminderSetDate))
            }
            
            hasIngredientAtAll = ingredientBasicList.count > 0

            let searchText = searchTextField.text!
            let convertedSearchText = searchText.convertToYomi().katakanaLowercasedForSearch()
            if searchText.withoutMiddleSpaceAndMiddleDot() != ""{
                ingredientBasicList.removeAll{
                    ($0.katakanaLowercasedNameForSearch.contains(convertedSearchText) == false) &&
                    ($0.name.contains(searchText) == false)
                }
            }
            
            textFieldHasSearchResult = ingredientBasicList.count > 0
            setTextFieldColor(textField: searchTextField)
            
            switch stockState.selectedSegmentIndex{
            case 1:
                ingredientBasicList.removeAll{ $0.stockFlag == false }
            case 2:
                ingredientBasicList.removeAll{ $0.stockFlag }
            default:
                break
            }
            
            if category.selectedSegmentIndex != 0{
                ingredientBasicList.removeAll{
                    $0.category != category.selectedSegmentIndex - 1
                }
            }

            ingredientBasicList.sort(by: { $0.nameYomi.localizedStandardCompare($1.nameYomi) == .orderedAscending })

            self.navigationItem.title = "材料(" + String(ingredientBasicList.count) + "/" + String(ingredientList!.count) + ")"
        }
        
        setTableBackgroundView()
    }
    
    private func setTableBackgroundView(){
        if ingredientBasicList.count == 0{
            self.tableView.backgroundView  = UIView()
            self.tableView.isScrollEnabled = false
            let noDataLabel  = UILabel(frame: CGRect(x: 0, y: self.tableView.bounds.size.height / 5, width: self.tableView.bounds.size.width, height: 100))
            noDataLabel.numberOfLines = 0
            noDataLabel.textColor = UchicockStyle.labelTextColorLight
            noDataLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
            noDataLabel.textAlignment = .center

            if isReminderMode{
                noDataLabel.text = "購入リマインダーはありません\n\n材料画面の「購入リマインダー」から\n登録できます"
            }else{
                if hasIngredientAtAll{
                    if textFieldHasSearchResult{
                        if searchTextField.text!.withoutMiddleSpaceAndMiddleDot() == "" {
                            noDataLabel.text = "絞り込み条件にあてはまる材料はありません"
                        }else{
                            noDataLabel.text = "入力した材料名の材料はありましたが、\n絞り込み条件には該当しません\n\n絞り込み条件を変更してください"
                        }
                    }else{
                        noDataLabel.text = "検索文字列にあてはまる材料はありません"
                    }
                }else{
                    noDataLabel.text = "材料はありません"
                }
                noDataLabel.text = "条件にあてはまる材料はありません"
            }
            self.tableView.backgroundView?.addSubview(noDataLabel)
        }else{
            self.tableView.backgroundView = nil
            self.tableView.isScrollEnabled = true
        }
    }
    
    @objc func cellStockTapped(_ sender: CircularCheckbox){
        var view = sender.superview
        while (view! is IngredientListItemTableViewCell) == false{
            view = view!.superview
        }
        let cell = view as! IngredientListItemTableViewCell
        let touchIndex = self.tableView.indexPath(for: cell)
        
        guard let index = touchIndex else { return }

        let realm = try! Realm()
        let ingredient = realm.object(ofType: Ingredient.self, forPrimaryKey: ingredientBasicList[index.row].id)!
        if ingredient.stockFlag {
            try! realm.write {
                ingredient.stockFlag = false
            }
        }else{
            try! realm.write {
                ingredient.stockFlag = true
            }
            if ingredient.reminderSetDate != nil{
                let alertView = CustomAlertController(title: nil, message: ingredient.ingredientName + "は購入リマインダーに登録されています。\n解除しますか？", preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "解除しない", style: .cancel, handler: {action in}))
                alertView.addAction(UIAlertAction(title: "解除する", style: .default, handler: {action in
                    try! realm.write {
                        ingredient.reminderSetDate = nil
                        if self.isReminderMode{
                            self.ingredientBasicList.remove(at: index.row)
                            self.tableView.deleteRows(at: [index], with: .middle)
                            if self.ingredientBasicList.count == 0{
                                self.setTableBackgroundView()
                                self.tableView.reloadData()
                            }
                            self.navigationItem.title = "購入リマインダー(" + String(self.ingredientBasicList.count) + ")"
                        }else{
                            MessageHUD.show("リマインダーを解除しました", for: 2.0, withCheckmark: true, isCenter: true)
                        }
                        self.setReminderBadge()
                    }
                }))
                alertView.alertStatusBarStyle = UchicockStyle.statusBarStyle
                alertView.modalPresentationCapturesStatusBarAppearance = true
                self.present(alertView, animated: true, completion: nil)
            }
        }
        
        try! realm.write {
            for ri in ingredient.recipeIngredients{
                ri.recipe.updateShortageNum()
            }
        }
        
        if self.isReminderMode == false{
            if stockState.selectedSegmentIndex != 0{
                ingredientBasicList.remove(at: index.row)
                tableView.deleteRows(at: [index], with: .middle)
                if ingredientBasicList.count == 0{
                    var il = Array<IngredientBasic>()
                    for ingredient in ingredientList!{
                        il.append(IngredientBasic(id: ingredient.id, name: ingredient.ingredientName, nameYomi: ingredient.ingredientNameYomi, katakanaLowercasedNameForSearch: ingredient.katakanaLowercasedNameForSearch , stockFlag: ingredient.stockFlag, category: ingredient.category, contributionToRecipeAvailability: ingredient.contributionToRecipeAvailability, usedRecipeNum: ingredient.recipeIngredients.count, reminderSetDate: ingredient.reminderSetDate))
                    }
                    
                    hasIngredientAtAll = il.count > 0

                    let searchText = searchTextField.text!
                    let convertedSearchText = searchText.convertToYomi().katakanaLowercasedForSearch()
                    if searchText.withoutMiddleSpaceAndMiddleDot() != ""{
                        il.removeAll{
                            ($0.katakanaLowercasedNameForSearch.contains(convertedSearchText) == false) &&
                            ($0.name.contains(searchText) == false)
                        }
                    }
                    
                    textFieldHasSearchResult = il.count > 0
                    setTextFieldColor(textField: searchTextField)
                    
                    setTableBackgroundView()
                    tableView.reloadData()
                }
                self.navigationItem.title = "材料(" + String(ingredientBasicList.count) + "/" + String(ingredientList!.count) + ")"
            }
        }
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 0{
            scrollBeginingYPoint = scrollView.contentOffset.y
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < -50, isReminderMode == false{
            searchTextField.becomeFirstResponder()
        }else if scrollBeginingYPoint < scrollView.contentOffset.y {
            searchTextField.resignFirstResponder()
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField){
        if tableView.contentOffset.y > 0{
            tableView.setContentOffset(tableView.contentOffset, animated: false)
        }
        self.isTyping = true
        if traitCollection.verticalSizeClass == .compact{
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.isTyping = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        searchTextField.resignFirstResponder()
        searchTextField.adjustClearButtonColor(with: 4)
        reloadIngredientBasicList()
        tableView.reloadData()
        setTextFieldColor(textField: searchTextField)
        return true
    }

    @objc func searchTextFieldDidChange(_ notification: Notification){
        searchTextField.adjustClearButtonColor(with: 4)
        self.reloadIngredientBasicList()
        self.tableView.reloadData()
        setTextFieldColor(textField: searchTextField)
    }
    
    private func setTextFieldColor(textField: UITextField){
        if textFieldHasSearchResult == false {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UchicockStyle.alertColor.cgColor
            textField.tintColor = UchicockStyle.alertColor
            textField.textColor = UchicockStyle.alertColor
        }else{
            textField.layer.borderWidth = 0
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.tintColor = UchicockStyle.labelTextColor
            textField.textColor = UchicockStyle.labelTextColor
        }
    }

    // MARK: - UITableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if ingredientList == nil{
                reloadIngredientList()
            }
            return ingredientBasicList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTextField.resignFirstResponder()
        performSegue(withIdentifier: "PushIngredientDetail", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit =  UIContextualAction(style: .normal, title: "編集", handler: { (action,view,completionHandler ) in
            if let editNavi = UIStoryboard(name: "IngredientEdit", bundle: nil).instantiateViewController(withIdentifier: "IngredientEditNavigation") as? BasicNavigationController{
                guard let editVC = editNavi.visibleViewController as? IngredientEditTableViewController else{
                    return
                }
                let realm = try! Realm()
                let ingredient = realm.object(ofType: Ingredient.self, forPrimaryKey: self.ingredientBasicList[indexPath.row].id)!
                self.selectedIngredientId = self.ingredientBasicList[indexPath.row].id
                editVC.ingredient = ingredient
                
                editNavi.modalPresentationStyle = .fullScreen
                editNavi.modalTransitionStyle = .coverVertical
                editVC.mainNavigationController = self.navigationController as? BasicNavigationController
                self.present(editNavi, animated: true, completion: nil)
                completionHandler(true)
            }else{
                completionHandler(false)
            }
        })
        edit.image = UIImage(named: "button-edit")
        edit.backgroundColor = UchicockStyle.tableViewCellEditBackgroundColor
        
        let del =  UIContextualAction(style: .destructive, title: "削除", handler: { (action,view,completionHandler ) in
            let realm = try! Realm()
            let ingredient = realm.object(ofType: Ingredient.self, forPrimaryKey: self.ingredientBasicList[indexPath.row].id)!
            
            if ingredient.recipeIngredients.count > 0 {
                let alertView = CustomAlertController(title: nil, message: "この材料を使っているレシピがあるため、削除できません", preferredStyle: .alert)
                alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in}))
                alertView.alertStatusBarStyle = UchicockStyle.statusBarStyle
                alertView.modalPresentationCapturesStatusBarAppearance = true
                self.present(alertView, animated: true, completion: nil)
                completionHandler(false)
            } else{
                let deleteAlertView = CustomAlertController(title: nil, message: "この材料を本当に削除しますか？", preferredStyle: .alert)
                deleteAlertView.addAction(UIAlertAction(title: "削除", style: .destructive, handler: {action in
                    let realm = try! Realm()
                    try! realm.write {
                        realm.delete(ingredient)
                    }
                    self.ingredientBasicList.remove(at: indexPath.row)
                    var il = Array<IngredientBasic>()
                    for ingredient in self.ingredientList!{
                        il.append(IngredientBasic(id: ingredient.id, name: ingredient.ingredientName, nameYomi: ingredient.ingredientNameYomi, katakanaLowercasedNameForSearch: ingredient.katakanaLowercasedNameForSearch , stockFlag: ingredient.stockFlag, category: ingredient.category, contributionToRecipeAvailability: ingredient.contributionToRecipeAvailability, usedRecipeNum: ingredient.recipeIngredients.count, reminderSetDate: ingredient.reminderSetDate))
                    }
                    
                    self.hasIngredientAtAll = il.count > 0

                    let searchText = self.searchTextField.text!
                    let convertedSearchText = searchText.convertToYomi().katakanaLowercasedForSearch()
                    if searchText.withoutMiddleSpaceAndMiddleDot() != ""{
                        il.removeAll{
                            ($0.katakanaLowercasedNameForSearch.contains(convertedSearchText) == false) &&
                            ($0.name.contains(searchText) == false)
                        }
                    }
                    
                    self.textFieldHasSearchResult = il.count > 0
                    self.setTextFieldColor(textField: self.searchTextField)
                    self.setTableBackgroundView()
                    tableView.deleteRows(at: [indexPath], with: .middle)
                    if self.isReminderMode{
                        self.navigationItem.title = "購入リマインダー(" + String(self.ingredientBasicList.count) + ")"
                    }else{
                        self.navigationItem.title = "材料(" + String(self.ingredientBasicList.count) + "/" + String(self.ingredientList!.count) + ")"
                    }
                    self.setReminderBadge()
                    completionHandler(true)
                }))
                deleteAlertView.addAction(UIAlertAction(title: "キャンセル", style: .cancel){action in
                    completionHandler(false)
                })
                deleteAlertView.alertStatusBarStyle = UchicockStyle.statusBarStyle
                deleteAlertView.modalPresentationCapturesStatusBarAppearance = true
                self.present(deleteAlertView, animated: true, completion: nil)
            }
        })
        del.image = UIImage(named: "button-delete")
        del.backgroundColor = UchicockStyle.alertColor
        
        let realm = try! Realm()
        let ingredient = realm.object(ofType: Ingredient.self, forPrimaryKey: self.ingredientBasicList[indexPath.row].id)!
        if ingredient.recipeIngredients.count == 0 && isReminderMode == false {
            return UISwipeActionsConfiguration(actions: [del, edit])
        }else{
            return UISwipeActionsConfiguration(actions: [edit])
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientListItem") as! IngredientListItemTableViewCell
        cell.selectedBackgroundView = selectedCellBackgroundView
        cell.backgroundColor = UchicockStyle.basicBackgroundColor

        let disclosureIndicator = UIImage(named: "accesory-disclosure-indicator")
        let accesoryImageView = UIImageView(image: disclosureIndicator)
        accesoryImageView.tintColor = UchicockStyle.labelTextColorLight
        accesoryImageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        cell.accessoryView = accesoryImageView

        cell.stockState = stockState.selectedSegmentIndex
        
        let realm = try! Realm()
        let ingredient = realm.object(ofType: Ingredient.self, forPrimaryKey: self.ingredientBasicList[indexPath.row].id)!
        cell.ingredient = ingredient

        cell.stock.addTarget(self, action: #selector(IngredientListViewController.cellStockTapped(_:)), for: UIControl.Event.valueChanged)
        
        return cell
    }
    
    // MARK: - IBAction
    @IBAction func reminderButtonTapped(_ sender: UIBarButtonItem) {
        isReminderMode.toggle()
        
        isReminderMode ? changeToReminderMode() : changeToIngredientMode()
        reloadIngredientBasicList()
        tableView.reloadData()
    }
    
    private func changeToReminderMode(){
        reminderButton.image = UIImage(named: "navigation-reminder-filled")
        searchTextFieldTopConstraint.constant = 0
        searchTextFieldHeightConstraint.constant = 0
        searchTextFieldBottomConstraint.constant = 0
        categoryHeightConstraint.constant = 0
        category.isHidden = true
        categoryBottomConstraint.constant = 0
        stockStateHeightConstraint.constant = 0
        stockState.isHidden = true
        stockStateBottomConstraint.constant = 0
        ingredientRecommendButtonHeightConstraint.constant = 0
        ingredientRecommendButton.isHidden = true
        containerSeparatorTopConstraint.constant = 0
        containerSeparatorLandscapeTopConstraint.constant = 0
        containerSeparatorHeightConstraint.constant = 0
        addIngredientButton.isEnabled = false
        searchTextField.resignFirstResponder()
    }
    
    private func changeToIngredientMode(){
        reminderButton.image = UIImage(named: "navigation-reminder-empty")
        searchTextFieldTopConstraint.constant = 4
        searchTextFieldHeightConstraint.constant = 36
        searchTextFieldBottomConstraint.constant = 4
        categoryHeightConstraint.constant = 28
        category.isHidden = false
        categoryBottomConstraint.constant = 4
        stockStateHeightConstraint.constant = 28
        stockState.isHidden = false
        stockStateBottomConstraint.constant = 8
        ingredientRecommendButtonHeightConstraint.constant = 30
        ingredientRecommendButton.isHidden = false
        containerSeparatorTopConstraint.constant = 6
        containerSeparatorLandscapeTopConstraint.constant = 4
        containerSeparatorHeightConstraint.constant = 1
        addIngredientButton.isEnabled = true
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        if let editNavi = UIStoryboard(name: "IngredientEdit", bundle: nil).instantiateViewController(withIdentifier: "IngredientEditNavigation") as? BasicNavigationController{
            guard let editVC = editNavi.visibleViewController as? IngredientEditTableViewController else{
                return
            }
            
            editNavi.modalPresentationStyle = .fullScreen
            editNavi.modalTransitionStyle = .coverVertical
            editVC.mainNavigationController = self.navigationController as? BasicNavigationController
            self.present(editNavi, animated: true, completion: nil)
        }
    }
    
    @IBAction func categoryTapped(_ sender: UISegmentedControl) {
        reloadIngredientBasicList()
        tableView.reloadData()
    }
    
    @IBAction func stockStateTapped(_ sender: UISegmentedControl) {
        reloadIngredientBasicList()
        tableView.reloadData()
    }
    
    @IBAction func ingredientRecommendButtonTapped(_ sender: UIButton) {
        tableView.setContentOffset(tableView.contentOffset, animated: false)
        let storyboard = UIStoryboard(name: "IngredientRecommend", bundle: nil)
        let nvc = storyboard.instantiateViewController(withIdentifier: "IngredientRecommendNavigationController") as! BasicNavigationController
        let vc = nvc.visibleViewController as! IngredientRecommendTableViewController
        
        vc.onDoneBlock = { selectedRecommendIngredientId in
            if let selectedRecommendIngredientId = selectedRecommendIngredientId{
                let realm = try! Realm()
                let ing = realm.object(ofType: Ingredient.self, forPrimaryKey: selectedRecommendIngredientId)
                if ing != nil{
                    self.performSegue(withIdentifier: "PushIngredientDetail", sender: selectedRecommendIngredientId)
                }
            }
            self.highlightSelectedRow()
        }
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad{
            nvc.modalPresentationStyle = .pageSheet
        }else{
            nvc.modalPresentationStyle = .custom
            nvc.transitioningDelegate = self
            vc.interactor = interactor
        }
        
        searchTextField.resignFirstResponder()
        present(nvc, animated: true)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let pc = ModalPresentationController(presentedViewController: presented, presenting: presenting)
        return pc
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissModalAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PushIngredientDetail" {
            let vc = segue.destination as! IngredientDetailTableViewController
            if let indexPath = sender as? IndexPath{
                selectedIngredientId = ingredientBasicList[indexPath.row].id
                vc.ingredientId = ingredientBasicList[indexPath.row].id
            }else if let id = sender as? String{
                selectedIngredientId = id
                vc.ingredientId = id
            }
        }
    }
}
