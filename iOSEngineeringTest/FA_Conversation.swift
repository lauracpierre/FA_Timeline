//
//  FA_Conversation.swift
//  iOSEngineeringTest
//
//  Created by Pierre Laurac on 8/20/17.
//  Copyright © 2017 FrontApp. All rights reserved.
//

import Foundation

class FA_Conversation {
  
  init(dict: Dictionary<String,Any>) {
    self.messages = (dict["messages"] as! [Dictionary<String,Any>]).map() { return FA_Message(dict: $0) }
    self.blurb = dict["blurb"] as! String
    self.read = dict["read"] as! Bool
    self.from = dict["from"] as! String
  }
  
  var messages: [FA_Message]!
  var blurb: String!
  var read: Bool!
  var from: String!
}
