//
//  Style.swift
//  uchicock
//
//  Created by Kou Kinyo on 2017/02/27.
//  Copyright © 2017年 Kou. All rights reserved.
//

import Foundation
import UIKit

struct UchicockStyle{
    static var no = "0"
    static var isDark = false
    static var isBackgroundDark = false
    static var messageHudStyle: MessageHUDStyle = .dark
    static var statusBarStyle: UIStatusBarStyle = .default
    static var navigationBarColor = FlatColor.yellow
    static var primaryColor = FlatColor.skyBlueDark
    static var basicBackgroundColor = FlatColor.white
    static var basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
    static var searchTextViewBackgroundColor = UIColor(red:0.90, green:0.90, blue:0.87, alpha:1.0)
    static var tableViewCellSelectedBackgroundColor = FlatColor.whiteDark
    static var tableViewCellEditBackgroundColor = FlatColor.gray
    static var tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
    static var labelTextColor = FlatColor.black
    static var labelTextColorLight = FlatColor.grayDark
    static var labelTextColorOnBadge = FlatColor.white
    static var filterContainerBackgroundColor = FlatColor.sand
    static var alertColor = FlatColor.red
    static var tabBarTintColor = FlatColor.orange
    static var tabBarBarTintColor = FlatColor.white
    static var tabBarUnselectedItemTintColor = FlatColor.gray
    static var badgeBackgroundColor = FlatColor.red

    // MARK: - Define Theme
    static func tequilaSunriseLight(){
        no = "0"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .default
        navigationBarColor = FlatColor.yellow
        primaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.90, green:0.90, blue:0.87, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.sand
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.orange
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        badgeBackgroundColor = FlatColor.red
    }
    
    static func tequilaSunriseDark(){
        no = "1"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .dark
        statusBarStyle = .default
        navigationBarColor = FlatColor.yellow
        primaryColor = FlatColor.yellowDark
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.37, green:0.28, blue:0.13, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.black
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.yellowDark
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.watermelonDark
    }
    
