//
//  feedSecftionController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/26/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class feedRow: UITableViewCell {

  // Matches NM56U
  @IBOutlet var thingName: UILabel!
  @IBOutlet var dateAdded: UILabel!

  // These items change based on the ditto status
  @IBOutlet var dittoIcon: UIImageView!

  @IBOutlet var ik: String!
  @IBOutlet var mykey: String!
  @IBOutlet var pending: UILabel!

  @IBOutlet var tid: String!



  @IBAction func tapThing(sender: AnyObject) {
    println("The thing was tapped in feedRow.swift thingname: \(thingName.text) mykey: \(mykey)")

      }



  @IBAction func DittoAction(sender: AnyObject) {
    // TODO - Get the binary value of the ditto status, and turn the button the proper color
    // add the ? - and make the button grey.
    // It will be based on the "mykey" value.

    // println("Got the ditto. Ditto status: \(mykey.text)")
    // println("Got the ditto. Ditto status:")
    println("mykey: \(mykey)")

    if(mykey == nil){


      pending.text = "?"
      mykey = "placeholder"

      dittoIcon.image = UIImage(named: "bolt")

      dittoIcon.image = UIImage(named: "checkmark-shared")

    } else {

      mykey = nil

      pending.text = "!"
      dittoIcon.image = UIImage(named: "bolt")

      pending.text = nil
      dittoIcon.image = UIImage(named: "checkmark-outline")
    }
  }

/*
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // TODO - This does NOT mean it was selected. 
    println("selected thing \(selected) \(thingName.text)")
    // println(selected)
  }
*/
  
}