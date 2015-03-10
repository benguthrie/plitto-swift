//
//  AddListController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 3/6/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit


class AddListController: UIViewController {

  @IBOutlet var addListText: UITextField!

  @IBOutlet var AddListContext: UILabel!

  @IBAction func addButtonPressed(sender: UIButton) {
    println("Add button Pressed")
    println(addListText.text)
  }

  @IBAction func AddListSubmit(sender: AnyObject) {
    println("Editing ended")
  }
  
  @IBAction func textChanged(sender: AnyObject) {
    println("Text Changed")
    println(addListText.text)
    // TODO - This event is not being triggered.
    // Based on this event, the search should be triggered
    var AddListContext = "Updated"

  }

}