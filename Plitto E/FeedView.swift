//
//  FeedView.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/24/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//


// TODO - This might be able to be deleted.
import Foundation
import UIKit

class FeedView: UIViewController {

  // Try to use the nib.
  func sectionHeaderNib(theListName: String, theUserName: String, userFbuid: String) -> UIView? {

    println("header Nib section: fbuid: \(userFbuid)")
    // println("sections: \(self.sections) Number: \(section) Content: \(se
    var sectionXib = NSBundle.mainBundle().loadNibNamed("feedSection", owner: self, options: nil).first as UITableViewCell

    var sectionHeader = UITableViewCell(frame: CGRectMake(0, 0, 80, 80))
    sectionHeader.addSubview(sectionXib)

    return sectionHeader


  }


}
