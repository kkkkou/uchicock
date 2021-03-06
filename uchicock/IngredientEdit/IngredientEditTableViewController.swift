//
//  IngredientEditTableViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2016/03/23.
//  Copyright © 2016年 Kou. All rights reserved.
//

import UIKit
import RealmSwift

class IngredientEditTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var ingredientNameTextField: CustomTextField!
    @IBOutlet weak var ingredientNameCounterLabel: UILabel!
    @IBOutlet weak var ingredientNameYomiLabel: UILabel!
    @IBOutlet weak var ingredientNameYomiTextField: CustomTextField!
    @IBOutlet weak var ingredientNameYomiCounterLabel: UILabel!
    @IBOutlet weak var stockCheckbox: CircularCheckbox!
    @IBOutlet weak var categorySegmentedControl: CustomSegmentedControl!
    @IBOutlet weak var memoTextView: CustomTextView!
    @IBOutlet weak var memoDescriptionLabel: UILabel!
    @IBOutlet weak var memoCounterLabel: UILabel!
    
    weak var mainNavigationController : BasicNavigationController?
    
    var ingredient = Ingredient()

    let ingredientNameMaximum = 30
    let ingredientNameYomiMaximum = 50
    let memoMaximum = 300
    var isAddMode = true
    var showCancelAlert = false

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UchicockStyle.statusBarStyle
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ingredient.ingredientName == "" {
            self.navigationItem.title = "材料登録"
            isAddMode = true
        }else{
            self.navigationItem.title = "材料編集"
            isAddMode = false
        }

        ingredientNameTextField.text = ingredient.ingredientName
        ingredientNameTextField.layer.cornerRadius = ingredientNameTextField.frame.size.height / 2
        ingredientNameTextField.attributedPlaceholder = NSAttributedString(string: "材料名", attributes: [NSAttributedString.Key.foregroundColor: UchicockStyle.labelTextColorLight])
        ingredientNameTextField.adjustClearButtonColor()
        ingredientNameTextField.setLeftPadding()
        NotificationCenter.default.addObserver(self, selector:#selector(IngredientEditTableViewController.ingredientNameTextFieldDidChange(_:)), name: CustomTextField.textDidChangeNotification, object: self.ingredientNameTextField)
        NotificationCenter.default.addObserver(self, selector: #selector(IngredientEditTableViewController.ingredientNameTextFieldDidChange(_:)), name: .textFieldClearButtonTappedNotification, object: self.ingredientNameTextField)

        ingredientNameYomiLabel.textColor = UchicockStyle.labelTextColorLight
        ingredientNameYomiTextField.text = ingredient.ingredientNameYomi
        ingredientNameYomiTextField.layer.cornerRadius = ingredientNameYomiTextField.frame.size.height / 2
        ingredientNameYomiTextField.attributedPlaceholder = NSAttributedString(string: "材料名（ヨミガナ）", attributes: [NSAttributedString.Key.foregroundColor: UchicockStyle.labelTextColorLight])
        ingredientNameYomiTextField.setLeftPadding()
        ingredientNameYomiTextField.setRightPadding()
        NotificationCenter.default.addObserver(self, selector:#selector(IngredientEditTableViewController.ingredientNameYomiTextFieldDidChange(_:)), name: CustomTextField.textDidChangeNotification, object: self.ingredientNameYomiTextField)

        stockCheckbox.checkState = ingredient.stockFlag ? .checked : .unchecked
        stockCheckbox.secondaryTintColor = UchicockStyle.primaryColor
        stockCheckbox.secondaryCheckmarkTintColor = UchicockStyle.labelTextColorOnBadge

        if ingredient.category >= 0 && ingredient.category < 3 {
            categorySegmentedControl.selectedSegmentIndex = ingredient.category
        }else{
            categorySegmentedControl.selectedSegmentIndex = 2
        }
        
        memoTextView.text = ingredient.memo
        memoTextView.backgroundColor = UchicockStyle.basicBackgroundColorLight
        memoTextView.layer.masksToBounds = true
        memoTextView.layer.cornerRadius = 12
        memoTextView.layer.borderWidth = 0
        memoTextView.keyboardAppearance = UchicockStyle.keyboardAppearance
        memoTextView.indicatorStyle = UchicockStyle.isBackgroundDark ? .white : .black
        memoDescriptionLabel.textColor = UchicockStyle.labelTextColorLight
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.backgroundColor = UchicockStyle.basicBackgroundColor
        tableView.separatorColor = UchicockStyle.tableViewSeparatorColor
        tableView.indicatorStyle = UchicockStyle.isBackgroundDark ? .white : .black

        setTextFieldColor(textField: ingredientNameTextField, maximum: ingredientNameMaximum)
        setTextFieldColor(textField: ingredientNameYomiTextField, maximum: ingredientNameYomiMaximum)
        setTextViewColor(textView: memoTextView, maximum: memoMaximum)
        updateIngredientNameCounter()
        updateIngredientNameYomiCounter()
        updateMemoCounter()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isAddMode{ ingredientNameTextField.becomeFirstResponder() }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        ingredientNameTextField.resignFirstResponder()
        ingredientNameYomiTextField.resignFirstResponder()
        return true
    }
    
    @objc func ingredientNameTextFieldDidChange(_ notification: Notification){
        ingredientNameTextField.adjustClearButtonColor()
        ingredientNameYomiTextField.text = ingredientNameTextField.text!.convertToYomi()
        showCancelAlert = true
        updateIngredientNameCounter()
        updateIngredientNameYomiCounter()
        setTextFieldColor(textField: ingredientNameTextField, maximum: ingredientNameMaximum)
        setTextFieldColor(textField: ingredientNameYomiTextField, maximum: ingredientNameYomiMaximum)
    }
    
    @objc func ingredientNameYomiTextFieldDidChange(_ notification: Notification){
        showCancelAlert = true
        updateIngredientNameYomiCounter()
        setTextFieldColor(textField: ingredientNameYomiTextField, maximum: ingredientNameYomiMaximum)
    }
    
    private func updateIngredientNameCounter(){
        let num = ingredientNameTextField.text!.withoutEndsSpace().count
        ingredientNameCounterLabel.text = String(num) + "/" + String(ingredientNameMaximum)
        
        if num > ingredientNameMaximum{
            ingredientNameCounterLabel.textColor = UchicockStyle.alertColor
        }else{
            ingredientNameCounterLabel.textColor = UchicockStyle.labelTextColorLight
        }
    }
    
    private func updateIngredientNameYomiCounter(){
        let num = ingredientNameYomiTextField.text!.withoutEndsSpace().count
        ingredientNameYomiCounterLabel.text = String(num) + "/" + String(ingredientNameYomiMaximum)
        
        if num > ingredientNameYomiMaximum{
            ingredientNameYomiCounterLabel.textColor = UchicockStyle.alertColor
        }else{
            ingredientNameYomiCounterLabel.textColor = UchicockStyle.labelTextColorLight
        }
    }
    
    private func setTextFieldColor(textField: UITextField, maximum: Int){
        if textField.text!.withoutEndsSpace().count > maximum {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UchicockStyle.alertColor.cgColor
            textField.textColor = UchicockStyle.alertColor
        }else{
            textField.layer.borderWidth = 0
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.textColor = UchicockStyle.labelTextColor
        }
    }
    
    // MARK: - UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        showCancelAlert = true
        updateMemoCounter()
        setTextViewColor(textView: textView, maximum: memoMaximum)
    }
    
    private func updateMemoCounter(){
        let num = memoTextView.text.count
        memoCounterLabel.text = String(num) + "/" + String(memoMaximum)
            
        if num > memoMaximum{
            memoCounterLabel.textColor = UchicockStyle.alertColor
        }else{
            memoCounterLabel.textColor = UchicockStyle.labelTextColorLight
        }
    }
    
    private func setTextViewColor(textView: UITextView, maximum: Int){
        if textView.text!.count > maximum {
            textView.layer.borderWidth = 1
            textView.layer.borderColor = UchicockStyle.alertColor.cgColor
            textView.textColor = UchicockStyle.alertColor
        }else{
            textView.layer.borderWidth = 0
            textView.layer.borderColor = UIColor.clear.cgColor
            textView.textColor = UchicockStyle.labelTextColor
        }
    }
    
    // MARK: - UITableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        cell.backgroundColor = UchicockStyle.basicBackgroundColor
        if indexPath.row < 3{
            cell.separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 12)
        }else{
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        }
        return cell
    }

    // MARK: - IBAction
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        guard showCancelAlert else{
            self.dismiss(animated: true, completion: nil)
            return
        }

        let alertView = CustomAlertController(title: nil, message: "編集をやめますか？", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "はい",style: .default){action in
            self.dismiss(animated: true, completion: nil)
        }
        if #available(iOS 13.0, *){ yesAction.setValue(UchicockStyle.primaryColor, forKey: "titleTextColor") }
        alertView.addAction(yesAction)
        let noAction = UIAlertAction(title: "いいえ", style: .cancel, handler: nil)
        if #available(iOS 13.0, *){ noAction.setValue(UchicockStyle.primaryColor, forKey: "titleTextColor") }
        alertView.addAction(noAction)
        alertView.modalPresentationCapturesStatusBarAppearance = true
        present(alertView, animated: true, completion: nil)
    }
    
    private func presentAlert(title: String, message: String?, action: (() -> Void)?){
        let alertView = CustomAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default){_ in
            action?()
        }
        if #available(iOS 13.0, *){ alertAction.setValue(UchicockStyle.primaryColor, forKey: "titleTextColor") }
        alertView.addAction(alertAction)
        alertView.modalPresentationCapturesStatusBarAppearance = true
        present(alertView, animated: true, completion: nil)
    }

    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        ingredientNameTextField.resignFirstResponder()
        ingredientNameYomiTextField.resignFirstResponder()
        memoTextView.resignFirstResponder()
        
        guard ingredientNameTextField.text != nil && ingredientNameTextField.text!.withoutEndsSpace() != "" else{
            presentAlert(title: "材料名を入力してください", message: nil, action: {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                self.ingredientNameTextField.becomeFirstResponder()
            })
            return
        }
        guard ingredientNameTextField.text!.withoutEndsSpace().count <= ingredientNameMaximum else{
            presentAlert(title: "材料名を" + String(ingredientNameMaximum) + "文字以下にしてください", message: nil, action: {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                self.ingredientNameTextField.becomeFirstResponder()
            })
            return
        }
        guard ingredientNameYomiTextField.text != nil && ingredientNameYomiTextField.text!.withoutEndsSpace() != "" else{
            presentAlert(title: "ヨミガナを入力してください", message: nil, action: {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                self.ingredientNameYomiTextField.becomeFirstResponder()
            })
            return
        }
        guard ingredientNameYomiTextField.text!.withoutEndsSpace().count <= ingredientNameYomiMaximum else{
            presentAlert(title: "ヨミガナを" + String(ingredientNameYomiMaximum) + "文字以下にしてください", message: nil, action: {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                self.ingredientNameYomiTextField.becomeFirstResponder()
            })
            return
        }
        guard  memoTextView.text.count <= memoMaximum else{
            presentAlert(title: "メモを" + String(memoMaximum) + "文字以下にしてください", message: nil, action: {
                self.tableView.scrollToRow(at: IndexPath(row: 3, section: 0), at: .bottom, animated: true)
                self.memoTextView.becomeFirstResponder()
            })
            return
        }

        let realm = try! Realm()
        let sameNameIngredient = realm.objects(Ingredient.self).filter("ingredientName == %@", ingredientNameTextField.text!.withoutEndsSpace())
        guard ingredientNameTextField.text!.withoutEndsSpace() != "" &&
            (sameNameIngredient.count == 0 || ingredient.ingredientName == ingredientNameTextField.text!.withoutEndsSpace()) else{
            presentAlert(title: "同じ名前の材料が既に登録されています", message: "材料名を変更してください", action: {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                self.ingredientNameTextField.becomeFirstResponder()
            })
            return
        }
        
        saveIngredient()
    }
    
    private func saveIngredient(){
        let realm = try! Realm()
        try! realm.write {
            if isAddMode { realm.add(ingredient) }

            ingredient.ingredientName = ingredientNameTextField.text!.withoutEndsSpace()
            ingredient.ingredientNameYomi = ingredientNameYomiTextField.text!.withoutEndsSpace()
            ingredient.katakanaLowercasedNameForSearch = ingredientNameYomiTextField.text!.katakanaLowercasedForSearch()
            ingredient.category = categorySegmentedControl.selectedSegmentIndex
            ingredient.stockFlag = stockCheckbox.checkState == .checked
            ingredient.memo = memoTextView.text
            for ri in ingredient.recipeIngredients{
                ri.recipe.updateShortageNum()
            }
            if isAddMode{
                MessageHUD.show("材料を登録しました", for: 2.0, withCheckmark: true, isCenter: true)
            }else{
                MessageHUD.show("材料を保存しました", for: 2.0, withCheckmark: true, isCenter: true)
            }
        }
        let detailVC = UIStoryboard(name: "IngredientDetail", bundle: nil).instantiateViewController(withIdentifier: "IngredientDetail") as! IngredientDetailTableViewController
        detailVC.ingredientId = ingredient.id
        
        if mainNavigationController != nil {
            mainNavigationController!.pushViewController(detailVC, animated: false)
            detailVC.closeEditVC(self)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func stockCheckboxTapped(_ sender: CircularCheckbox) {
        showCancelAlert = true
    }
    
    @IBAction func categorySegmentedControlTapped(_ sender: CustomSegmentedControl) {
        showCancelAlert = true
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
