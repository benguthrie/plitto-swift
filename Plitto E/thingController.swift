//
//  thingController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 3/12/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class thingController: UIViewController {

  // Variables that will display.

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func closeThingDetail(sender: AnyObject) {

    self.dismissViewControllerAnimated(true, completion: {});
  }

}

