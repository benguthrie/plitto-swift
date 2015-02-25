//
//  FriendCell.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/16/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
  init(style: UITableViewCellStyle, reuseIdentifier: String){
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    // Initialization Code
  }

  override func awakeFromNib(){
    super.awakeFromNib()
    // Initialization Code
  }

  override func setSelected(selected: Bool, animated: Bool){
    super.setSelected(selected, animated: animated)
    configure view for state.
  }

}
