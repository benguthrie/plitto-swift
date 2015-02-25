//
//  FeedView.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/24/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import Foundation
import UIKit

class FeedView: UIViewController {

  func sectionHeaderOld(theListName: String, theUserName: String, userFbuid: String) -> UIView? {

    println("header section: fbuid: \(userFbuid)")
    // println("sections: \(self.sections) Number: \(section) Content: \(self.sections[section])")

    var view = UIView()
    var listName = UILabel()
    var userName = UILabel()
    var profileImage = UIImageView()


    // Async user images
    let url = NSURL(string: "https://graph.facebook.com/\(userFbuid)/picture?height=100&width=100&return_ssl_resources=1")
    let urlRequest = NSURLRequest(URL: url!)

    NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
      // Display the image
      let image = UIImage(data: data)
      profileImage.image = image


    }

    // TODO Size the image

    // Populate the data for the cell.
    listName.text = theListName
    userName.text = theUserName
    userName.backgroundColor = UIColor.blueColor()

    // Button for the section titles
    //    let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
    //     button.addTarget(self, action: "visibleRow:", forControlEvents:.TouchUpInside)

    profileImage.setTranslatesAutoresizingMaskIntoConstraints(false)
    userName.setTranslatesAutoresizingMaskIntoConstraints(false)
    listName.setTranslatesAutoresizingMaskIntoConstraints(false)

    //     button.setTranslatesAutoresizingMaskIntoConstraints(false)
    //     button.setTitle("Test Title", forState: .Normal)
    let views = ["profileImage": profileImage, "listName": listName, "view": view, "userName": userName ]
    // Make the elements the labels
    //    println(userName)
    view.addSubview(profileImage)
    view.addSubview(listName)
    view.addSubview(userName)

    //    view.addSubview(button)
    var horizontallayoutContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[profileImage]-10-[listName]-10-|", options: .AlignAllCenterY, metrics: nil, views: views)
    view.addConstraints(horizontallayoutContraints)

    var verticalLayoutContraint = NSLayoutConstraint(item: listName, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0)
    view.addConstraint(verticalLayoutContraint)

    return view
  }

  // Try to use the nib.
  func sectionHeaderNib(theListName: String, theUserName: String, userFbuid: String) -> UIView? {

    println("header Nib section: fbuid: \(userFbuid)")
    // println("sections: \(self.sections) Number: \(section) Content: \(self.sections[section])")

    // var view: UIView?

    // Register the NIB as the source of the content.
    // var sectionNib = UINib(nibName: "feedSection", bundle: nil)
    
    return view
  }


}
