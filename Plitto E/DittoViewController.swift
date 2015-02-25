//
//  SecondViewController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/15/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit
import SwiftyJSON

/*
protocol dittoViewDelegate {
  func thingSelected(thing: Thing)
}
*/

class DittoViewController: UIViewController {

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
    return 50
  }

  // Sets the height of the section header. Required to make the first section header appear.
  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 25
  }


  // This creates a view for every row in the header.
  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    // Don't display empty sections.
    //    if !self.sections[section].
    //
    println("header section: \(section)")
    // println("sections: \(self.sections) Number: \(section) Content: \(self.sections[section])")

    var view = UIView()
    var listName = UILabel()
    var userName = UILabel()

    // Populate the data for the cell.
    listName.text = self.sections[section]["listname"]
    userName.text = self.sections[section]["userName"]

    // Button for the section titles
    //    let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
    //     button.addTarget(self, action: "visibleRow:", forControlEvents:.TouchUpInside)

    listName.setTranslatesAutoresizingMaskIntoConstraints(false)
    userName.setTranslatesAutoresizingMaskIntoConstraints(false)

    //     button.setTranslatesAutoresizingMaskIntoConstraints(false)
    //     button.setTitle("Test Title", forState: .Normal)
    let views = ["listName": listName, "view": view, "userName": userName ]
    view.addSubview(listName)
    view.addSubview(userName)

    //    view.addSubview(button)
    var horizontallayoutContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[listName]-10-|", options: .AlignAllCenterY, metrics: nil, views: views)
    view.addConstraints(horizontallayoutContraints)

    var verticalLayoutContraint = NSLayoutConstraint(item: listName, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
    view.addConstraint(verticalLayoutContraint)


    // Returns the completed view.
    //    return view
    return view
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