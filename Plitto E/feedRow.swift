//
//  feedSecftionController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/26/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class feedRow: UITableViewCell {
  @IBOutlet var thingName: UILabel!
  @IBOutlet var dateAdded: UILabel!
  @IBOutlet var dittoStatus: UIButton!

  @IBAction func DittoAction(sender: AnyObject) {
    println("Got the ditto")
  }

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    //
    println("selected a user section \(selected)")
    // println(selected)
  }
  
  
} // Bad_instruction code=EXC_i386_INVOP