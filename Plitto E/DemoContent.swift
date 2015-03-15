 //
//  DemoContent.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/16/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

// Not sure we need this. import Foundation
import Foundation
import SwiftyJSON
import Alamofire

class plittoContent {

  // Define the elements that are in the friends bit.
  let results: AnyObject


  init(
    results: AnyObject
    )
  {
    self.results = results
  }

}

typealias JSONDictionary = Dictionary<String, AnyObject>
typealias JSONArray = Array<AnyObject>

public class demoAPI: NSObject, NSURLConnectionDataDelegate {

  func dataToView( path: String, completionHandler: (responseObject: NSDictionary?, error: NSError?) -> ()) {
    demoContent( path, completionHandler )
  }

  func returnData( path: String, dataCompletionHandler: (responseSections: [[String:String]]?, responseRows: [[[String:String]]]?) -> ()) {

    // Prep the formatter
    var timeString = NSDateFormatter()
    timeString.dateFormat = "yyy-MM-dd HH:mm:ss"

    // Make the API call.

    //    
    demoContentData(path) { responseObject, error in
      println("responseObject: \(responseObject)")


      // Loop through the results.
      var json = JSON(responseObject!)

      // Placeholder for the section names
      var tempSections = [[String: String]]()
      // Placeholder for the section data.
      // var tempSectionRows = Array<Dictionary<[String: String]>>()
      var tempSectionRows = [[[String:String]]]()

      for (index, item) in enumerate(json["results"]){

        for (indexB, itemB) in enumerate(json["results"][index]["lists"]){

          // var tempSectionRows = Array<String>()
          if let section = json["results"][index]["lists"][indexB]["listname"].string {

            tempSections.append( ["listname": json["results"][index]["lists"][indexB]["listname"].string!, "userName": json["results"][index]["username"].string!
              , "fbuid": json["results"][index]["fbuid"].string!])
            // Create the placeholder for these items.
            tempSectionRows.append([])

          }

          let sectionIndex = tempSections.count

          // Go through each item to add it to the section Rows.
          for (indexC, itemC ) in enumerate(json["results"][index]["lists"][indexB]["items"]){

            // TODO 2 - The conversion from JSON to this object feels like it should be easier than this.
            if let sectionRow = json["results"][index]["lists"][indexB]["items"][indexC]["thingname"].string {
              var tempItem = [String:String]()
              //TODO Could reduce code.
              // for (key: String, item: JSON) in json["results"][index]["lists"][indexB]["items"][indexC] {
              // println(key, item)
              // tempItem[key] = item.string!
              // }


              tempItem["thingName"] = json["results"][index]["lists"][indexB]["items"][indexC]["thingname"].string!
              tempItem["ik"] = json["results"][index]["lists"][indexB]["items"][indexC]["ik"].string!

              // Use TimeAgo rather than not.
              tempItem["added"] = PlittoAPI().timeAgoSinceDate(timeString.dateFromString(json["results"][index]["lists"][indexB]["items"][indexC]["added"].string!)!)
              tempItem["tid"] = json["results"][index]["lists"][indexB]["items"][indexC]["tid"].string!
              tempItem["id"] = json["results"][index]["lists"][indexB]["items"][indexC]["id"].string!
              tempItem["dittoCount"] = json["results"][index]["lists"][indexB]["items"][indexC]["dittoCount"].string!

              /* R6FEH
              tempItem["mykey"] = json["results"][index]["lists"][indexB]["items"][indexC]["mykey"].string!

              // Ditto information
              tempItem["dittokey"] = json["results"][index]["lists"][indexB]["items"][indexC]["dittokey"].string!
              tempItem["dittouser"] = json["results"][index]["lists"][indexB]["items"][indexC]["dittouser"].string!
              tempItem["dittousername"] = json["results"][index]["lists"][indexB]["items"][indexC]["dittousername"].string!

              // Comment Information

              tempItem["commentActive"] = json["results"][index]["lists"][indexB]["items"][indexC]["commentActive"].string!
              tempItem["commentCount"] = json["results"][index]["lists"][indexB]["items"][indexC]["commentCount"].string!
              tempItem["commentRead"] = json["results"][index]["lists"][indexB]["items"][indexC]["commentRead"].string!
              tempItem["commentText"] = json["results"][index]["lists"][indexB]["items"][indexC]["commentText"].string!

              */

              tempSectionRows[sectionIndex - 1].append(tempItem)
            }

          }
        }
      }

      // After processing, return the stuff.
      dataCompletionHandler( responseSections: tempSections, responseRows: tempSectionRows)

    }

    // TODO - Build the TableView with sections here.
    // println("SECTIONS! \(tempSections)")
    // println("SECTION ROWS! \(tempSectionRows)")
    // self.sections = tempSections
    // self.sectionRows = tempSectionRows
    //  self.sections=

  }




