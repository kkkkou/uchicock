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
    static var theme = ThemeColorType.tequilaSunriseLight
    static var keyboardAppearance = UIKeyboardAppearance.dark
    static var isBackgroundDark = false
    static var messageHudStyle: MessageHUDStyle = .dark
    static var statusBarStyle: UIStatusBarStyle = .default
    static var navigationBarColor = FlatColor.yellow
    static var primaryColor = FlatColor.skyBlueDark
    static var basicBackgroundColor = FlatColor.white
    static var basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
    static var searchTextViewBackgroundColor = UIColor(red:0.94, green:0.93, blue:0.92, alpha:1.0)
    static var tableViewCellSelectedBackgroundColor = UIColor(red:0.83, green:0.85, blue:0.85, alpha:1.0)
    static var tableViewCellEditBackgroundColor = FlatColor.gray
    static var tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
    static var labelTextColor = FlatColor.black
    static var labelTextColorLight = FlatColor.grayDark
    static var labelTextColorOnBadge = FlatColor.white
    static var filterContainerBackgroundColor = FlatColor.sand
    static var alertColor = FlatColor.red
    static var tabBarTintColor = FlatColor.orange
    static var tabBarBarTintColor = FlatColor.white
    static var tabBarUnselectedItemTintColor = FlatColor.gray
    static var badgeBackgroundColor = FlatColor.red
    static var noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)

    // MARK: - Define Theme
    private static func tequilaSunriseLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .dark
        if #available(iOS 13.0, *) {
            statusBarStyle = .darkContent
        }else{
            statusBarStyle = .default
        }
        navigationBarColor = FlatColor.yellow
        primaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.94, green:0.93, blue:0.92, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.83, green:0.85, blue:0.85, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.sand
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.orange
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }
    
    private static func tequilaSunriseDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .dark
        if #available(iOS 13.0, *) {
            statusBarStyle = .darkContent
        }else{
            statusBarStyle = .default
        }
        navigationBarColor = FlatColor.yellow
        primaryColor = FlatColor.yellowDark
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.32, green:0.27, blue:0.16, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.39, green:0.39, blue:0.40, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.black
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.yellowDark
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.watermelonDark
        noPhotoColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    }
    
    private static func seaBreezeLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .dark
        if #available(iOS 13.0, *) {
            statusBarStyle = .darkContent
        }else{
            statusBarStyle = .default
        }
        navigationBarColor = FlatColor.pink
        primaryColor = FlatColor.pink
        basicBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        basicBackgroundColorLight = UIColor(red:0.94, green:0.89, blue:0.94, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.94, green:0.89, blue:0.94, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:1.0, green:0.85, blue:0.94, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.75, green:0.73, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        filterContainerBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        alertColor = FlatColor.red
        tabBarTintColor = UIColor(red:0.35, green:0.2, blue:0.3, alpha:1.0)
        tabBarBarTintColor = FlatColor.pink
        tabBarUnselectedItemTintColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.84, green:0.80, blue:0.82, alpha:1.0)
    }
    
    private static func seaBreezeDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.pinkDark
        primaryColor = FlatColor.pinkDark
        basicBackgroundColor = FlatColor.blackDark
        basicBackgroundColorLight = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.26, green:0.26, blue:0.26, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.39, green:0.39, blue:0.40, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.blackDark
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.pinkDark
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    }

    private static func chinaBlueLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.skyBlue
        primaryColor = FlatColor.skyBlue
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.83, green:0.85, blue:0.85, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.red
        tabBarTintColor = UIColor(red:0.2, green:0.2, blue:0.3, alpha:1.0)
        tabBarBarTintColor = FlatColor.skyBlue
        tabBarUnselectedItemTintColor = FlatColor.white
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }

    private static func chinaBlueDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.skyBlueDark
        primaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.26, green:0.26, blue:0.26, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.39, green:0.39, blue:0.40, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.skyBlueDark
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    }

    private static func grasshopperLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .dark
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.mint
        primaryColor = FlatColor.mintDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.83, green:0.85, blue:0.85, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.mint
        alertColor = FlatColor.watermelon
        tabBarTintColor = FlatColor.black
        tabBarBarTintColor = FlatColor.mint
        tabBarUnselectedItemTintColor = FlatColor.white
        badgeBackgroundColor = FlatColor.watermelon
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }

    private static func irishCoffeeDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.coffeeDark
        primaryColor = FlatColor.coffee
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.33, green:0.29, blue:0.27, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.39, green:0.39, blue:0.40, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.coffeeDark
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.watermelonDark
        noPhotoColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    }
    
    private static func mojitoLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .dark
        if #available(iOS 13.0, *) {
            statusBarStyle = .darkContent
        }else{
            statusBarStyle = .default
        }
        navigationBarColor = FlatColor.white
        primaryColor = FlatColor.mint
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.75, green:0.91, blue:0.88, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.mint
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        badgeBackgroundColor = FlatColor.watermelonDark
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }
    
    private static func redEyeLight(){
        keyboardAppearance = .light
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
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.black
        tabBarBarTintColor = FlatColor.watermelonDark
        tabBarUnselectedItemTintColor = FlatColor.white
        badgeBackgroundColor = FlatColor.black
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }
    
    private static func cubaLibreDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        if #available(iOS 13.0, *) {
            statusBarStyle = .darkContent
        }else{
            statusBarStyle = .default
        }
        navigationBarColor = FlatColor.limeDark
        primaryColor = FlatColor.limeDark
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.28, green:0.32, blue:0.15, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.39, green:0.39, blue:0.40, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.black
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.limeDark
        tabBarUnselectedItemTintColor = FlatColor.blackDark
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    }
    
    private static func silverWingLight(){
        keyboardAppearance = .light
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
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.whiteDark
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.black
        tabBarBarTintColor = FlatColor.grayDark
        tabBarUnselectedItemTintColor = FlatColor.white
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.70, green:0.72, blue:0.72, alpha:1.0)
    }
    
    private static func americanLemonadeDark(){
        keyboardAppearance = .light
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.watermelonDark
        primaryColor = FlatColor.watermelonDark
        basicBackgroundColor = FlatColor.black
        basicBackgroundColorLight = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.26, green:0.26, blue:0.26, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.39, green:0.39, blue:0.40, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.black
        alertColor = FlatColor.watermelonDark
        tabBarTintColor = FlatColor.watermelonDark
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.black
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    }
    
    private static func blueLagoonLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = UIColor.black
        primaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.83, green:0.85, blue:0.85, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.skyBlueDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }
    
    private static func blueLagoonDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.skyBlueDark
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.29, green:0.29, blue:0.30, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.skyBlueDark
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    }
    
    private static func mimosaLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = UIColor.black
        primaryColor = FlatColor.orange
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.83, green:0.85, blue:0.85, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.orange
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }
    
    private static func mimosaDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.yellowDark
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.29, green:0.29, blue:0.30, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.yellowDark
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    }

    private static func pinkLadyLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = UIColor.black
        primaryColor = FlatColor.pink
        basicBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        basicBackgroundColorLight = UIColor(red:0.93, green:0.90, blue:0.93, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.93, green:0.90, blue:0.93, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:1.0, green:0.85, blue:0.94, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.75, green:0.73, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        filterContainerBackgroundColor = UIColor(red:1.0, green:0.95, blue:1.0, alpha:1.0)
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.pinkDark
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.84, green:0.80, blue:0.82, alpha:1.0)
    }
    
    private static func pinkLadyDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.pinkDark
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.29, green:0.29, blue:0.30, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.pinkDark
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    }
    
    private static func blackRussianDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.coffee
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.30, green:0.24, blue:0.20, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.29, green:0.29, blue:0.30, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.white
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.coffee
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    }
    
    private static func shoyoJulingLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = UIColor.black
        primaryColor = FlatColor.greenDark
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.73, green:0.90, blue:0.80, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.watermelon
        tabBarTintColor = FlatColor.green
        tabBarBarTintColor = UIColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.watermelon
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }
    
    private static func shoyoJulingDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.greenDark
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.29, green:0.29, blue:0.30, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.green
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    }
    
    private static func unionJackLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .dark
        if #available(iOS 13.0, *) {
            statusBarStyle = .darkContent
        }else{
            statusBarStyle = .default
        }
        navigationBarColor = FlatColor.white
        primaryColor = FlatColor.purple
        basicBackgroundColor = FlatColor.white
        basicBackgroundColorLight = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.87, green:0.89, blue:0.89, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.87, green:0.81, blue:0.96, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.white
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.purpleDark
        tabBarBarTintColor = FlatColor.white
        tabBarUnselectedItemTintColor = FlatColor.gray
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.77, green:0.79, blue:0.79, alpha:1.0)
    }

    private static func unionJackDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.magenta
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        tableViewCellSelectedBackgroundColor = FlatColor.black
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.29, green:0.29, blue:0.30, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.redDark
        tabBarTintColor = FlatColor.magenta
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.redDark
        noPhotoColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    }

    private static func blueMoonLight(){
        keyboardAppearance = .light
        isBackgroundDark = false
        messageHudStyle = .dark
        if #available(iOS 13.0, *) {
            statusBarStyle = .darkContent
        }else{
            statusBarStyle = .default
        }
        navigationBarColor = FlatColor.powderBlue
        primaryColor = FlatColor.blue
        basicBackgroundColor = UIColor(red:0.88, green:0.92, blue:0.98, alpha:1.0)
        basicBackgroundColorLight = UIColor(red:0.83, green:0.87, blue:0.92, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.83, green:0.87, blue:0.92, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.79, green:0.83, blue:0.92, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.gray
        tableViewSeparatorColor = UIColor(red:0.73, green:0.74, blue:0.75, alpha:1.0)
        labelTextColor = FlatColor.black
        labelTextColorLight = FlatColor.grayDark
        labelTextColorOnBadge = FlatColor.white
        filterContainerBackgroundColor = FlatColor.powderBlue
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.blueDark
        tabBarBarTintColor = UIColor(red:0.88, green:0.92, blue:0.98, alpha:1.0)
        tabBarUnselectedItemTintColor = FlatColor.gray
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.76, green:0.80, blue:0.85, alpha:1.0)
    }
    
    private static func bloodyMaryDark(){
        keyboardAppearance = .dark
        isBackgroundDark = true
        messageHudStyle = .light
        statusBarStyle = .lightContent
        navigationBarColor = FlatColor.black
        primaryColor = FlatColor.red
        basicBackgroundColor = UIColor.black
        basicBackgroundColorLight = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        searchTextViewBackgroundColor = UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        tableViewCellSelectedBackgroundColor = UIColor(red:0.30, green:0.16, blue:0.14, alpha:1.0)
        tableViewCellEditBackgroundColor = FlatColor.grayDark
        tableViewSeparatorColor = UIColor(red:0.29, green:0.29, blue:0.30, alpha:1.0)
        labelTextColor = FlatColor.white
        labelTextColorLight = FlatColor.gray
        labelTextColorOnBadge = UIColor.black
        filterContainerBackgroundColor = UIColor.black
        alertColor = FlatColor.red
        tabBarTintColor = FlatColor.red
        tabBarBarTintColor = FlatColor.black
        tabBarUnselectedItemTintColor = FlatColor.grayDark
        badgeBackgroundColor = FlatColor.red
        noPhotoColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    }

    // MARK: - Manage Theme
    static func saveTheme(themeNo: Int){
        let defaults = UserDefaults.standard
        defaults.set(String(themeNo), forKey: GlobalConstants.ColorThemeKey)
    }
    
    static func loadTheme(){
        let defaults = UserDefaults.standard
        if let themeNo = defaults.string(forKey: GlobalConstants.ColorThemeKey){
            setTheme(themeNo: themeNo)
        }else{
            defaults.set("0", forKey: GlobalConstants.ColorThemeKey)
            setTheme(themeNo: "0")
        }
    }
    
    static func setTheme(themeNo: String){
        theme = ThemeColorType.fromString(themeNo)
        switch theme{
        case .tequilaSunriseLight: tequilaSunriseLight()
        case .tequilaSunriseDark: tequilaSunriseDark()
        case .seaBreezeLight: seaBreezeLight()
        case .seaBreezeDark: seaBreezeDark()
        case .chinaBlueLight: chinaBlueLight()
        case .chinaBlueDark: chinaBlueDark()
        case .grasshopperLight: grasshopperLight()
        case .irishCoffeeDark: irishCoffeeDark()
        case .mojitoLight: mojitoLight()
        case .redEyeLight: redEyeLight()
        case .cubaLibreDark: cubaLibreDark()
        case .silverWingLight: silverWingLight()
        case .americanLemonadeDark: americanLemonadeDark()
        case .blueLagoonLight: blueLagoonLight()
        case .blueLagoonDark: blueLagoonDark()
        case .mimosaLight: mimosaLight()
        case .mimosaDark: mimosaDark()
        case .pinkLadyLight: pinkLadyLight()
        case .pinkLadyDark: pinkLadyDark()
        case .blackRussianDark: blackRussianDark()
        case .shoyoJulingLight: shoyoJulingLight()
        case .shoyoJulingDark: shoyoJulingDark()
        case .unionJackLight: unionJackLight()
        case .unionJackDark: unionJackDark()
        case .blueMoonLight: blueMoonLight()
        case .bloodyMaryDark: bloodyMaryDark()
        }
        setGlobalTheme()
    }
    
    // MARK: - Set Global Theme
    static private func setGlobalTheme(){
        // 注意：TableViewは外部のUIコンポーネントに影響するので、色の設定を共通化してはいけない
        if #available(iOS 13.0, *){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.overrideUserInterfaceStyle = UchicockStyle.isBackgroundDark ? .dark : .light
        }
        customizeNavigationBar()
        customizeSegmentedControl()
        customizeCircularCheckbox()
        customizeTextField()
        customizeTextView()
        customizeTabBar()
        customizeSlider()
        customizeLabel()
        MessageHUD.set(defaultStyle: messageHudStyle)
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
            CustomSegmentedControl.appearance().selectedSegmentTintColor = .clear
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
        CustomTextField.appearance().textColor = labelTextColor
        CustomTextField.appearance().tintColor = primaryColor
        CustomTextField.appearance().clipsToBounds = true
        CustomTextField.appearance().keyboardAppearance = keyboardAppearance
    }
    
    static private func customizeTextView(){
        CustomTextView.appearance().backgroundColor = UIColor.clear
        CustomTextView.appearance().textColor = labelTextColor
        CustomTextView.appearance().tintColor = primaryColor
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
    
}
