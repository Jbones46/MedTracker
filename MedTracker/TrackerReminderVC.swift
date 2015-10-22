//
//  TrackerReminderVC.swift
//  MedTracker
//
//  Created by Justin Ferre on 10/21/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//

import UIKit

class TrackerReminderVC: UIViewController {
    // ✗  ✔︎
    
    @IBOutlet weak var switchMorning: UISwitch!
    @IBOutlet weak var switchAfternoon: UISwitch!
    @IBOutlet weak var switchEvening: UISwitch!
    @IBOutlet weak var switchBedtime: UISwitch!
    @IBOutlet weak var xMorning: UILabel!
    @IBOutlet weak var xAfternoon: UILabel!
    @IBOutlet weak var xEvening: UILabel!
    @IBOutlet weak var xBedtime: UILabel!
    
    @IBOutlet weak var switchReminderMorning: UISwitch!
    @IBOutlet weak var switchReminderAfternoon: UISwitch!
    @IBOutlet weak var switchReminderEvening: UISwitch!
    @IBOutlet weak var switchReminderBedtime: UISwitch!
    @IBOutlet weak var xReminderMorning: UILabel!
    @IBOutlet weak var xReminderAfternoon: UILabel!
    @IBOutlet weak var xReminderEvening: UILabel!
    @IBOutlet weak var xReminderBedtime: UILabel!
    
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var storedDate = ""
    var currentDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let dateRecorded = defaults.stringForKey("storedDate")
        {
            storedDate = dateRecorded
            
        }
        
        currentDate = getDate()
        
