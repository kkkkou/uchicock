//
//  TodayViewController.swift
//  uchicock Widget
//
//  Created by Kou Kinyo on 2020-03-22.
//  Copyright © 2020 Kou. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var bookmarkLabel: UILabel!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var reminderLabel: UILabel!
    @IBOutlet weak var albumButton: UIButton!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var calcLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookmarkButton.layer.cornerRadius = bookmarkButton.frame.size.width / 2
        bookmarkButton.layer.borderWidth = 2.0
        bookmarkButton.clipsToBounds = true
        bookmarkButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        if #available(iOSApplicationExtension 13.0, *) {
            bookmarkButton.tintColor = UIColor.label
        } else {
            bookmarkButton.tintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        }
        
        reminderButton.layer.cornerRadius = reminderButton.frame.size.width / 2
        reminderButton.layer.borderWidth = 2.0
        reminderButton.clipsToBounds = true
        reminderButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        if #available(iOSApplicationExtension 13.0, *) {
            reminderButton.tintColor = UIColor.label
        } else {
            reminderButton.tintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        }

        albumButton.layer.cornerRadius = albumButton.frame.size.width / 2
        albumButton.layer.borderWidth = 2.0
        albumButton.clipsToBounds = true
        albumButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        if #available(iOSApplicationExtension 13.0, *) {
            albumButton.tintColor = UIColor.label
        } else {
            albumButton.tintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        }

        calcButton.layer.cornerRadius = calcButton.frame.size.width / 2
        calcButton.layer.borderWidth = 2.0
        calcButton.clipsToBounds = true
        calcButton.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        if #available(iOSApplicationExtension 13.0, *) {
            calcButton.tintColor = UIColor.label
        } else {
            calcButton.tintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.8)
        }
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func reminderButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func albumButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
    }
    
}