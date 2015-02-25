//
//  PersonCellTableViewCell.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/16/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class PersonCellTableViewCell: UITableViewCell {


  @IBOutlet var name: UILabel!
  @IBOutlet var shared: UILabel!
  @IBOutlet var dittoable: UILabel!
  @IBOutlet var fbuid: UILabel!
  @IBOutlet var facebookImage: UIImageView!
  @IBOutlet var plittoId: UILabel!

  /*
    override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
      We don't need anything to happen when this loads.
    }
  */

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // println("selected")
    // println(selected)
  }


  @IBAction func navigateToProfile(){
    println("navigateToProfile")
  }


}
