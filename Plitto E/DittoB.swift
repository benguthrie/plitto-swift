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

    // This is the position (first two) and size (second two) (x, y, width, height )
    self.tableView.frame = CGRectMake(0, 75, 320, 450);
    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

    // Insert the table into the view. // UPDATE TODO - This doesn't seem needed.
    // self.view.addSubview(tableView)

    // TODO - Resize the table to the available space in the view.
    populateTableData()
    // TODO - Whatever function works above, add it here.

    //Section header register
    var sectionNib = UINib(nibName: "feedSection", bundle: nil)
    self.tableView.registerNib(sectionNib, forCellReuseIdentifier: "feedSection")

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
    //     println("Build the cells")

    // let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
    var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell

    // Collect the data for each
    let object = sectionRows[indexPath.section][indexPath.row] // as NSDictionary

    // cell.textLabel?.text =
    // It executes this as the user navigates up and down. println("object: \(object)")
    // cell.textLabel?.text = "TEMP" // object["thingname"]
    cell.textLabel?.text = object["thingName"]

    return cell

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


  // This creates a view for every row in the header.
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    // return FeedView().rowView("the list name", theUserName: "user name")
    // Works, but not styled:      
    // WORKS when SectionHeader (not nib: ) return FeedView().sectionHeaderNib(self.sections[section]["listname"]!, theUserName: self.sections[section]["userName"]!, userFbuid: self.sections[section]["fbuid"]! )

    let headerCell = tableView.dequeueReusableCellWithIdentifier("feedSection") as feedSectionCell
    // headerCell.backgroundColor = UIColor.cyanColor()
    // headerCell.headerLabel.text = "Other"

    return headerCell


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