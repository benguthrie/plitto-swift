//
//  PlittoAPI.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/18/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import Foundation
import UIKit


// : UIViewController, UITableViewDataSource, UITableViewDelegate
class PlittoAPI {
  func FacebookLogin(facebookToken: String){
    println("Called Facebook Login")
  }

  func content(apiPath: String, parameters: String){
    //TODO - Parameters may be JSON, may be an object, may be an array
    println("Plitto API Called for path \(apiPath)")

    // showFeed: type: strangers / friends, userFilter: plittoId, listFilter: listId, myState: 0 or 1, continueKey: lastKeyInt, orOlder, data: ???
  }

  func getData(apiPath: String, parameters: String) {
    println("Request Data")
    // TODO - Move the data collection into here.
    
  }

  func formatJson(responseObject: AnyObject) -> (sections: Array<Dictionary<String,String>>, sectionRows: Array<Array<Dictionary<String,String>>>){
    // TODO - Why is this here?
    var sections = [["listname":"Test", "userName":"John Doe"]]
    var sectionRows = [[["thingName":"Something Awesome","ik":"woiuhrgownrgh","added":"today","tid":"124124","id":"1412","dittoCount":"0"]]]

    return (sections, sectionRows)
  }


  func timeAgoSinceDate(date:NSDate) -> String {
    let numericDates = true
    
    let calendar = NSCalendar.currentCalendar()
    let unitFlags = NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitSecond
    let now = NSDate()
    let earliest = now.earlierDate(date)
    let latest = (earliest == now) ? date : now
    let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: nil)

    if (components.year >= 2) {
      return "\(components.year) years ago"
    } else if (components.year >= 1){
      return "Last year"

    } else if (components.month >= 2) {
      return "\(components.month) months ago"
      
    } else if (components.month >= 1){
      return "Last month"

    } else if (components.weekOfYear >= 2) {
      return "\(components.weekOfYear) weeks ago"
    } else if (components.weekOfYear >= 1){

      return "Last week"

    } else if (components.day >= 2) {
      return "\(components.day) days ago"
    } else if (components.day >= 1){

      return "Yesterday"

    } else if (components.hour >= 2) {
      return "\(components.hour) hours ago"
    } else if (components.hour >= 1){

      return "An hour ago"
    } else if (components.minute >= 2) {
      return "\(components.minute) minutes ago"
    } else if (components.minute >= 1){

      return "A minute ago"
    } else if (components.second >= 3) {
      return "\(components.second) seconds ago"
    } else {
      return "Just now"
    }
    
  }

}
