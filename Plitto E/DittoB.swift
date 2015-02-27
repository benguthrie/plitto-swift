//  Plitto E
//
//  Created by Ben Guthrie on 2/24/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit
import SwiftyJSON

/*
protocol dittoViewDelegate {
func thingSelected(thing: Thing)
}
*/

class DittoBController: UIViewController {

  let path = "testcontent"

  var sections = [[String:String]]()
  // var sectionRows = Array<Dictionary<String, String>>()
  var sectionRows = [[[String:String]]]()


  // This is the table.
  @IBOutlet var tableView: UITableView!

  func completeCallback(){
    println("CallbackF")
  }

  @IBAction func ReloadContent(sender: UIButton) {
    println("ReloadContentCalled")

    // ViewReturn().clearView()
    let parameters = [
      "todo":"Token should come from somewhere.",
      "todo2":"There may be other parameters"
    ]

    // TEST FUNCTION self.tableView = ViewReturn().standardView(path, parameters: parameters)

    // This loads the data into the table.
    // ALL DONE LOCALLY
    populateTableData()
  }

  func populateTableData(){
    //
    println("populateTableData")
    // Reset the sections.
    self.sections = []
    self.sectionRows = []
    // Load the empty table
    self.tableView.reloadData()

    // TODO put , error after returnedRows
    demoAPI().returnData(path) { returnedSections, returnedRows in

      // Clear it.
      self.sections = returnedSections!
      self.sectionRows = returnedRows!

      // Populate it.
      self.tableView.reloadData()
      return
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    //    println("Super viewDidLoad. Populate data.")


    //Section header register
    var sectionNib = UINib(nibName: "feedSection", bundle: nil)
    self.tableView.registerNib(sectionNib, forCellReuseIdentifier: "feedSection")

    var footerNib = UINib(nibName: "feedFooter", bundle: nil)
    self.tableView.registerNib(footerNib, forCellReuseIdentifier: "feedFooter")


    var rowNib = UINib(nibName: "feedRow", bundle: nil)
    self.tableView.registerNib(rowNib, forCellReuseIdentifier: "feedRow")

    // Insert the table into the view. // UPDATE TODO - This doesn't seem needed.
    // self.view.addSubview(tableView)

    // TODO - Resize the table to the available space in the view.
    populateTableData()
    // TODO - Whatever function works above, add it here.


  }

  /* This will count the number of sections. This is triggered by what? Called just before sections comes in. */
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    //     println("numberofSectionsinTableView \(self.sections.count)")
    return self.sections.count
  }


  // Count the Items to show in this section
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //     println("tableView Count! SelectedSection: \(section) count: \(self.sectionRows[section].count)")
    return self.sectionRows[section].count
  }

  // This is what builds the cell for each row, and returns it.
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    // Collect the data for each
    let object = sectionRows[indexPath.section][indexPath.row] // as NSDictionary

    var tc: feedRow = tableView.dequeueReusableCellWithIdentifier("feedRow") as feedRow!
    tc.thingName.text = object["thingName"]
    tc.dateAdded.text = object["added"]

    return tc

  }

  // Select management
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    println("Selected at \(indexPath.row)")
  }

  // Sets the height of the section header. Required to make the first section header appear.
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return CGFloat(Constants().cellSize)
  }

  // Sets the height of the section header. Required to make the first section header appear.
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat(Constants().headerSize)
  }

  // Sets the height of the section footer.
  func tableView(tableView: UITableView, heightForFoooterInSection section: Int) -> CGFloat {
    return CGFloat(1500)
  }

  // This creates a view for every row in the header.
  func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UITableViewCell! {
    var footerCell: feedFooter = tableView.dequeueReusableCellWithIdentifier("feedFooter") as feedFooter!
    return footerCell
  }

  // This creates a view for every row in the header.
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UITableViewCell! {
    // return FeedView().rowView("the list name", theUserName: "user name")
    // Works, but not styled:      
    // WORKS when SectionHeader (not nib: ) 

    // Works, but doesn't update values
    // return FeedView().sectionHeaderNib(self.sections[section]["listname"]!, theUserName: self.sections[section]["userName"]!, userFbuid: self.sections[section]["fbuid"]! )

    // In the people view section: tempItem["ik"] = json["results"][index]["lists"][indexB]["items"][indexC]["ik"].string!


    var tvc: feedSection = tableView.dequeueReusableCellWithIdentifier("feedSection") as feedSection!

    // Add a space to the username to account for the l
    tvc.userName.text = " " + self.sections[section]["userName"]!
    tvc.listName.text = sections[section]["listname"]!

    let fbuid = self.sections[section]["fbuid"]!

    // TODO User profile
    let url = NSURL(string: "https://graph.facebook.com/\(fbuid)/picture?height=75&width=75&return_ssl_resources=1")

    let urlRequest = NSURLRequest(URL: url!)

    NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
      // Display the image
      let image = UIImage(data: data)
      tvc.userImage.image = image
    }

    return tvc
  }

  // Mark: Table View Delegate. Make a selection.
  func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    println ("Selected Something from the content list.")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
};