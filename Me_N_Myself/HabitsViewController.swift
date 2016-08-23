//
//  HabitsTableViewController.swift
//  Me_N_Myself
//
//  Created by KrishnaChaitanya Amjuri on 22/08/16.
//  Copyright © 2016 Krishna Chaitanya. All rights reserved.
//

import UIKit

var SHOULDLOCK:Bool = true
private let reuseIdentifier = "reuseIdentifier"
private let LOCK = 23

class HabitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
                
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        self.view.addSubview(self.tableView)
        
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(30, 0, 0, 0))
        }
        
        self.tableView.registerClass(HabitsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    //MARK: - TableView delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: HabitsTableViewCell = (tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as? HabitsTableViewCell)!
        return cell
    }
    
    //MARK: - TableView datasource
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
