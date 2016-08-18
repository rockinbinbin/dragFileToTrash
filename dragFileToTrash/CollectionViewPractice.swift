//
//  CollectionViewPractice.swift
//  dragFileToTrash
//
//  Created by Robin Mehta on 8/18/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class CollectionViewPractice: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = NSMutableArray()
    var dict = NSMutableDictionary()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollEnabled = true
        tableView.hidden = false
        tableView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(tableView)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        tableView.pinToEdgesOfSuperview()
        
        array.addObject(UIImage(named: "image1")!)
        array.addObject(UIImage(named: "image2")!)
        array.addObject(UIImage(named: "image3")!)
        array.addObject(UIImage(named: "image4")!)
        
        dict.setObject(array, forKey: "firstIndex")
        
        array.addObject(UIImage(named: "image5")!)
        array.addObject(UIImage(named: "image4")!)
        array.addObject(UIImage(named: "image3")!)
        array.addObject(UIImage(named: "image2")!)
        
        dict.setObject(array, forKey: "secondIndex")
        
        array.addObject(UIImage(named: "image5")!)
        array.addObject(UIImage(named: "image4")!)
        array.addObject(UIImage(named: "image3")!)
        array.addObject(UIImage(named: "image2")!)
        
        dict.setObject(array, forKey: "thirdIndex")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Tableview Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cell"
        var cell: TableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellId) as? TableViewCell
        
        if cell == nil {
            cell = TableViewCell()
            cell?.selectionStyle = .None
        }
        
        if let cell = cell {
           // cell.viewControllerDelegate = self
            
            if (indexPath.row == 0) {
                cell.array = dict.valueForKey("firstIndex") as? NSMutableArray
            }
            
            if (indexPath.row == 1) {
                cell.array = dict.valueForKey("secondIndex") as? NSMutableArray
            }
            
            if (indexPath.row == 2) {
                cell.array = dict.valueForKey("thirdIndex") as? NSMutableArray
            }
         }
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
