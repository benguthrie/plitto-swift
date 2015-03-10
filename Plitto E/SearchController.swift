//
//  SearchController.swift
//  Plitto E
//
//  Created by Ben Guthrie on 3/9/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
  @IBOutlet var SearchText: UITextField!

  @IBAction func SearchText(sender: UITextField) {
    println("Search Happened")
    println(SearchText.text)
    

  }


}
