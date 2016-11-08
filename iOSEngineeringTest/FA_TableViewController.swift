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
  
  fileprivate let messageCellIdentifier = "messageCell"
  
  fileprivate var messages: [FA_Message] = []
  
  override func viewDidLoad() {
    getConversation()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier, for: indexPath)
    cell.textLabel?.text = "Message \(indexPath.row)"
    return cell
  }
  
  
  fileprivate func getConversation() {
    do {
      let pathToComposer = Bundle.main.path(forResource: "conversation", ofType: "json")
      let jsonData = try NSData(contentsOfFile: pathToComposer!) as Data
      let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! Dictionary<String, Any>
      let rawMessages = json["messages"] as! Array<Dictionary<String, Any>>
      rawMessages.forEach({ (message) in
        self.messages.append(FA_Message(dict: message))
      })
    } catch {}
  }
}