    static func seaBreezeLight(){
        no = "2"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .default
        navigationBarColor = FlatColor.pink
        primaryColor = FlatColor.pink
        basicBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        basicBackgroundColorLight = UIColor(red:0.93, green:0.90, blue:0.93, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.93, green:0.90, blue:0.93, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.97, green:0.8, blue:0.93, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.70, green:0.68, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        filterContainerBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        alertColor = FlatColor.red
        tabBarTintColor = UIColor(red:0.35, green:0.2, blue:0.3, alpha:1.0)
        tabBarBarTintColor = FlatColor.pink
        tabBarUnselectedItemTintColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        badgeBackgroundColor = FlatColor.red
    }
    
    static func seaBreezeDark(){
        no = "3"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.pinkDark
        primaryColor = FlatColor.pinkDark
        basicBackgroundColor = FlatColor.blackDark
        basicBackgroundColorLight = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.3, green:0.3, blue:0.3, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.blackDark
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.pinkDark
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.redDark
    }

    static func chinaBlueLight(){
        no = "4"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.skyBlue
        primaryColor = FlatColor.skyBlue
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.red
        tabBarTintColor = UIColor(red:0.2, green:0.2, blue:0.3, alpha:1.0)
        tabBarBarTintColor = FlatColor.skyBlue
        tabBarUnselectedItemTintColor = FlatColor.white
        badgeBackgroundColor = FlatColor.red
    }

    static func chinaBlueDark(){
        no = "5"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.skyBlueDark
        primaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.3, green:0.3, blue:0.3, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.skyBlueDark
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.red
    }

    static func grasshopperLight(){
        no = "6"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.mint
        primaryColor = FlatColor.mintDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.mint
        alertColor = FlatColor.watermelon
        tabBarTintColor = FlatColor.black
        tabBarBarTintColor = FlatColor.mint
        tabBarUnselectedItemTintColor = FlatColor.white
        badgeBackgroundColor = FlatColor.watermelon
    }

    static func irishCoffeeDark(){
        no = "7"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.coffeeDark
        primaryColor = FlatColor.coffee
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.34, green:0.27, blue:0.22, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.coffeeDark
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.watermelonDark
    }
    
    static func mojitoLight(){
        no = "8"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .default
        navigationBarColor = FlatColor.white
        primaryColor = FlatColor.mint
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.75, green:0.92, blue:0.89, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.mint
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        badgeBackgroundColor = FlatColor.watermelonDark
    }
    
    static func redEyeLight(){
        no = "9"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.watermelonDark
        primaryColor = FlatColor.watermelon
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:1.0, green:0.7, blue:0.75, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.black
        tabBarBarTintColor = FlatColor.watermelonDark
        tabBarUnselectedItemTintColor = FlatColor.white
        badgeBackgroundColor = FlatColor.black
    }
    
    static func cubaLibreDark(){
        no = "10"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .default
        navigationBarColor = FlatColor.limeDark
        primaryColor = FlatColor.limeDark
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.3, green:0.35, blue:0.1, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.black
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.limeDark
        tabBarUnselectedItemTintColor = FlatColor.blackDark
        badgeBackgroundColor = FlatColor.red
    }
    
    static func silverWingLight(){
        no = "11"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.grayDark
        primaryColor = FlatColor.grayDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.whiteDark
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.black
        tabBarBarTintColor = FlatColor.grayDark
        tabBarUnselectedItemTintColor = FlatColor.white
        badgeBackgroundColor = FlatColor.red
    }
    
    static func americanLemonadeDark(){
        no = "12"
        isDark = false
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.watermelonDark
        primaryColor = FlatColor.watermelonDark
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.32, green:0.3, blue:0.3, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.watermelonDark
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.redDark
    }
    
    static func blueLagoonLight(){
        no = "13"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = UIColor.black
        primaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.skyBlueDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.red
    }
    
    static func blueLagoonDark(){
        no = "14"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.skyBlueDark
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
    }
    
    static func mimosaLight(){
        no = "15"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = UIColor.black
        primaryColor = FlatColor.orange
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.82, blue:0.82, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.orange
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
    }
    
    static func mimosaDark(){
        no = "16"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.yellowDark
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.yellowDark
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
    }

    static func pinkLadyLight(){
        no = "17"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = UIColor.black
        primaryColor = FlatColor.pink
        basicBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        basicBackgroundColorLight = UIColor(red:0.93, green:0.90, blue:0.93, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.93, green:0.90, blue:0.93, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.97, green:0.8, blue:0.93, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.70, green:0.68, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        filterContainerBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.pinkDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.red
    }
    
    static func pinkLadyDark(){
        no = "18"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.pinkDark
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.pinkDark
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
    }
    
    static func blackRussianDark(){
        no = "19"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.coffee
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.33, green:0.27, blue:0.23, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.coffee
        badgeBackgroundColor = FlatColor.redDark
    }
    
    static func shoyoJulingLight(){
        no = "20"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = UIColor.black
        primaryColor = FlatColor.greenDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.8, green:0.9, blue:0.85, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.watermelon
        tabBarTintColor = FlatColor.green
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.watermelon
    }
    
    static func shoyoJulingDark(){
        no = "21"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.greenDark
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.green
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
    }
    
    static func unionJackLight(){
        no = "22"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .default
        navigationBarColor = FlatColor.white
        primaryColor = FlatColor.purple
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.87, green:0.81, blue:0.96, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.purpleDark
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        badgeBackgroundColor = FlatColor.red
    }

    static func unionJackDark(){
        no = "23"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.magenta
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.magenta
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
    }

    static func blueMoonLight(){
        no = "24"
        isDark = false
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .default
        navigationBarColor = FlatColor.powderBlue
        primaryColor = FlatColor.blue
        basicBackgroundColor = UIColor(red:0.88, green:0.92, blue:0.98, alpha:1.0)
        basicBackgroundColorLight = UIColor(red:0.83, green:0.87, blue:0.92, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.83, green:0.87, blue:0.92, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.79, green:0.83, blue:0.92, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.68, green:0.69, blue:0.70, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.powderBlue
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.blueDark
        tabBarBarTintColor = UIColor(red:0.88, green:0.92, blue:0.98, alpha:1.0)
        tabBarUnselectedItemTintColor = FlatColor.gray
        badgeBackgroundColor = FlatColor.red
    }
    
    static func bloodyMaryDark(){
        no = "25"
        isDark = true
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.red
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.23, green:0.23, blue:0.23, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.30, green:0.16, blue:0.14, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.49, green:0.49, blue:0.50, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.red
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.red
    }

    // MARK: - Manage Theme
    static func saveTheme(themeNo: String?){
        if let no = themeNo{
            let defaults = UserDefaults.standard
            defaults.set(no, forKey: GlobalConstants.ColorThemeKey)
        }
    }
    
    static func loadTheme(){
        let defaults = UserDefaults.standard
        if let themeNo = defaults.string(forKey: GlobalConstants.ColorThemeKey){
            setTheme(themeNo: themeNo)
        }else{
            defaults.set("0", forKey: GlobalConstants.ColorThemeKey)
            tequilaSunriseLight()
            setGlobalTheme()
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
            case "25": bloodyMaryDark()
            default: break
            }
            setGlobalTheme()
        }
    }
    
    // MARK: - Set Global Theme
    static private func setGlobalTheme(){
        // 注意：UILabel, TableViewは外部のUIコンポーネントに影響するので、色の設定を共通化してはいけない
        customizeButton()
        customizeNavigationBar()
        customizeSegmentedControl()
        customizeCircularCheckbox()
        customizeTextField()
        customizeTextView()
        customizeTabBar()
        customizeSlider()
        customizeActivityIndicatorView()
        customizeLabel()
        MessageHUD.set(defaultStyle: messageHudStyle)
    }
    
    static private func customizeButton(){
        // テーマカラー変更のチェックマークの色ために必要
        UIButton.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).tintColor = UchicockStyle.primaryColor

        UIButton.appearance(whenContainedInInstancesOf: [CustomNavigationBar.self]).backgroundColor = UIColor.clear
    }
    
    static private func customizeNavigationBar(){
        let contentColor = FlatColor.contrastColorOf(navigationBarColor, isFlat: false)
        CustomNavigationBar.appearance().barTintColor = navigationBarColor
        CustomNavigationBar.appearance().tintColor = contentColor
        CustomNavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: contentColor]
        CustomNavigationBar.appearance().shadowImage = UIImage()
    }
    