  //success: ((plittoData: NSJSONSerialization?, error: NSError?) -> Void )
  public func demoContentData( path: String, completionHandler: (responseObject: NSDictionary?, error: NSError?) -> ()) {
    let url=NSURL(string: "http://localhost/api/2.0/\(path)")!

    /* Begin Alamofire call */
    let parameters = [
      "foo":"bar"
    ]

    //     var internalSuccess: Bool
    var internalSuccess: Bool

    Alamofire.request(.POST, "http://localhost/api/2.0/\(path)", parameters: parameters)
      .responseJSON{
        (request, response, responseObject, error ) in

        // Now, take the data in the response object, and make it the two arrays.
        // TODO - Handle Error & Make sure that the data is valid.


        // Take action on it being completed.
        completionHandler(responseObject: responseObject as? NSDictionary, error: error)
        
    }
    
  }

  //success: ((plittoData: NSJSONSerialization?, error: NSError?) -> Void )
  public func demoContent( path: String, completionHandler: (responseObject: NSDictionary?, error: NSError?) -> ()) {
    let url=NSURL(string: "http://localhost/api/2.0/\(path)")!

    /* Begin Alamofire call */
    let parameters = [
      "foo":"bar"
    ]

    //     var internalSuccess: Bool
    var internalSuccess: Bool

    Alamofire.request(.POST, "http://localhost/api/2.0/testcontent", parameters: parameters)
      .responseJSON{
        (request, response, responseObject, error ) in

        // Take action on it being completed.
        completionHandler(responseObject: responseObject as? NSDictionary, error: error)

    }

  }
}

class Person {

  // Define the elements that are in the friends bit.
  let id: String
  let name: String
  let fbuid: String
  let shared: String
  let dittoable: String
  let lists: String
  let sharedlists: String
  let dittosout: String
  let dittosin : String

  init(
    id: String,
    name: String,
    fbuid: String,
    things: String,
    shared: String,
    dittoable: String,
    lists: String,
    sharedlists: String,
    dittosout: String,
    dittosin: String
    )
  {
    self.id = id
    self.name = name
    self.fbuid = fbuid
    self.shared = shared
    self.dittoable = dittoable
    self.lists = lists
    self.sharedlists = sharedlists
    self.dittosout = dittosout
    self.dittosin = dittosin

  }

