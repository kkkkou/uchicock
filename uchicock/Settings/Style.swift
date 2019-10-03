//
//  Style.swift
//  uchicock
//
//  Created by Kou Kinyo on 2017/02/27.
//  Copyright © 2017年 Kou. All rights reserved.
//

import Foundation
import UIKit

struct Style{
    static var no = "0"
    static var isDark = false
    static var isBackgroundDark = false
    static var statusBarStyle: UIStatusBarStyle = .default
    static var primaryColor = FlatColor.yellow
    static var secondaryColor = FlatColor.skyBlueDark
    static var basicBackgroundColor = FlatColor.white
    static var tableViewHeaderBackgroundColor = FlatColor.whiteDark
    static var tableViewHeaderTextColor = FlatColor.black
    static var labelTextColor = FlatColor.black
    static var labelTextColorLight = FlatColor.grayDark
    static var labelTextColorOnBadge = FlatColor.white
    static var filterContainerBackgroundColor = FlatColor.sand
    static var deleteColor = FlatColor.red
    static var tabBarTintColor = FlatColor.orange
    static var tabBarBarTintColor = FlatColor.white
    static var tabBarUnselectedItemTintColor = FlatColor.gray
    static var tableViewCellSelectedBackgroundColor = FlatColor.whiteDark
    static var tableViewCellEditBackgroundColor = FlatColor.gray
    static var tableViewCellReminderBackgroundColor = FlatColor.skyBlueDark
    static var badgeDisableBackgroundColor = FlatColor.whiteDark
    static var memoBorderColor = FlatColor.whiteDark