    static private func customizeSegmentedControl(){
        CustomSegmentedControl.appearance().backgroundColor = basicBackgroundColor
        if #available(iOS 13.0, *) {
            CustomSegmentedControl.appearance().selectedSegmentTintColor = primaryColor
            CustomSegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: labelTextColorOnBadge], for: .selected)
            CustomSegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: labelTextColor], for: .normal)
        }else{
            CustomSegmentedControl.appearance().tintColor = primaryColor
        }
    }
    
    static private func customizeCircularCheckbox(){
        CircularCheckbox.appearance().backgroundColor = UIColor.clear
        CircularCheckbox.appearance().tintColor = primaryColor
    }
    
    static private func customizeTextField(){
        CustomTextField.appearance().layer.borderWidth = 0
        CustomTextField.appearance().layer.borderColor = UIColor.clear.cgColor
        CustomTextField.appearance().backgroundColor = basicBackgroundColorLight
        CustomTextField.appearance().tintColor = labelTextColor
        CustomTextField.appearance().textColor = labelTextColor
        if isDark{
            CustomTextField.appearance().keyboardAppearance = .dark
        }else{
            CustomTextField.appearance().keyboardAppearance = .light
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
        CustomSlider.appearance().minimumTrackTintColor = primaryColor
        CustomSlider.appearance().maximumTrackTintColor = labelTextColorLight
    }
    
    static private func customizeLabel(){
        CustomLabel.appearance().textColor = labelTextColor
    }
    
    static private func customizeActivityIndicatorView(){
        PullToRefreshActivityIndicatorView.appearance().color = labelTextColor
    }

}
