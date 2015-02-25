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

    var sections = [["listname":"Test", "userName":"John Doe"]]
    var sectionRows = [[["thingName":"Something Awesome","ik":"woiuhrgownrgh","added":"today","tid":"124124","id":"1412","dittoCount":"0"]]]

    return (sections, sectionRows)
  }

}
