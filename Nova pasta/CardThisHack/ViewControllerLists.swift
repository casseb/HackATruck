//
//  ViewControllerLists.swift
//  CardsProject1.0
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class ViewControllerLists: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableRecents: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableRecents.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! recentsCell
        
        cell.labelN.text = UserLog.getReference().getUser().name
        
        return cell
    }
}