    // MARK: - Define Theme
    static func tequilaSunriseLight(){
        no = "0"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .default
        primaryColor = FlatColor.yellow
        secondaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.sand
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.orange
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.skyBlueDark
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func tequilaSunriseDark(){
        no = "1"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .default
        primaryColor = FlatColor.yellow
        secondaryColor = FlatColor.yellowDark
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.black
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.yellowDark
        tabBarUnselectedItemTintColor = FlatColor.black
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.5, blue:0.0, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.yellowDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }
    
    static func seaBreezeLight(){
        no = "2"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .default
        primaryColor = FlatColor.pink
        secondaryColor = FlatColor.pink
        basicBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        tableViewHeaderBackgroundColor = FlatColor.white
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        filterContainerBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        deleteColor = FlatColor.red
        tabBarTintColor = UIColor.white
        tabBarBarTintColor = FlatColor.pink
        tabBarUnselectedItemTintColor = UIColor(red:0.35, green:0.2, blue:0.3, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.97, green:0.8, blue:0.93, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.pink
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func seaBreezeDark(){
        no = "3"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = FlatColor.pinkDark
        secondaryColor = FlatColor.pinkDark
        basicBackgroundColor = FlatColor.blackDark
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.blackDark
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.pinkDark
        tabBarUnselectedItemTintColor = FlatColor.black
        tableViewCellSelectedBackgroundColor = UIColor(red:0.3, green:0.3, blue:0.3, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.pinkDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }

    static func chinaBlueLight(){
        no = "4"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .lightContent
        primaryColor = FlatColor.skyBlue
        secondaryColor = FlatColor.skyBlue
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.skyBlue
        tabBarUnselectedItemTintColor = UIColor(red:0.2, green:0.2, blue:0.3, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.skyBlueDark
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }

    static func chinaBlueDark(){
        no = "5"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = FlatColor.skyBlueDark
        secondaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.skyBlueDark
        tabBarUnselectedItemTintColor = FlatColor.black
        tableViewCellSelectedBackgroundColor = UIColor(red:0.3, green:0.3, blue:0.3, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.skyBlueDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }

    static func grasshopperLight(){
        no = "6"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .lightContent
        primaryColor = FlatColor.mint
        secondaryColor = FlatColor.mintDark
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.mint
        deleteColor = FlatColor.watermelon
        tabBarTintColor = UIColor.white
        tabBarBarTintColor = FlatColor.mint
        tabBarUnselectedItemTintColor = FlatColor.whiteDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.mintDark
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }

    static func irishCoffeeDark(){
        no = "7"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = FlatColor.coffeeDark
        secondaryColor = FlatColor.coffee
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.coffeeDark
        tabBarUnselectedItemTintColor = FlatColor.gray
        tableViewCellSelectedBackgroundColor = FlatColor.coffeeDark
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.coffeeDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }
    
    static func mojitoLight(){
        no = "8"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .default
        primaryColor = FlatColor.white
        secondaryColor = FlatColor.mint
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        deleteColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.mint
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.mint
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func redEyeLight(){
        no = "9"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .lightContent
        primaryColor = FlatColor.watermelonDark
        secondaryColor = FlatColor.watermelon
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        deleteColor = FlatColor.redDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.watermelonDark
        tabBarUnselectedItemTintColor = FlatColor.whiteDark
        tableViewCellSelectedBackgroundColor = UIColor(red:1.0, green:0.7, blue:0.75, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.watermelon
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func cubaLibreDark(){
        no = "10"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .default
        primaryColor = FlatColor.limeDark
        secondaryColor = FlatColor.limeDark
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.black
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.limeDark
        tabBarUnselectedItemTintColor = FlatColor.blackDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.3, green:0.35, blue:0.1, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.limeDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }
    
    static func silverWingLight(){
        no = "11"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .lightContent
        statusBarStyle = .lightContent
        primaryColor = FlatColor.grayDark
        secondaryColor = FlatColor.grayDark
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.whiteDark
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.black
        tabBarBarTintColor = FlatColor.grayDark
        tabBarUnselectedItemTintColor = FlatColor.white
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.grayDark
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func americanLemonadeDark(){
        no = "12"
        isDark = false
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = FlatColor.watermelonDark
        secondaryColor = FlatColor.watermelonDark
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.watermelonDark
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.black
        tableViewCellSelectedBackgroundColor = UIColor(red:0.4, green:0.45, blue:0.45, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.watermelonDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }
    
    static func blueLagoonLight(){
        no = "13"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.skyBlueDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.skyBlueDark
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func blueLagoonDark(){
        no = "14"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.skyBlueDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.4, green:0.45, blue:0.45, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.skyBlueDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }
    
    static func mimosaLight(){
        no = "15"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.orange
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        deleteColor = FlatColor.redDark
        tabBarTintColor = FlatColor.orangeDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.orange
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func mimosaDark(){
        no = "16"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.yellowDark
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.black
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.redDark
        tabBarTintColor = FlatColor.orange
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.4, green:0.45, blue:0.45, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.yellowDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }

    static func pinkLadyLight(){
        no = "17"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.pink
        basicBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        tableViewHeaderBackgroundColor = FlatColor.white
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        filterContainerBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.pinkDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.97, green:0.8, blue:0.93, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.pink
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func pinkLadyDark(){
        no = "18"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.pinkDark
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.pinkDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.3, green:0.3, blue:0.3, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.pinkDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }
    
    static func blackRussianDark(){
        no = "19"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.coffee
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.sandDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = FlatColor.coffeeDark
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.coffeeDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }
    
    static func shoyoJulingLight(){
        no = "20"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.greenDark
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        deleteColor = FlatColor.watermelon
        tabBarTintColor = FlatColor.greenDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.9, blue:0.85, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.greenDark
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }
    
    static func shoyoJulingDark(){
        no = "21"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.greenDark
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.black
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.greenDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.3, green:0.45, blue:0.33, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.greenDark
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }
    
    static func unionJackLight(){
        no = "22"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .default
        primaryColor = FlatColor.white
        secondaryColor = FlatColor.purple
        basicBackgroundColor = FlatColor.white
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.purple
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        tableViewCellSelectedBackgroundColor = UIColor(red:0.87, green:0.81, blue:0.96, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.purple
        badgeDisableBackgroundColor = FlatColor.whiteDark
        memoBorderColor = FlatColor.whiteDark
        setGlobalTheme()
    }

    static func unionJackDark(){
        no = "23"
        isDark = true
        isBackgroundDark = true
        statusBarStyle = .lightContent
        primaryColor = UIColor.black
        secondaryColor = FlatColor.magenta
        basicBackgroundColor = FlatColor.black
        tableViewHeaderBackgroundColor = FlatColor.grayDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        deleteColor = FlatColor.redDark
        tabBarTintColor = FlatColor.magenta
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.gray
        tableViewCellSelectedBackgroundColor = UIColor(red:0.35, green:0.25, blue:0.40, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewCellReminderBackgroundColor = FlatColor.magenta
        badgeDisableBackgroundColor = FlatColor.grayDark
        memoBorderColor = FlatColor.grayDark
        setGlobalTheme()
    }

    static func blueMoonLight(){
        no = "24"
        isDark = false
        isBackgroundDark = false
        statusBarStyle = .default
        primaryColor = FlatColor.powderBlue
        secondaryColor = FlatColor.blue
        basicBackgroundColor = UIColor(red:0.88, green:0.92, blue:0.98, alpha:1.0)
        tableViewHeaderBackgroundColor = FlatColor.whiteDark
        tableViewHeaderTextColor = FlatColor.black
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.powderBlue
        deleteColor = FlatColor.red
        tabBarTintColor = FlatColor.blue
        tabBarBarTintColor = UIColor(red:0.88, green:0.92, blue:0.98, alpha:1.0)
        tabBarUnselectedItemTintColor = FlatColor.whiteDark
        tableViewCellSelectedBackgroundColor = UIColor(red:0.79, green:0.83, blue:0.92, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewCellReminderBackgroundColor = FlatColor.blue
        badgeDisableBackgroundColor = FlatColor.gray
        memoBorderColor = FlatColor.gray
        setGlobalTheme()
    }
    
    // MARK: - Manage Theme
    static func saveTheme(themeNo: String?){
        if let no = themeNo{
            let defaults = UserDefaults.standard
            defaults.set(no, forKey: "Theme")
        }
    }
    
    static func loadTheme(){
        let defaults = UserDefaults.standard
        if let themeNo = defaults.string(forKey: "Theme"){
            setTheme(themeNo: themeNo)
        }else{
            defaults.set("0", forKey: "Theme")
            tequilaSunriseLight()
        }
    }
    
    static func setTheme(themeNo: String?){
        if let no = themeNo {
            switch no{
            case "0": tequilaSunriseLight()
            case "1": tequilaSunriseDark()
            case "2": seaBreezeLight()
            case "3": seaBreezeDark()
            case "4": chinaBlueLight()
            case "5": chinaBlueDark()
            case "6": grasshopperLight()
            case "7": irishCoffeeDark()
            case "8": mojitoLight()
            case "9": redEyeLight()
            case "10": cubaLibreDark()
            case "11": silverWingLight()
            case "12": americanLemonadeDark()
            case "13": blueLagoonLight()
            case "14": blueLagoonDark()
            case "15": mimosaLight()
            case "16": mimosaDark()
            case "17": pinkLadyLight()
            case "18": pinkLadyDark()
            case "19": blackRussianDark()
            case "20": shoyoJulingLight()
            case "21": shoyoJulingDark()
            case "22": unionJackLight()
            case "23": unionJackDark()
            case "24": blueMoonLight()
            default: break
            }
        }
    }
    
    // MARK: - Set Global Theme
    static private func setGlobalTheme(){
        // 注意：UILabel, TableViewは外部のUIコンポーネントに影響するので、色の設定を共通化してはいけない
        customizeBarButtonItem()
        customizeButton()
        customizeNavigationBar()
        customizeSearchBar()
        customizeSegmentedControl()
        customizeCircularCheckbox()
        customizeTextField()
        customizeTextView()
        customizeTabBar()
        customizeSlider()
        customizeActivityIndicatorView()
        customizeLabel()
        if isDark{
            ProgressHUD.set(defaultStyle: .light)
        }else{
            ProgressHUD.set(defaultStyle: .dark)
        }
    }
    
    static private func customizeBarButtonItem(){
        let contentColor = FlatColor.contrastColorOf(primaryColor, isFlat: false)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [CustomSearchBar.self]).tintColor = contentColor
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [CustomNavigationBar.self]).tintColor = contentColor
    }
    
    static private func customizeButton(){
        let contentColor = FlatColor.contrastColorOf(primaryColor, isFlat: false)
        
        // テーマカラー変更のチェックマークの色ために必要
        UIButton.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).tintColor = Style.secondaryColor

        UIButton.appearance(whenContainedInInstancesOf: [CustomSearchBar.self]).tintColor = contentColor
        UIButton.appearance(whenContainedInInstancesOf: [CustomSearchBar.self]).backgroundColor = UIColor.clear
        UIButton.appearance(whenContainedInInstancesOf: [CustomNavigationBar.self]).tintColor = contentColor
        UIButton.appearance(whenContainedInInstancesOf: [CustomNavigationBar.self]).backgroundColor = UIColor.clear
    }
    
    static private func customizeNavigationBar(){
        let contentColor = FlatColor.contrastColorOf(primaryColor, isFlat: false)
        CustomNavigationBar.appearance().barTintColor = primaryColor
        CustomNavigationBar.appearance().tintColor = contentColor
        CustomNavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: contentColor]
        CustomNavigationBar.appearance().shadowImage = UIImage()
    }
    
    static private func customizeSearchBar(){
        CustomSearchBar.appearance().backgroundColor = filterContainerBackgroundColor
        CustomSearchBar.appearance().tintColor = labelTextColor
        CustomSearchBar.appearance().barTintColor = filterContainerBackgroundColor        
    }
    
    static private func customizeSegmentedControl(){
        CustomSegmentedControl.appearance().backgroundColor = basicBackgroundColor
        if #available(iOS 13.0, *) {
            CustomSegmentedControl.appearance().selectedSegmentTintColor = secondaryColor
            CustomSegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: labelTextColorOnBadge], for: .selected)
            CustomSegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: labelTextColor], for: .normal)
        }else{
            CustomSegmentedControl.appearance().tintColor = secondaryColor
        }
    }
    
    static private func customizeCircularCheckbox(){
        CircularCheckbox.appearance().backgroundColor = UIColor.clear
        CircularCheckbox.appearance().tintColor = secondaryColor
    }
    
    static private func customizeTextField(){
        CustomTextField.appearance().backgroundColor = basicBackgroundColor
        CustomTextField.appearance().tintColor = labelTextColor
        CustomTextField.appearance().textColor = labelTextColor
        UITextField.appearance(whenContainedInInstancesOf: [CustomSearchBar.self]).backgroundColor = basicBackgroundColor
        UITextField.appearance(whenContainedInInstancesOf: [CustomSearchBar.self]).tintColor = labelTextColor
        UITextField.appearance(whenContainedInInstancesOf: [CustomSearchBar.self]).textColor = labelTextColor
        if isDark{
            CustomTextField.appearance().keyboardAppearance = .dark
            UITextField.appearance(whenContainedInInstancesOf: [CustomSearchBar.self]).keyboardAppearance = .dark
        }else{
            CustomTextField.appearance().keyboardAppearance = .light
            UITextField.appearance(whenContainedInInstancesOf: [CustomSearchBar.self]).keyboardAppearance = .light
        }
    }
    
    static private func customizeTextView(){
        CustomTextView.appearance().backgroundColor = basicBackgroundColor
        CustomTextView.appearance().textColor = labelTextColor
        CustomTextView.appearance().tintColor = labelTextColor
    }
    
    static private func customizeTabBar(){
        CustomTabBar.appearance().tintColor = tabBarTintColor
        CustomTabBar.appearance().barTintColor = tabBarBarTintColor
        CustomTabBar.appearance().unselectedItemTintColor = tabBarUnselectedItemTintColor
    }
        
    static private func customizeSlider(){
        CustomSlider.appearance().minimumTrackTintColor = secondaryColor
        CustomSlider.appearance().maximumTrackTintColor = labelTextColorLight
    }
    
    static private func customizeLabel(){
        CustomLabel.appearance().textColor = labelTextColor
    }
    
    static private func customizeActivityIndicatorView(){
        PullToRefreshActivityIndicatorView.appearance().color = labelTextColor
    }

}
