//
//  ViewController.swift
//  View2
//
//  Created by Student on 12/3/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var TableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 999
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CellNumberTableViewCell
        cell.labelCell.text = "\(indexPath.row)"
        return cell
    }

}