        if currentDate == storedDate{
            
            if let _ = defaults.stringForKey("takenMorning") {
                switchMorning.setOn(true, animated: true)
                xMorning.text = "✔︎"
                xMorning.textColor = UIColor.greenColor()
                
            }
            
        
        if let _ = defaults.stringForKey("takenAfternoon") {
            switchAfternoon.setOn(true, animated: true)
            xAfternoon.text = "✔︎"
            xAfternoon.textColor = UIColor.greenColor()
            
        }
        if let _ = defaults.stringForKey("takenEvening") {
            switchEvening.setOn(true, animated: true)
            xEvening.text = "✔︎"
            xEvening.textColor = UIColor.greenColor()
            
        }
        if let _ = defaults.stringForKey("takenBedtime") {
            switchBedtime.setOn(true, animated: true)
            xBedtime.text = "✔︎"
            xBedtime.textColor = UIColor.greenColor()
            
        }
        
        }else if currentDate != storedDate {
            
            defaults.removeObjectForKey("takenMorning")
            defaults.removeObjectForKey("takenAfternoon")
            defaults.removeObjectForKey("takenEvening")
            defaults.removeObjectForKey("takenBedtime")
            
            switchMorning.setOn(false, animated: true)
            switchAfternoon.setOn(false, animated: true)
            switchEvening.setOn(false, animated: true)
            switchBedtime.setOn(false, animated: true)
            
            xMorning.text = "✗"
            xMorning.textColor = UIColor.redColor()
            
            xAfternoon.text = "✗"
            xAfternoon.textColor = UIColor.redColor()

            xEvening.text = "✗"
            xEvening.textColor = UIColor.redColor()

            xBedtime.text = "✗"
            xBedtime.textColor = UIColor.redColor()

            
            

            
        }
        
        
        if let _ = defaults.stringForKey("reminderAfternoon") {
            switchReminderAfternoon.setOn(true, animated: true)
            xReminderAfternoon.text = "✔︎"
            xReminderAfternoon.textColor = UIColor.greenColor()
            
            
        }
        if let _ = defaults.stringForKey("reminderMorning") {
            switchReminderMorning.setOn(true, animated: true)
            xReminderMorning.text = "✔︎"
            xReminderMorning.textColor = UIColor.greenColor()
            
            
        }
        if let _ = defaults.stringForKey("reminderEvening") {
            switchReminderEvening.setOn(true, animated: true)
            xReminderEvening.text = "✔︎"
            xReminderEvening.textColor = UIColor.greenColor()
            
            
        }
        if let _ = defaults.stringForKey("reminderBedtime") {
            switchReminderBedtime.setOn(true, animated: true)
            xReminderBedtime.text = "✔︎"
            xReminderBedtime.textColor = UIColor.greenColor()
            
            
        }
        
    }

   
    func getDate() -> String {
        
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .NoStyle)
        
        print(date)
        return date
        
        
    }
    
    @IBAction func morningSwitchTapped(sender: UISwitch) {
        
        storedDate = getDate()
        
        if switchMorning.on {
            defaults.setObject(storedDate, forKey: "storedDate")
            defaults.setObject(switchMorning.on, forKey: "takenMorning")
            switchMorning.setOn(true, animated: true)
            xMorning.text = "✔︎"
            xMorning.textColor = UIColor.greenColor()
        }else {
            if let _ = defaults.stringForKey("takenMorning"){
                xMorning.text = "✗"
                xMorning.textColor = UIColor.redColor()
                switchMorning.setOn(false, animated: true)
                defaults.removeObjectForKey("takenMorning")
            }
            
        }
        
    }
    
    @IBAction func afternoonSwitchTapped(sender: UISwitch) {
        
        storedDate = getDate()
        
        if switchAfternoon.on {
            defaults.setObject(storedDate, forKey: "storedDate")
            defaults.setObject(switchAfternoon.on, forKey: "takenAfternoon")
            switchAfternoon.setOn(true, animated: true)
            xAfternoon.text = "✔︎"
            xAfternoon.textColor = UIColor.greenColor()
        }else {
            if let _ = defaults.stringForKey("takenAfternoon"){
                xAfternoon.text = "✗"
                xAfternoon.textColor = UIColor.redColor()
                switchAfternoon.setOn(false, animated: true)
                defaults.removeObjectForKey("takenAfternoon")
            }
            
        }

    }

    @IBAction func eveningSwitchTapped(sender: UISwitch) {
        storedDate = getDate()
        
        if switchEvening.on {
            defaults.setObject(storedDate, forKey: "storedDate")
            defaults.setObject(switchEvening.on, forKey: "takenEvening")
            switchEvening.setOn(true, animated: true)
            xEvening.text = "✔︎"
            xEvening.textColor = UIColor.greenColor()
        }else {
            if let _ = defaults.stringForKey("takenEvening"){
                xEvening.text = "✗"
                xEvening.textColor = UIColor.redColor()
                switchEvening.setOn(false, animated: true)
                defaults.removeObjectForKey("takenEvening")
            }
            
        }

        
    }
    
    
    @IBAction func bedtimeSwitchTapped(sender: UISwitch) {
        storedDate = getDate()
        
        if switchBedtime.on {
            defaults.setObject(storedDate, forKey: "storedDate")
            defaults.setObject(switchBedtime.on, forKey: "takenBedtime")
            switchBedtime.setOn(true, animated: true)
            xBedtime.text = "✔︎"
            xBedtime.textColor = UIColor.greenColor()
        }else {
            if let _ = defaults.stringForKey("takenBedtime"){
                xBedtime.text = "✗"
                xBedtime.textColor = UIColor.redColor()
                switchBedtime.setOn(false, animated: true)
                defaults.removeObjectForKey("takenBedtime")
            }
            
        }

        
    }
    
    
    var morningNotification = UILocalNotification()
    
    @IBAction func morningReminderSwitchTapped(sender: UISwitch) {
        
        if switchReminderMorning.on {
            defaults.setObject(switchReminderMorning.on, forKey: "reminderMorning")
            let theDate = NSDate()
            
            let calendar = NSCalendar.currentCalendar()
            calendar.timeZone = NSCalendar.currentCalendar().timeZone
            let fireDate = calendar.dateBySettingHour(9, minute: 0, second: 0, ofDate: theDate, options: NSCalendarOptions())
            
            morningNotification.alertBody = "Did you take your morning mediciation?"
            morningNotification.repeatInterval = NSCalendarUnit.Day
            morningNotification.fireDate = fireDate
            morningNotification.soundName = UILocalNotificationDefaultSoundName
            
            UIApplication.sharedApplication().scheduleLocalNotification(morningNotification)
            
            xReminderMorning.text = "✔︎"
            xReminderMorning.textColor = UIColor.greenColor()
        }else {
            
            defaults.removeObjectForKey("reminderMorning")
            UIApplication.sharedApplication().cancelLocalNotification(morningNotification)
            xReminderMorning.text = "✗"
            xReminderMorning.textColor = UIColor.redColor()
            
            
            
        }
    }
    
    var afternoonNotification = UILocalNotification()
    @IBAction func afternoonReminderSwitchTapped(sender: UISwitch) {
        if switchReminderAfternoon.on {
            defaults.setObject(switchReminderAfternoon.on, forKey: "reminderAfternoon")
            let theDate = NSDate()
            
            let calendar = NSCalendar.currentCalendar()
            calendar.timeZone = NSCalendar.currentCalendar().timeZone
            let fireDate = calendar.dateBySettingHour(14, minute: 0, second: 0, ofDate: theDate, options: NSCalendarOptions())
            
            afternoonNotification.alertBody = "Did you take your morning mediciation?"
            afternoonNotification.repeatInterval = NSCalendarUnit.Day
            afternoonNotification.fireDate = fireDate
            afternoonNotification.soundName = UILocalNotificationDefaultSoundName
            
            UIApplication.sharedApplication().scheduleLocalNotification(afternoonNotification)
            
            xReminderAfternoon.text = "✔︎"
            xReminderAfternoon.textColor = UIColor.greenColor()
        }else {
            
            defaults.removeObjectForKey("reminderAfternoon")
            UIApplication.sharedApplication().cancelLocalNotification(afternoonNotification)
            xReminderAfternoon.text = "✗"
            xReminderAfternoon.textColor = UIColor.redColor()
            
            
            
        }
    }
    
    var eveningNotification = UILocalNotification()
    @IBAction func eveningReminderSwitchTapped(sender: UISwitch) {
        if switchReminderEvening.on {
            defaults.setObject(switchReminderEvening.on, forKey: "reminderEvening")
            let theDate = NSDate()
            
            let calendar = NSCalendar.currentCalendar()
            calendar.timeZone = NSCalendar.currentCalendar().timeZone
            let fireDate = calendar.dateBySettingHour(14, minute: 51, second: 0, ofDate: theDate, options: NSCalendarOptions())
            
            eveningNotification.alertBody = "Did you take your evening mediciation?"
            eveningNotification.repeatInterval = NSCalendarUnit.Day
            eveningNotification.fireDate = fireDate
            eveningNotification.soundName = UILocalNotificationDefaultSoundName
            
            UIApplication.sharedApplication().scheduleLocalNotification(eveningNotification)
            
            xReminderEvening.text = "✔︎"
            xReminderEvening.textColor = UIColor.greenColor()
        }else {
            
            defaults.removeObjectForKey("reminderEvening")
            UIApplication.sharedApplication().cancelLocalNotification(eveningNotification)
            xReminderEvening.text = "✗"
            xReminderEvening.textColor = UIColor.redColor()
            
            
            
        }
    }
    
    var bedtimeNotification = UILocalNotification()
    @IBAction func bedtimeReminderSwitchTapped(sender: UISwitch) {
        if switchReminderBedtime.on {
            defaults.setObject(switchReminderBedtime.on, forKey: "reminderBedtime")
            let theDate = NSDate()
            
            let calendar = NSCalendar.currentCalendar()
            calendar.timeZone = NSCalendar.currentCalendar().timeZone
            let fireDate = calendar.dateBySettingHour(20, minute: 0, second: 0, ofDate: theDate, options: NSCalendarOptions())
            
            bedtimeNotification.alertBody = "Did you take your morning mediciation?"
            bedtimeNotification.repeatInterval = NSCalendarUnit.Day
            bedtimeNotification.fireDate = fireDate
            bedtimeNotification.soundName = UILocalNotificationDefaultSoundName
            
            UIApplication.sharedApplication().scheduleLocalNotification(bedtimeNotification)
            
            xReminderBedtime.text = "✔︎"
            xReminderBedtime.textColor = UIColor.greenColor()
        }else {
            
            defaults.removeObjectForKey("reminderBedtime")
            UIApplication.sharedApplication().cancelLocalNotification(bedtimeNotification)
            xReminderBedtime.text = "✗"
            xReminderBedtime.textColor = UIColor.redColor()
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    
}
