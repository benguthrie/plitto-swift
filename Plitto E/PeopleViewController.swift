//
//  FirstViewController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/15/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import Foundation
import UIKit

class personCell: UITableViewCell {

  @IBOutlet weak var firstName: UILabel!

  @IBOutlet weak var lastName: UILabel!

}

class PeopleViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.


  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }





  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
  {
    return people.count
  }

  func tableView(tableView: UITableView!,
    cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
  {
    var cell: personCell = tableView.dequeueReusableCellWithIdentifier("personCell") as personCell!
    let personRow = people[indexPath.row]

    // cell.firstName.text = personRow.firstName
    //    cell.lastName.text = personRow.lastName
    cell.firstName.text = "Test Name"
    //    cell.firstName!.text = personRow.name
    //    cell.lastName.text = personRow.lastName

    return cell


  }



  
}



/*

@objc

// Function definition to choose what relationship populates the data.
protocol PeopleListControllerDelegate {
func personSelected(person: Person)
}



class PeopleListController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  // Create a table view that can be subscribed to in the storyboard.
  @IBOutlet weak var tableView: UITableView!

  // TODO Why is this here?
  var delegate: PeopleListControllerDelegate?

  // Declare that this variable will be populated from the class Person
  var people: Array<Person>!
  

  struct TableView {
    struct CellIdentifiers {
      // Define cell layout for person.
      static let PersonCell = "PersonCell"
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    // Populate the list of people view with data.
    tableView.reloadData()
  }

  func numberOfSectionsInTableView(peopleTableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.PersonCell, forIndexPath: indexPath) as PersonCell
    cell.configureForPerson(people[indexPath.row])
    return cell
  }

  // Mark: Table View Delegate
  func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    let selectedPerson = people[indexPath.row]
    delegate?.personSelected(selectedPerson)
  }


  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  // TEST!!! - Populates the list with friends first.


}

class PersonCell: UITableViewCell {
  @IBOutlet weak var personName: UILabel!

  func configureForPerson(person: Person) {
    personName.text = person.name
  }
}

*/