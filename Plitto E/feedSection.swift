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

/*
  override init(style: UITableViewCellStyle, reuseIdentifier: String!){
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }

  required init(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setupViews()
  }

  func setupViews(){

  // May not need these due to the .xib.
  // userName.lineBreakMode = .ByTruncatingTail
  // userName.numberOfLines = 0
  // userName.textAlignment = .Left
  // listName.numberOfLines = 0


  }
*/

  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // 
    println("selected a user section \(selected)")
    // println(selected)



  }


}