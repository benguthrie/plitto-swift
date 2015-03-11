//
//  AddListController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 3/6/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit


class AddListController: UIViewController, UITextFieldDelegate {

  @IBOutlet var addListText: UITextField!

  @IBOutlet var AddListContext: UILabel!

  @IBAction func addButtonPressed(sender: UIButton) {
    println("Add button Pressed")
    // println(addListText.text)
    addToList()
  }

  @IBAction func AddListSubmit(sender: AnyObject) {
    println("Editing ended. Probably by return. ")
    addToList()
  }


  @IBAction func textChanged(sender: AnyObject) {
    println("Text Changed")
    // println(addListText.text)
    suggestList()
    // TODO - This event is not being triggered.
    // Based on this event, the search should be triggered
    // AddListContext.text = "Updated"

  }

  override func viewDidLoad(){

    super.viewDidLoad()


    addListText.delegate = self

    AddListContext.text = "Search Above. Results Below."


  }

  func textFieldShouldReturn(theField: UITextField!) -> Bool {
    theField.resignFirstResponder()
    // println("first responder. return text")
    //   addToList()
    return true
  }

  func suggestList() -> String {

    var stringLength = countElements(addListText.text)


    println("suggest a list \(addListText.text) \(stringLength)")

    if stringLength == 0 {
      AddListContext.text = "Search Above"
      println("String was 0")
    } else {
      AddListContext.text = "Results for: \(addListText.text)"
      println("String wwas > 0")
    }

    return "string"
  }

  func addToList() -> String {
    println("Add To List called \(addListText.text)")
    return "string"
  }

}