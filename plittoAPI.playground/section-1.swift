// Playground - noun: a place where people can play
import Foundation
import Cocoa
import XCPlayground
// import Alamofire
// import PureLayout/PureLayout.h

var str = "Hello, playground"

let url=NSURL(string: "http://localhost/api/2.0/testcontent")!

/* Begin Alamofire call */
let parameters = [
  "foo":"bar"
]

/*
Alamofire.request(.POST, "http://localhost/api/2.0/testcontent", parameters: parameters)
  .response{
    (request, response, data, error ) in
    // SHows the request println(request)
    // Shows server stats. println(response)
    // Raw data. println(data)
    let json = JSON(data!)
    println(json)
}
*/
