//
//  FA_TableViewController.swift
//  iOSEngineeringTest
//
//  Created by Pierre Laurac on 11/7/16.
//  Copyright © 2016 FrontApp. All rights reserved.
//

import Foundation
import UIKit

class FA_TableViewController: UITableViewController {
  
  fileprivate let messageCellIdentifier = "conversationCell"
  
  fileprivate var conversations: [FA_Conversation] = []
  
  override func viewDidLoad() {
    getConversation()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return conversations.count
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier, for: indexPath)
    let message = self.conversations[indexPath.row]
    
    cell.textLabel?.text = message.blurb
    return cell
  }
  
  
  fileprivate func getConversation() {
    do {
      let pathToComposer = Bundle.main.path(forResource: "conversation", ofType: "json")
      let jsonData = try NSData(contentsOfFile: pathToComposer!) as Data
      let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! Dictionary<String, Any>
      self.conversations = (json["conversations"] as! Array<Dictionary<String, Any>>).map {
        return FA_Conversation(dict: $0)
      }

    } catch {
      NSLog("-- Error while parsing")
    }
  }
}
