//
//  MainViewController.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Updated by Ray Fix on 4/12/15
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//


import UIKit

class MainViewController: UITableViewController {
    var members: [Member] = []
    var currentIndexMember: Int = 0
    
    // Mark: - Model
    
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("TeamMembers", ofType: "json")
        members = Member.loadMembersFromFile(path!)
    }
    
    // Mark: - View Lifetime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // appearance and layout customization
        self.tableView.backgroundView = UIImageView(image:UIImage(named:"background"))
        self.tableView.estimatedRowHeight = 280
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // load our model
        loadModel();
        
        
        //Swipe movement animation
        var aSwipeGesture = UISwipeGestureRecognizer(target:self, action:"swipeGesture:")
        aSwipeGesture.direction = .Left
        self.view.addGestureRecognizer(aSwipeGesture)
        
        aSwipeGesture = UISwipeGestureRecognizer(target:self, action:"swipeGesture:")
        aSwipeGesture.direction = .Right
        self.view.addGestureRecognizer(aSwipeGesture)
        
    }
    
    // Mark: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as! CardTableViewCell
        let member = members[currentIndexMember]
        cell.useMember(member)
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    //Mark:- Animation cell fade in
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
            
            //   TipInCellAnimator.animate(cell)
            
            TipInCellAnimator.animateWithRotation(cell)
            
            //animation with stored property
            // TipInCellAnimator.animateWithStartDefault(cell)
            
            //define the animation only when cell is displayed
            /*     if !preventAnimation.contains(indexPath) {
            preventAnimation.insert(indexPath)
            TipInCellAnimator.animate(cell)
            } */
            
    }
    
    
    //Mark:- events of swipe gestures
    
    func swipeGesture(sender:UISwipeGestureRecognizer) {
        
        if sender.direction == .Left {
            currentIndexMember++
            if currentIndexMember > members.count - 1{
                currentIndexMember = 0
            }
            
            self.tableView.reloadData()
            
        } else if sender.direction == .Right {
            currentIndexMember--
            if currentIndexMember < 0 {
                currentIndexMember = members.count - 1
            }
            self.tableView.reloadData()
            
        }
    }
    
}

