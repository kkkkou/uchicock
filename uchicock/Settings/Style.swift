//
//  Style.swift
//  uchicock
//
//  Created by Kou Kinyo on 2017/02/27.
//  Copyright © 2017年 Kou. All rights reserved.
//

import Foundation
import ChameleonFramework

struct Style{
    static var no = 0
    static var isDark = false
    static var primaryColor = FlatYellow()
    static var secondaryColor = FlatSkyBlueDark()
    static var basicBackgroundColor = FlatWhite()
    static var tableViewHeaderBackgroundColor = FlatWhiteDark()
    static var labelTextColor = FlatBlack()
    static var labelTextColorLight = FlatGrayDark()
    static var labelTextColorOnBadge = FlatWhite()
    static var labelTextColorOnDisableBadge = FlatBlack()
    static var textFieldBackgroundColor = UIColor.white
    static var filterContainerBackgroundColor = FlatSand()
    static var deleteColor = FlatRed()
    static var tabBarTintColor = FlatOrange()
    static var tabBarBarTintColor = FlatWhite()
    static var tableViewCellSelectedBackgroundColor = FlatWhiteDark()
    static var tableViewCellEditBackgroundColor = FlatGray()
    static var tableViewCellReminderBackgroundColor = FlatSkyBlueDark()
    static var badgeDisableBackgroundColor = FlatWhiteDark()
    static var memoBorderColor = FlatWhiteDark()
    static var checkboxSecondaryTintColor = FlatGray()
    
    static func tequilaSunriseLight(){
        no = 0
        isDark = false
        primaryColor = FlatYellow()
        secondaryColor = FlatSkyBlueDark()
        Chameleon.setGlobalThemeUsingPrimaryColor(Style.primaryColor, withSecondaryColor: Style.secondaryColor, andContentStyle: UIContentStyle.contrast)
        basicBackgroundColor = FlatWhite()
        tableViewHeaderBackgroundColor = FlatWhiteDark()
        labelTextColor = FlatBlack()
        labelTextColorLight = FlatGrayDark()
        labelTextColorOnBadge = FlatWhite()
        labelTextColorOnDisableBadge = FlatBlack()
        textFieldBackgroundColor = UIColor.white
        filterContainerBackgroundColor = FlatSand()
        deleteColor = FlatRed()
        tabBarTintColor = FlatOrange()
        tabBarBarTintColor = FlatWhite()
        tableViewCellSelectedBackgroundColor = FlatWhiteDark()
        tableViewCellEditBackgroundColor = FlatGray()
        tableViewCellReminderBackgroundColor = FlatSkyBlueDark()
        badgeDisableBackgroundColor = FlatWhiteDark()
        memoBorderColor = FlatWhiteDark()
        checkboxSecondaryTintColor = FlatGray()
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Style.tableViewCellSelectedBackgroundColor
        UITableViewCell.appearance().selectedBackgroundView = backgroundView
    }
    
    static func tequilaSunriseDark(){
        no = 1
        isDark = true
        primaryColor = FlatYellow()
        secondaryColor = FlatYellowDark()
        Chameleon.setGlobalThemeUsingPrimaryColor(Style.primaryColor, withSecondaryColor: Style.secondaryColor, andContentStyle: UIContentStyle.contrast)
        basicBackgroundColor = FlatBlack()
        tableViewHeaderBackgroundColor = FlatGrayDark()
        labelTextColor = FlatWhite()
        labelTextColorLight = FlatGray()
        labelTextColorOnBadge = FlatBlack()
        labelTextColorOnDisableBadge = FlatBlack()
        textFieldBackgroundColor = FlatGrayDark()
        filterContainerBackgroundColor = FlatBlack()
        deleteColor = FlatRedDark()
        tabBarTintColor = FlatOrange()
        tabBarBarTintColor = FlatBlack()
        tableViewCellSelectedBackgroundColor = FlatYellowDark()
        tableViewCellEditBackgroundColor = FlatGrayDark()
        tableViewCellReminderBackgroundColor = FlatYellowDark()
        badgeDisableBackgroundColor = FlatGrayDark()
        memoBorderColor = FlatGrayDark()
        checkboxSecondaryTintColor = FlatGrayDark()
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Style.tableViewCellSelectedBackgroundColor
        UITableViewCell.appearance().selectedBackgroundView = backgroundView
    }

    static func loadTheme(){
        let defaults = UserDefaults.standard
        if let no = defaults.string(forKey: "Theme"){
            if no == "0"		{ tequilaSunriseLight()	}
            if no == "1"		{ tequilaSunriseDark()	}
        }else{
            defaults.set("0", forKey: "Theme")
            tequilaSunriseLight()
        }
    }
    
    static func saveTheme(themeNo: String){
        let defaults = UserDefaults.standard
        defaults.set(themeNo, forKey: "Theme")
    }
}
