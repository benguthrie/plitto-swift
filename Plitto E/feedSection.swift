//
//  feedSecftionController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/25/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class feedSection: UITableViewCell {
  @IBOutlet var userName: UILabel!
  @IBOutlet var listName: UILabel!
  @IBOutlet var userImage: UIImageView!


  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // 
    println("selected a user section \(selected)")
    // println(selected)
  }


}