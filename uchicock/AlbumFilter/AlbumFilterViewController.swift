//
//  AlbumFilterViewController.swift
//  uchicock
//
//  Created by Kou Kinyo on 2019/06/19.
//  Copyright © 2019 Kou. All rights reserved.
//

import UIKit

class AlbumFilterViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: CustomScrollView!
    @IBOutlet weak var scrollBackgroundView: UIView!
    
    @IBOutlet weak var filterExplanationLabel: UILabel!
    @IBOutlet weak var filterSelectAllButton: UIButton!
    
    @IBOutlet weak var favoriteDeselectAllButton: UIButton!
    @IBOutlet weak var favoriteSelectAllButton: UIButton!
    @IBOutlet weak var favorite0Checkbox: CircularCheckbox!
    @IBOutlet weak var favorite1Checkbox: CircularCheckbox!
    @IBOutlet weak var favorite2Checkbox: CircularCheckbox!
    @IBOutlet weak var favorite3Checkbox: CircularCheckbox!
    @IBOutlet weak var favorite0Button: UIButton!
    @IBOutlet weak var favorite1Button: UIButton!
    @IBOutlet weak var favorite2Button: UIButton!
    @IBOutlet weak var favorite3Button: UIButton!
    @IBOutlet weak var favoriteWarningImage: UIImageView!
    @IBOutlet weak var favoriteWarningLabel: UILabel!
    
    @IBOutlet weak var styleDeselectAllButton: UIButton!
    @IBOutlet weak var styleSelectAllButton: UIButton!
    @IBOutlet weak var styleLongCheckbox: CircularCheckbox!
    @IBOutlet weak var styleShortCheckbox: CircularCheckbox!
    @IBOutlet weak var styleHotCheckbox: CircularCheckbox!
    @IBOutlet weak var styleNoneCheckbox: CircularCheckbox!
    @IBOutlet weak var styleLongButton: UIButton!
    @IBOutlet weak var styleShortButton: UIButton!
    @IBOutlet weak var styleHotButton: UIButton!
    @IBOutlet weak var styleNoneButton: UIButton!
    @IBOutlet weak var styleWarningImage: UIImageView!
    @IBOutlet weak var styleWarningLabel: UILabel!
    
    @IBOutlet weak var methodDeselectAllButton: UIButton!
    @IBOutlet weak var methodSelectAllButton: UIButton!
    @IBOutlet weak var methodBuildCheckbox: CircularCheckbox!
    @IBOutlet weak var methodStirCheckbox: CircularCheckbox!
    @IBOutlet weak var methodShakeCheckbox: CircularCheckbox!
    @IBOutlet weak var methodBlendCheckbox: CircularCheckbox!
    @IBOutlet weak var methodOthersCheckbox: CircularCheckbox!
    @IBOutlet weak var methodBuildButton: UIButton!
    @IBOutlet weak var methodStirButton: UIButton!
    @IBOutlet weak var methodShakeButton: UIButton!
    @IBOutlet weak var methodBlendButton: UIButton!
    @IBOutlet weak var methodOthersButton: UIButton!
    @IBOutlet weak var methodWarningImage: UIImageView!
    @IBOutlet weak var methodWarningLabel: UILabel!
    
    @IBOutlet weak var strengthDeselectAllButton: UIButton!
    @IBOutlet weak var strengthSelectAllButton: UIButton!
    @IBOutlet weak var strengthNonAlcoholCheckbox: CircularCheckbox!
    @IBOutlet weak var strengthWeakCheckbox: CircularCheckbox!
    @IBOutlet weak var strengthMediumCheckbox: CircularCheckbox!
    @IBOutlet weak var strengthStrongCheckbox: CircularCheckbox!
    @IBOutlet weak var strengthNoneCheckbox: CircularCheckbox!
    @IBOutlet weak var strengthNonAlcoholButton: UIButton!
    @IBOutlet weak var strengthWeakButton: UIButton!
    @IBOutlet weak var strengthMediumButton: UIButton!
    @IBOutlet weak var strengthStrongButton: UIButton!
    @IBOutlet weak var strengthNoneButton: UIButton!
    @IBOutlet weak var strengthWarningImage: UIImageView!
    @IBOutlet weak var strengthWarningLabel: UILabel!
    
    @IBOutlet weak var secondSeparator: UIView!
    @IBOutlet weak var searchButtonBackgroundView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    
    var udPrefix = "album-"
    
    var recipeBasicList = Array<RecipeBasic>()
    var filteredRecipeBasicList = Array<RecipeBasic>()

    var interactor: Interactor?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UchicockStyle.statusBarStyle
    }
    
    var onDoneBlock = {}
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if interactor != nil{
            scrollView.panGestureRecognizer.addTarget(self, action: #selector(self.handleGesture(_:)))
        }

        initCheckboxFromUserDefaults()
        filterRecipeBasic()
        setStyle()
    }
    
    private func setStyle(){
        self.view.backgroundColor = UchicockStyle.basicBackgroundColor
        scrollView.backgroundColor = UchicockStyle.basicBackgroundColor
        scrollView.indicatorStyle = UchicockStyle.isBackgroundDark ? .white : .black
        scrollBackgroundView.backgroundColor = UchicockStyle.basicBackgroundColor

        filterExplanationLabel.textColor = UchicockStyle.labelTextColorLight
        filterSelectAllButton.setTitleColor(UchicockStyle.primaryColor, for: .normal)

        favoriteDeselectAllButton.setTitleColor(UchicockStyle.alertColor, for: .normal)
        favoriteSelectAllButton.setTitleColor(UchicockStyle.primaryColor, for: .normal)
        favorite0Button.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        favorite1Button.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        favorite2Button.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        favorite3Button.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        favoriteWarningImage.tintColor = UchicockStyle.alertColor
        favoriteWarningLabel.textColor = UchicockStyle.alertColor
        setFavoriteWarningVisibility()
        
        styleDeselectAllButton.setTitleColor(UchicockStyle.alertColor, for: .normal)
        styleSelectAllButton.setTitleColor(UchicockStyle.primaryColor, for: .normal)
        styleLongButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        styleShortButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        styleHotButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        styleNoneButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        styleWarningImage.tintColor = UchicockStyle.alertColor
        styleWarningLabel.textColor = UchicockStyle.alertColor
        setStyleWarningVisibility()
        
        methodDeselectAllButton.setTitleColor(UchicockStyle.alertColor, for: .normal)
        methodSelectAllButton.setTitleColor(UchicockStyle.primaryColor, for: .normal)
        methodBuildButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        methodStirButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        methodShakeButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        methodBlendButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        methodOthersButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        methodWarningImage.tintColor = UchicockStyle.alertColor
        methodWarningLabel.textColor = UchicockStyle.alertColor
        setMethodWarningVisibility()
        
        strengthDeselectAllButton.setTitleColor(UchicockStyle.alertColor, for: .normal)
        strengthSelectAllButton.setTitleColor(UchicockStyle.primaryColor, for: .normal)
        strengthNonAlcoholButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        strengthWeakButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        strengthMediumButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        strengthStrongButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        strengthNoneButton.setTitleColor(UchicockStyle.labelTextColor, for: .normal)
        strengthWarningImage.tintColor = UchicockStyle.alertColor
        strengthWarningLabel.textColor = UchicockStyle.alertColor
        setStrengthWarningVisibility()

        secondSeparator.backgroundColor = UchicockStyle.tableViewSeparatorColor
        searchButtonBackgroundView.backgroundColor = UchicockStyle.basicBackgroundColor
        searchButton.layer.borderColor = UchicockStyle.primaryColor.cgColor
        searchButton.layer.borderWidth = 1.5
        searchButton.layer.cornerRadius = searchButton.frame.size.height / 2
        searchButton.setTitleColor(UchicockStyle.primaryColor, for: .normal)
    }
    
    // 下に引っ張ると戻してもviewWillDisappear, viewwWillAppear, viewDidAppearが呼ばれることに注意
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.flashScrollIndicators()
    }
    
    // 下に引っ張ると戻してもviewWillDisappear, viewwWillAppear, viewDidAppearが呼ばれることに注意
    // 大事な処理はviewDidDisappearの中でする
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.onDoneBlock()
    }
    
    // MARK: - Logic functions
    private func initCheckboxFromUserDefaults(){
        let defaults = UserDefaults.standard
        
        initFilterCheckbox(favorite0Checkbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterStar0Key))
        initFilterCheckbox(favorite1Checkbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterStar1Key))
        initFilterCheckbox(favorite2Checkbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterStar2Key))
        initFilterCheckbox(favorite3Checkbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterStar3Key))
        initFilterCheckbox(styleLongCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterLongKey))
        initFilterCheckbox(styleShortCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterShortKey))
        initFilterCheckbox(styleHotCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterHotKey))
        initFilterCheckbox(styleNoneCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterStyleNoneKey))
        initFilterCheckbox(methodBuildCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterBuildKey))
        initFilterCheckbox(methodStirCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterStirKey))
        initFilterCheckbox(methodShakeCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterShakeKey))
        initFilterCheckbox(methodBlendCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterBlendKey))
        initFilterCheckbox(methodOthersCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterOthersKey))
        initFilterCheckbox(strengthNonAlcoholCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterNonAlcoholKey))
        initFilterCheckbox(strengthWeakCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterWeakKey))
        initFilterCheckbox(strengthMediumCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterMediumKey))
        initFilterCheckbox(strengthStrongCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterStrongKey))
        initFilterCheckbox(strengthNoneCheckbox, shouldBeChecked: defaults.bool(forKey: udPrefix + GlobalConstants.FilterStrengthNoneKey))
    }
    
    private func filterRecipeBasic(){
        var recipeFilterStar: [Int] = []
        var recipeFilterStyle: [Int] = []
        var recipeFilterMethod: [Int] = []
        var recipeFilterStrength: [Int] = []

        if favorite0Checkbox.checkState == .checked { recipeFilterStar.append(0) }
        if favorite1Checkbox.checkState == .checked { recipeFilterStar.append(1) }
        if favorite2Checkbox.checkState == .checked { recipeFilterStar.append(2) }
        if favorite3Checkbox.checkState == .checked { recipeFilterStar.append(3) }
        if styleLongCheckbox.checkState == .checked { recipeFilterStyle.append(0) }
        if styleShortCheckbox.checkState == .checked { recipeFilterStyle.append(1) }
        if styleHotCheckbox.checkState == .checked { recipeFilterStyle.append(2) }
        if styleNoneCheckbox.checkState == .checked { recipeFilterStyle.append(3) }
        if methodBuildCheckbox.checkState == .checked { recipeFilterMethod.append(0) }
        if methodStirCheckbox.checkState == .checked { recipeFilterMethod.append(1) }
        if methodShakeCheckbox.checkState == .checked { recipeFilterMethod.append(2) }
        if methodBlendCheckbox.checkState == .checked { recipeFilterMethod.append(3) }
        if methodOthersCheckbox.checkState == .checked { recipeFilterMethod.append(4) }
        if strengthNonAlcoholCheckbox.checkState == .checked { recipeFilterStrength.append(0) }
        if strengthWeakCheckbox.checkState == .checked { recipeFilterStrength.append(1) }
        if strengthMediumCheckbox.checkState == .checked { recipeFilterStrength.append(2) }
        if strengthStrongCheckbox.checkState == .checked { recipeFilterStrength.append(3) }
        if strengthNoneCheckbox.checkState == .checked { recipeFilterStrength.append(4) }

        filteredRecipeBasicList.removeAll()

        for recipeBasic in recipeBasicList {
            if recipeFilterStar.contains(recipeBasic.favorites) &&
                recipeFilterStyle.contains(recipeBasic.style) &&
                recipeFilterMethod.contains(recipeBasic.method) &&
                recipeFilterStrength.contains(recipeBasic.strength){
                filteredRecipeBasicList.append(recipeBasic)
            }
        }
        
        UIView.performWithoutAnimation {
            searchButton.setTitle("決定 (" + String(filteredRecipeBasicList.count) +  "レシピ)", for: .normal)
            searchButton.layoutIfNeeded()
        }
    }
    
    private func setFavoriteWarningVisibility(){
        if favorite0Checkbox.checkState == .unchecked &&
            favorite1Checkbox.checkState == .unchecked &&
            favorite2Checkbox.checkState == .unchecked &&
            favorite3Checkbox.checkState == .unchecked {
            favoriteWarningImage.isHidden = false
            favoriteWarningLabel.isHidden = false
        }else{
            favoriteWarningImage.isHidden = true
            favoriteWarningLabel.isHidden = true
        }
    }
    
    private func setStyleWarningVisibility(){
        if styleLongCheckbox.checkState == .unchecked &&
            styleShortCheckbox.checkState == .unchecked &&
            styleHotCheckbox.checkState == .unchecked &&
            styleNoneCheckbox.checkState == .unchecked{
            styleWarningImage.isHidden = false
            styleWarningLabel.isHidden = false
        }else{
            styleWarningImage.isHidden = true
            styleWarningLabel.isHidden = true
        }
    }
    
    private func setMethodWarningVisibility(){
        if methodBuildCheckbox.checkState == .unchecked &&
            methodStirCheckbox.checkState == .unchecked &&
            methodShakeCheckbox.checkState == .unchecked &&
            methodBlendCheckbox.checkState == .unchecked &&
            methodOthersCheckbox.checkState == .unchecked {
            methodWarningImage.isHidden = false
            methodWarningLabel.isHidden = false
        }else{
            methodWarningImage.isHidden = true
            methodWarningLabel.isHidden = true
        }
    }
    
    private func setStrengthWarningVisibility(){
        if strengthNonAlcoholCheckbox.checkState == .unchecked &&
            strengthWeakCheckbox.checkState == .unchecked &&
            strengthMediumCheckbox.checkState == .unchecked &&
            strengthStrongCheckbox.checkState == .unchecked &&
            strengthNoneCheckbox.checkState == .unchecked {
            strengthWarningImage.isHidden = false
            strengthWarningLabel.isHidden = false
        }else{
            strengthWarningImage.isHidden = true
            strengthWarningLabel.isHidden = true
        }
    }

    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let int = interactor, int.hasStarted {
            scrollView.contentOffset.y = 0.0
        }
    }
    
    @objc func handleGesture(_ sender: UIPanGestureRecognizer) {
        guard let interactor = interactor else { return }
        let percentThreshold: CGFloat = 0.3
        
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        if scrollView.contentOffset.y <= 0 || interactor.hasStarted{
            switch sender.state {
            case .began:
                interactor.hasStarted = true
                dismiss(animated: true, completion: nil)
            case .changed:
                interactor.shouldFinish = progress > percentThreshold
                interactor.update(progress)
                break
            case .cancelled:
                interactor.hasStarted = false
                interactor.cancel()
            case .ended:
                interactor.hasStarted = false
                interactor.shouldFinish ? interactor.finish() : interactor.cancel()
            default:
                break
            }
        }
    }

    // MARK: - CircularCheckbox
    private func initFilterCheckbox(_ checkbox: CircularCheckbox, shouldBeChecked: Bool){
        shouldBeChecked ? initCheckbox(checkbox, with: .checked) : initCheckbox(checkbox, with: .unchecked)
    }
    
    private func initCheckbox(_ checkbox: CircularCheckbox, with checkState: CircularCheckbox.CheckState){
        checkbox.checkState = checkState
        checkbox.secondaryTintColor = UchicockStyle.primaryColor
        checkbox.secondaryCheckmarkTintColor = UchicockStyle.labelTextColorOnBadge
    }
    
    // MARK: - IBAction
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        self.saveUserDefaults()
        self.dismiss(animated: true, completion: nil)
    }
    
    private func saveUserDefaults(){
        setFilterUserDefaults(with: favorite0Checkbox, forKey: udPrefix + GlobalConstants.FilterStar0Key)
        setFilterUserDefaults(with: favorite1Checkbox, forKey: udPrefix + GlobalConstants.FilterStar1Key)
        setFilterUserDefaults(with: favorite2Checkbox, forKey: udPrefix + GlobalConstants.FilterStar2Key)
        setFilterUserDefaults(with: favorite3Checkbox, forKey: udPrefix + GlobalConstants.FilterStar3Key)
        setFilterUserDefaults(with: styleLongCheckbox, forKey: udPrefix + GlobalConstants.FilterLongKey)
        setFilterUserDefaults(with: styleShortCheckbox, forKey: udPrefix + GlobalConstants.FilterShortKey)
        setFilterUserDefaults(with: styleHotCheckbox, forKey: udPrefix + GlobalConstants.FilterHotKey)
        setFilterUserDefaults(with: styleNoneCheckbox, forKey: udPrefix + GlobalConstants.FilterStyleNoneKey)
        setFilterUserDefaults(with: methodBuildCheckbox, forKey: udPrefix + GlobalConstants.FilterBuildKey)
        setFilterUserDefaults(with: methodStirCheckbox, forKey: udPrefix + GlobalConstants.FilterStirKey)
        setFilterUserDefaults(with: methodShakeCheckbox, forKey: udPrefix + GlobalConstants.FilterShakeKey)
        setFilterUserDefaults(with: methodBlendCheckbox, forKey: udPrefix + GlobalConstants.FilterBlendKey)
        setFilterUserDefaults(with: methodOthersCheckbox, forKey: udPrefix + GlobalConstants.FilterOthersKey)
        setFilterUserDefaults(with: strengthNonAlcoholCheckbox, forKey: udPrefix + GlobalConstants.FilterNonAlcoholKey)
        setFilterUserDefaults(with: strengthWeakCheckbox, forKey: udPrefix + GlobalConstants.FilterWeakKey)
        setFilterUserDefaults(with: strengthMediumCheckbox, forKey: udPrefix + GlobalConstants.FilterMediumKey)
        setFilterUserDefaults(with: strengthStrongCheckbox, forKey: udPrefix + GlobalConstants.FilterStrongKey)
        setFilterUserDefaults(with: strengthNoneCheckbox, forKey: udPrefix + GlobalConstants.FilterStrengthNoneKey)
    }
    
    private func setFilterUserDefaults(with checkbox: CircularCheckbox, forKey key: String){
        let defaults = UserDefaults.standard
        checkbox.checkState == .checked ? defaults.set(true, forKey: key) : defaults.set(false, forKey: key)
    }
    
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func filterSelectAllButtonTapped(_ sender: UIButton) {
        favorite0Checkbox.setCheckState(.checked, animated: true)
        favorite1Checkbox.setCheckState(.checked, animated: true)
        favorite2Checkbox.setCheckState(.checked, animated: true)
        favorite3Checkbox.setCheckState(.checked, animated: true)
        setFavoriteWarningVisibility()

        styleLongCheckbox.setCheckState(.checked, animated: true)
        styleShortCheckbox.setCheckState(.checked, animated: true)
        styleHotCheckbox.setCheckState(.checked, animated: true)
        styleNoneCheckbox.setCheckState(.checked, animated: true)
        setStyleWarningVisibility()

        methodBuildCheckbox.setCheckState(.checked, animated: true)
        methodStirCheckbox.setCheckState(.checked, animated: true)
        methodShakeCheckbox.setCheckState(.checked, animated: true)
        methodBlendCheckbox.setCheckState(.checked, animated: true)
        methodOthersCheckbox.setCheckState(.checked, animated: true)
        setMethodWarningVisibility()

        strengthNonAlcoholCheckbox.setCheckState(.checked, animated: true)
        strengthWeakCheckbox.setCheckState(.checked, animated: true)
        strengthMediumCheckbox.setCheckState(.checked, animated: true)
        strengthStrongCheckbox.setCheckState(.checked, animated: true)
        strengthNoneCheckbox.setCheckState(.checked, animated: true)
        setStrengthWarningVisibility()

        filterRecipeBasic()
    }
    
    @IBAction func favoriteDeselectAllButtonTapped(_ sender: UIButton) {
        favorite0Checkbox.setCheckState(.unchecked, animated: true)
        favorite1Checkbox.setCheckState(.unchecked, animated: true)
        favorite2Checkbox.setCheckState(.unchecked, animated: true)
        favorite3Checkbox.setCheckState(.unchecked, animated: true)
        setFavoriteWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func favoriteSelectAllButtonTapped(_ sender: UIButton) {
        favorite0Checkbox.setCheckState(.checked, animated: true)
        favorite1Checkbox.setCheckState(.checked, animated: true)
        favorite2Checkbox.setCheckState(.checked, animated: true)
        favorite3Checkbox.setCheckState(.checked, animated: true)
        setFavoriteWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func favoriteCheckboxTapped(_ sender: CircularCheckbox) {
        setFavoriteWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func favorite0ButtonTapped(_ sender: UIButton) {
        if favorite0Checkbox.checkState == .checked{
            favorite0Checkbox.setCheckState(.unchecked, animated: true)
        }else if favorite0Checkbox.checkState == .unchecked{
            favorite0Checkbox.setCheckState(.checked, animated: true)
        }
        setFavoriteWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func favorite1ButtonTapped(_ sender: UIButton) {
        if favorite1Checkbox.checkState == .checked{
            favorite1Checkbox.setCheckState(.unchecked, animated: true)
        }else if favorite1Checkbox.checkState == .unchecked{
            favorite1Checkbox.setCheckState(.checked, animated: true)
        }
        setFavoriteWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func favorite2ButtonTapped(_ sender: UIButton) {
        if favorite2Checkbox.checkState == .checked{
            favorite2Checkbox.setCheckState(.unchecked, animated: true)
        }else if favorite2Checkbox.checkState == .unchecked{
            favorite2Checkbox.setCheckState(.checked, animated: true)
        }
        setFavoriteWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func favorite3ButtonTapped(_ sender: UIButton) {
        if favorite3Checkbox.checkState == .checked{
            favorite3Checkbox.setCheckState(.unchecked, animated: true)
        }else if favorite3Checkbox.checkState == .unchecked{
            favorite3Checkbox.setCheckState(.checked, animated: true)
        }
        setFavoriteWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func styleDeselectAllButtonTapped(_ sender: UIButton) {
        styleLongCheckbox.setCheckState(.unchecked, animated: true)
        styleShortCheckbox.setCheckState(.unchecked, animated: true)
        styleHotCheckbox.setCheckState(.unchecked, animated: true)
        styleNoneCheckbox.setCheckState(.unchecked, animated: true)
        setStyleWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func styleSelectAllButtonTapped(_ sender: UIButton) {
        styleLongCheckbox.setCheckState(.checked, animated: true)
        styleShortCheckbox.setCheckState(.checked, animated: true)
        styleHotCheckbox.setCheckState(.checked, animated: true)
        styleNoneCheckbox.setCheckState(.checked, animated: true)
        setStyleWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func styleCheckboxTapped(_ sender: CircularCheckbox) {
        setStyleWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func styleLongButtonTapped(_ sender: UIButton) {
        if styleLongCheckbox.checkState == .checked {
            styleLongCheckbox.setCheckState(.unchecked, animated: true)
        }else if styleLongCheckbox.checkState == .unchecked{
            styleLongCheckbox.setCheckState(.checked, animated: true)
        }
        setStyleWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func styleShortButtonTapped(_ sender: UIButton) {
        if styleShortCheckbox.checkState == .checked {
            styleShortCheckbox.setCheckState(.unchecked, animated: true)
        }else if styleShortCheckbox.checkState == .unchecked{
            styleShortCheckbox.setCheckState(.checked, animated: true)
        }
        setStyleWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func styleHotButtonTapped(_ sender: UIButton) {
        if styleHotCheckbox.checkState == .checked {
            styleHotCheckbox.setCheckState(.unchecked, animated: true)
        }else if styleHotCheckbox.checkState == .unchecked{
            styleHotCheckbox.setCheckState(.checked, animated: true)
        }
        setStyleWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func styleNoneButtonTapped(_ sender: UIButton) {
        if styleNoneCheckbox.checkState == .checked {
            styleNoneCheckbox.setCheckState(.unchecked, animated: true)
        }else if styleNoneCheckbox.checkState == .unchecked{
            styleNoneCheckbox.setCheckState(.checked, animated: true)
        }
        setStyleWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func methodDeselectAllButtonTapped(_ sender: UIButton) {
        methodBuildCheckbox.setCheckState(.unchecked, animated: true)
        methodStirCheckbox.setCheckState(.unchecked, animated: true)
        methodShakeCheckbox.setCheckState(.unchecked, animated: true)
        methodBlendCheckbox.setCheckState(.unchecked, animated: true)
        methodOthersCheckbox.setCheckState(.unchecked, animated: true)
        setMethodWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func methodSelectAllButtonTapped(_ sender: UIButton) {
        methodBuildCheckbox.setCheckState(.checked, animated: true)
        methodStirCheckbox.setCheckState(.checked, animated: true)
        methodShakeCheckbox.setCheckState(.checked, animated: true)
        methodBlendCheckbox.setCheckState(.checked, animated: true)
        methodOthersCheckbox.setCheckState(.checked, animated: true)
        setMethodWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func methodCheckboxTapped(_ sender: CircularCheckbox) {
        setMethodWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func methodBuildButtonTapped(_ sender: UIButton) {
        if methodBuildCheckbox.checkState == .checked {
            methodBuildCheckbox.setCheckState(.unchecked, animated: true)
        }else if methodBuildCheckbox.checkState == .unchecked{
            methodBuildCheckbox.setCheckState(.checked, animated: true)
        }
        setMethodWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func methodStirButtonTapped(_ sender: UIButton) {
        if methodStirCheckbox.checkState == .checked {
            methodStirCheckbox.setCheckState(.unchecked, animated: true)
        }else if methodStirCheckbox.checkState == .unchecked{
            methodStirCheckbox.setCheckState(.checked, animated: true)
        }
        setMethodWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func methodShakeButtonTapped(_ sender: UIButton) {
        if methodShakeCheckbox.checkState == .checked {
            methodShakeCheckbox.setCheckState(.unchecked, animated: true)
        }else if methodShakeCheckbox.checkState == .unchecked{
            methodShakeCheckbox.setCheckState(.checked, animated: true)
        }
        setMethodWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func methodBlendButtonTapped(_ sender: UIButton) {
        if methodBlendCheckbox.checkState == .checked {
            methodBlendCheckbox.setCheckState(.unchecked, animated: true)
        }else if methodBlendCheckbox.checkState == .unchecked{
            methodBlendCheckbox.setCheckState(.checked, animated: true)
        }
        setMethodWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func methodOthersButtonTapped(_ sender: UIButton) {
        if methodOthersCheckbox.checkState == .checked {
            methodOthersCheckbox.setCheckState(.unchecked, animated: true)
        }else if methodOthersCheckbox.checkState == .unchecked{
            methodOthersCheckbox.setCheckState(.checked, animated: true)
        }
        setMethodWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func strengthDeselectAllButtonTapped(_ sender: UIButton) {
        strengthNonAlcoholCheckbox.setCheckState(.unchecked, animated: true)
        strengthWeakCheckbox.setCheckState(.unchecked, animated: true)
        strengthMediumCheckbox.setCheckState(.unchecked, animated: true)
        strengthStrongCheckbox.setCheckState(.unchecked, animated: true)
        strengthNoneCheckbox.setCheckState(.unchecked, animated: true)
        setStrengthWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func strengthSelectAllButtonTapped(_ sender: UIButton) {
        strengthNonAlcoholCheckbox.setCheckState(.checked, animated: true)
        strengthWeakCheckbox.setCheckState(.checked, animated: true)
        strengthMediumCheckbox.setCheckState(.checked, animated: true)
        strengthStrongCheckbox.setCheckState(.checked, animated: true)
        strengthNoneCheckbox.setCheckState(.checked, animated: true)
        setStrengthWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func strengthCheckboxTapped(_ sender: CircularCheckbox) {
        setStrengthWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func strengthNonAlcoholButtonTapped(_ sender: UIButton) {
        if strengthNonAlcoholCheckbox.checkState == .checked {
            strengthNonAlcoholCheckbox.setCheckState(.unchecked, animated: true)
        }else if strengthNonAlcoholCheckbox.checkState == .unchecked{
            strengthNonAlcoholCheckbox.setCheckState(.checked, animated: true)
        }
        setStrengthWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func strengthWeakButtonTapped(_ sender: UIButton) {
        if strengthWeakCheckbox.checkState == .checked {
            strengthWeakCheckbox.setCheckState(.unchecked, animated: true)
        }else if strengthWeakCheckbox.checkState == .unchecked{
            strengthWeakCheckbox.setCheckState(.checked, animated: true)
        }
        setStrengthWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func strengthMediumButtonTapped(_ sender: UIButton) {
        if strengthMediumCheckbox.checkState == .checked {
            strengthMediumCheckbox.setCheckState(.unchecked, animated: true)
        }else if strengthMediumCheckbox.checkState == .unchecked{
            strengthMediumCheckbox.setCheckState(.checked, animated: true)
        }
        setStrengthWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func strengthStrongButtonTapped(_ sender: UIButton) {
        if strengthStrongCheckbox.checkState == .checked {
            strengthStrongCheckbox.setCheckState(.unchecked, animated: true)
        }else if strengthStrongCheckbox.checkState == .unchecked{
            strengthStrongCheckbox.setCheckState(.checked, animated: true)
        }
        setStrengthWarningVisibility()
        filterRecipeBasic()
    }
    
    @IBAction func strengthNoneButtonTapped(_ sender: UIButton) {
        if strengthNoneCheckbox.checkState == .checked {
            strengthNoneCheckbox.setCheckState(.unchecked, animated: true)
        }else if strengthNoneCheckbox.checkState == .unchecked{
            strengthNoneCheckbox.setCheckState(.checked, animated: true)
        }
        setStrengthWarningVisibility()
        filterRecipeBasic()
    }
}
