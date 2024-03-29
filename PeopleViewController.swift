//
//  PeopleViewController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/16/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

protocol personProfileControllerDelegate {
  func personSelected(person: Person)
}

class PeopleViewController: UIViewController {


  @IBOutlet var tableView: UITableView!

  var delegate: personProfileControllerDelegate?

  var peopleList = Demo().friendsList

  /* REF USERSTRANGERTOGGLE - See Below*/


  // var tableData = Person().FriendData();

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    var nib = UINib(nibName: "PersonCell", bundle: nil)
    tableView.registerNib(nib, forCellReuseIdentifier: "personCell")

    var yOrig = self.tabBarController?.tabBar.frame.origin.y
    var yMax = CGRectGetMaxY(self.view.frame)

    /* BEGIN RESTORE TAB BAR */
    var isVisible = yOrig < yMax

    // println("isVisibile: \(isVisible)")
    // println("origin y \(yOrig)")
    // println("view frame \(yMax)")

    // Test for nil
    if ( yOrig == nil){
      let duration:NSTimeInterval = 0.3
      let frame = self.tabBarController?.tabBar.frame
      let height = frame?.size.height
      println("make show yOrig was nil, duration: \(duration) frame: \(frame) height: \(height)")

/*
      UIView.animateWithDuration(duration) {
        //        self.tabBarController?.tabBar.frame = CGRectOffset(frame!, 0, height!)
        // Doesn't work. self.tabBarController?.tabBar.frame = CGRectOffset(50.0, 0, 50.0)
        
        println("Should be showing the tab bar now.")
        return

      }
*/

      
      
    }
  }

  // Initially, show the list of friends.
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.peopleList.count
  }

  // Populates the cells.
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    // This builds each cell of the table one by one.
    var cell: PersonCellTableViewCell  = self.tableView.dequeueReusableCellWithIdentifier("personCell") as PersonCellTableViewCell

    var dataRow = peopleList[indexPath.row]

    // Async user images
    let url = NSURL(string: "https://graph.facebook.com/\(dataRow.fbuid)/picture?height=75&width=75&return_ssl_resources=1")

    let urlRequest = NSURLRequest(URL: url!)

    NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in

      // Display the image
      let image = UIImage(data: data)
      cell.facebookImage.image = image
        
    }

    cell.name.text = dataRow.name
    cell.fbuid.text = dataRow.fbuid
    cell.dittoable.text = dataRow.dittoable
    cell.shared.text = dataRow.shared
    cell.plittoId.text = dataRow.id

    return cell
  }


  // Mark: Table View Delegate

  // This function shows a user's profile view.
  func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    let selectedPerson = peopleList[indexPath.row]
    // delegate?.personSelected(selectedPerson)
    // println("Selected person: \(selectedPerson)")
    println("selected name: \(selectedPerson.name) Row: \(indexPath.row)")
    //    println("Row \([indexPath.row])")
    // delegate?.personSelected(selectedPerson.name)

    // Deselect the row, for when we come back to it.
    tableView.deselectRowAtIndexPath(indexPath, animated: true)

    // Change the active storyboard item
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewToShow = storyboard.instantiateViewControllerWithIdentifier("personProfile") as ProfileViewController
    
    self.presentViewController(viewToShow, animated: true, completion: nil)

    // viewToShow.personName = selectedPerson.name

    // Call the func
    viewToShow.buildProfile(
      selectedPerson.name,
      fbuid: selectedPerson.fbuid,
      dittoable: selectedPerson.dittoable,
      shared: selectedPerson.shared,
      pID: selectedPerson.id,
      linkSource: "peopleList"
    )
 
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


/* TODO REF USERSTRANGERTOGGLE - Restore the Friends / Stranger toggle.
@IBAction func FriendOrStranger(sender: UISegmentedControl, forEvent event: UIEvent) {

var ViewIndex = sender.selectedSegmentIndex
var command = "doNothing"
peopleList = Demo().strangerList

println("View Index: \(ViewIndex)")

if (ViewIndex == 0){
// Load the friends
println("Tapped Friends")
command = "loadFriends"
peopleList = Demo().friendsList
}
else if (ViewIndex == 1){
// Load the strangers
println("Tapped Strangers")
// TODO - Build an interface for strangers
command = "loadStrangers"
peopleList = Demo().strangerList
}

if(command != "doNothing"){

println("Change List Contents \(command)")



} else {
println("do nothing\(command)")
}

}
*/