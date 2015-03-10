//
//  SecondViewController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/15/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet var ProfileTitle: UILabel!

  @IBOutlet var ProfileImage: UIImageView!

  @IBOutlet var SharedThings: UILabel!
  
  @IBOutlet var DittoableThings: UILabel!

  @IBOutlet var plittoId: UILabel!

  var theLinkSource: String!

  @IBAction func test(sender: AnyObject) {
    println("Pressed 'Back'. LinkSource: \(theLinkSource)")

    // Now, navigate back to the source of the click.
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewToShow = storyboard.instantiateViewControllerWithIdentifier(theLinkSource) as PeopleViewController



    var isVisible = self.tabBarController?.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame)

    println("isVisibile: \(isVisible)")


    // Now, show the tab bar
    if ( isVisible == true) {
      println("Tab Bar IS visible")
      /*
      // get a frame calculation ready
      let frame = self.tabBarController?.tabBar.frame
      let height = frame?.size.height
      let offsetY = (isVisible ? -height! : height)

      // zero duration means no animation
      let duration:NSTimeInterval = 0.3

      //  animate the tabBar
      if frame != nil {
        UIView.animateWithDuration(duration) {
          self.tabBarController?.tabBar.frame = CGRectOffset(frame!, 0, offsetY!)
          return
        }
      }
      */

    } else {
      println("It is hiddend")
    }



    self.presentViewController(viewToShow, animated: true, completion: nil)

  }


  // println("person")

  // This is called when someone clicks on an item from the list.
  func buildProfile(personName: String, fbuid: String, dittoable: String, shared: String, pID: String, linkSource: String){
    println("called test\(personName)")

    ProfileTitle.text = personName
    SharedThings.text = shared
    DittoableThings.text = dittoable
    plittoId.text = pID

    theLinkSource = linkSource


    println("linkSource: \(linkSource)")

    // Async user images
    let url = NSURL(string: "https://graph.facebook.com/\(fbuid)/picture?height=100&width=100&return_ssl_resources=1")
    let urlRequest = NSURLRequest(URL: url!)

    NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in

      // Display the image
      let image = UIImage(data: data)
      self.ProfileImage.image = image

    }

  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }



}
/*

class person  {
  let name: String
  let plittoId: String

  init(name: String, plittoId: String){
    self.name = name
    self.plittoId = plittoId
  }


}

*/