  class func FriendData() -> Array<Person> {
    return [
      Person(
        id: "2",
        name: "Emily Muscarella Guthrie",
        fbuid: "605592731",
        things: "1352",
        shared: "765",
        dittoable: "587",
        lists: "149",
        sharedlists: "114",
        dittosout: "1",
        dittosin: "1"
      ),Person(
        id: "13",
        name: "Scott Guthrie",
        fbuid: "1009170001",
        things: "288",
        shared: "102",
        dittoable: "186",
        lists: "41",
        sharedlists: "22",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "14",
        name: "James Guthrie",
        fbuid: "4700538",
        things: "380",
        shared: "172",
        dittoable: "208",
        lists: "32",
        sharedlists: "28",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "18",
        name: "Greg Guthrie",
        fbuid: "4700900",
        things: "1113",
        shared: "564",
        dittoable: "549",
        lists: "103",
        sharedlists: "83",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "25",
        name: "Jenny Muscarella Knowles",
        fbuid: "1489740361",
        things: "552",
        shared: "216",
        dittoable: "336",
        lists: "52",
        sharedlists: "36",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "64",
        name: "Jeff Bowen",
        fbuid: "4702676",
        things: "186",
        shared: "121",
        dittoable: "65",
        lists: "25",
        sharedlists: "20",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "69",
        name: "Desiree Lieber",
        fbuid: "1247873543",
        things: "144",
        shared: "40",
        dittoable: "104",
        lists: "6",
        sharedlists: "6",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "77",
        name: "Dale Gilliam III",
        fbuid: "1152292547",
        things: "27",
        shared: "15",
        dittoable: "12",
        lists: "9",
        sharedlists: "6",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "132",
        name: "Julie Guthrie",
        fbuid: "1009170007",
        things: "271",
        shared: "114",
        dittoable: "157",
        lists: "29",
        sharedlists: "22",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "156",
        name: "Matt Knowles",
        fbuid: "1016195417",
        things: "436",
        shared: "249",
        dittoable: "187",
        lists: "72",
        sharedlists: "61",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "168",
        name: "Ben Morrow",
        fbuid: "44401410",
        things: "108",
        shared: "7",
        dittoable: "101",
        lists: "2",
        sharedlists: "2",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "720",
        name: "Eliot Landrum",
        fbuid: "10152421095426225",
        things: "14",
        shared: "8",
        dittoable: "6",
        lists: "6",
        sharedlists: "4",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "721",
        name: "Mark Murphy",
        fbuid: "10204715953633804",
        things: "26",
        shared: "23",
        dittoable: "3",
        lists: "16",
        sharedlists: "14",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "722",
        name: "Eric Swayne",
        fbuid: "1171795940",
        things: "1",
        shared: "1",
        dittoable: "0",
        lists: "1",
        sharedlists: "1",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "723",
        name: "Aimee Aslett Barborka",
        fbuid: "1463180510",
        things: "19",
        shared: "17",
        dittoable: "2",
        lists: "5",
        sharedlists: "5",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "724",
        name: "Amy Kendrick Lee",
        fbuid: "1032705871",
        things: "41",
        shared: "24",
        dittoable: "17",
        lists: "8",
        sharedlists: "8",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "725",
        name: "Daniel Miller",
        fbuid: "10152556380552110",
        things: "247",
        shared: "84",
        dittoable: "163",
        lists: "25",
        sharedlists: "24",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "726",
        name: "Stephen Brewer",
        fbuid: "530649084",
        things: "2",
        shared: "2",
        dittoable: "0",
        lists: "2",
        sharedlists: "2",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "730",
        name: "Diego Netto",
        fbuid: "500877045",
        things: "19",
        shared: "19",
        dittoable: "0",
        lists: "6",
        sharedlists: "6",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "733",
        name: "Carri Craver",
        fbuid: "500443894",
        things: "55",
        shared: "23",
        dittoable: "32",
        lists: "19",
        sharedlists: "11",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "734",
        name: "Chirag Gupta",
        fbuid: "825550647",
        things: "5",
        shared: "3",
        dittoable: "2",
        lists: "4",
        sharedlists: "3",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "744",
        name: "Amelie Brown",
        fbuid: "10100747900413418",
        things: "17",
        shared: "14",
        dittoable: "3",
        lists: "5",
        sharedlists: "3",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "753",
        name: "Ellen Clark Murphy",
        fbuid: "10205026023546842",
        things: "14",
        shared: "4",
        dittoable: "10",
        lists: "1",
        sharedlists: "1",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "754",
        name: "Eric VanderSchaaf",
        fbuid: "677167799334",
        things: "10",
        shared: "7",
        dittoable: "3",
        lists: "7",
        sharedlists: "6",
        dittosout: "1",
        dittosin: "1"
      ),
      Person(
        id: "1",
        name: "Ben Guthrie",
        fbuid: "532345366",
        things: "3852",
        shared: "3852",
        dittoable: "0",
        lists: "350",
        sharedlists: "350",
        dittosout: "0",
        dittosin: "0"
      )
    ]

  }
};