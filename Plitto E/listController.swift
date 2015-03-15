//
//  listController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 3/13/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class listController: UIViewController {

  // Variables that will display.

  @IBAction func listClose(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: {});
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
