//
//  DemoFriendList.swift
//  Plitto E
//
//  Created by Ben Guthrie on 2/16/15.
//  Copyright (c) 2015 Ben Guthrie. All rights reserved.
//

import Foundation

class Demo {
  func test() -> String {
    return "This is a test"
  }

  // Prepare the template

  //  var tempDef = [firstName: String, lastName: String]


  var strangerList = [
    (
      id: "13",
      name: "Cat 45",
      fbuid: "1009170001",
      things: "288",
      shared: "102",
      dittoable: "186",
      lists: "41",
      sharedlists: "22",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "14",
      name: "Dig 23",
      fbuid: "4700538",
      things: "380",
      shared: "172",
      dittoable: "208",
      lists: "32",
      sharedlists: "28",
      dittosout: "1",
      dittosin: "1"
    )
  ]

  var friendsList = [
    (
      id: "13",
      name: "Scott Guthrie",
      fbuid: "1009170001",
      things: "288",
      shared: "102",
      dittoable: "186",
      lists: "41",
      sharedlists: "22",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "14",
      name: "James Guthrie",
      fbuid: "4700538",
      things: "380",
      shared: "172",
      dittoable: "208",
      lists: "32",
      sharedlists: "28",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "18",
      name: "Greg Guthrie",
      fbuid: "4700900",
      things: "1113",
      shared: "564",
      dittoable: "549",
      lists: "103",
      sharedlists: "83",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "25",
      name: "Jenny Muscarella Knowles",
      fbuid: "1489740361",
      things: "552",
      shared: "216",
      dittoable: "336",
      lists: "52",
      sharedlists: "36",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "64",
      name: "Jeff Bowen",
      fbuid: "4702676",
      things: "186",
      shared: "121",
      dittoable: "65",
      lists: "25",
      sharedlists: "20",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "69",
      name: "Desiree Lieber",
      fbuid: "1247873543",
      things: "144",
      shared: "40",
      dittoable: "104",
      lists: "6",
      sharedlists: "6",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "77",
      name: "Dale Gilliam III",
      fbuid: "1152292547",
      things: "27",
      shared: "15",
      dittoable: "12",
      lists: "9",
      sharedlists: "6",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "132",
      name: "Julie Guthrie",
      fbuid: "1009170007",
      things: "271",
      shared: "114",
      dittoable: "157",
      lists: "29",
      sharedlists: "22",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "156",
      name: "Matt Knowles",
      fbuid: "1016195417",
      things: "436",
      shared: "249",
      dittoable: "187",
      lists: "72",
      sharedlists: "61",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "168",
      name: "Ben Morrow",
      fbuid: "44401410",
      things: "108",
      shared: "7",
      dittoable: "101",
      lists: "2",
      sharedlists: "2",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "720",
      name: "Eliot Landrum",
      fbuid: "10152421095426225",
      things: "14",
      shared: "8",
      dittoable: "6",
      lists: "6",
      sharedlists: "4",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "721",
      name: "Mark Murphy",
      fbuid: "10204715953633804",
      things: "26",
      shared: "23",
      dittoable: "3",
      lists: "16",
      sharedlists: "14",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "722",
      name: "Eric Swayne",
      fbuid: "1171795940",
      things: "1",
      shared: "1",
      dittoable: "0",
      lists: "1",
      sharedlists: "1",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "723",
      name: "Aimee Aslett Barborka",
      fbuid: "1463180510",
      things: "19",
      shared: "17",
      dittoable: "2",
      lists: "5",
      sharedlists: "5",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "724",
      name: "Amy Kendrick Lee",
      fbuid: "1032705871",
      things: "41",
      shared: "24",
      dittoable: "17",
      lists: "8",
      sharedlists: "8",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "725",
      name: "Daniel Miller",
      fbuid: "10152556380552110",
      things: "247",
      shared: "84",
      dittoable: "163",
      lists: "25",
      sharedlists: "24",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "726",
      name: "Stephen Brewer",
      fbuid: "530649084",
      things: "2",
      shared: "2",
      dittoable: "0",
      lists: "2",
      sharedlists: "2",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "730",
      name: "Diego Netto",
      fbuid: "500877045",
      things: "19",
      shared: "19",
      dittoable: "0",
      lists: "6",
      sharedlists: "6",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "733",
      name: "Carri Craver",
      fbuid: "500443894",
      things: "55",
      shared: "23",
      dittoable: "32",
      lists: "19",
      sharedlists: "11",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "734",
      name: "Chirag Gupta",
      fbuid: "825550647",
      things: "5",
      shared: "3",
      dittoable: "2",
      lists: "4",
      sharedlists: "3",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "744",
      name: "Amelie Brown",
      fbuid: "10100747900413418",
      things: "17",
      shared: "14",
      dittoable: "3",
      lists: "5",
      sharedlists: "3",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "753",
      name: "Ellen Clark Murphy",
      fbuid: "10205026023546842",
      things: "14",
      shared: "4",
      dittoable: "10",
      lists: "1",
      sharedlists: "1",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "754",
      name: "Eric VanderSchaaf",
      fbuid: "677167799334",
      things: "10",
      shared: "7",
      dittoable: "3",
      lists: "7",
      sharedlists: "6",
      dittosout: "1",
      dittosin: "1"
    ),
    (
      id: "1",
      name: "Ben Guthrie",
      fbuid: "532345366",
      things: "3852",
      shared: "3852",
      dittoable: "0",
      lists: "350",
      sharedlists: "350",
      dittosout: "0",
      dittosin: "0"
    )
  ]

}