//
//  ViewController.swift
//  uitableView button
//
//  Created by MZ333 on 11/30/18.
//  Copyright © 2018 MZ333. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var items = [cell_data]()
    
    
    
    //@IBOutlet weak var login_btn: UIButton!
    
    //@IBOutlet weak var register: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))
        items.append(cell_data(clicked: false))

        
        
        
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "c1", for: indexPath) as! actions
        cell.mydelegate = self;
        cell.index = indexPath
        cell.setCell(variableType: items[indexPath.row])
        return cell
        
    }
}
extension ViewController: handel
{
    func login(isCliced: Bool, btnlogin: UIButton, notCliced: Int) {
       if (isCliced == false ) {
            btnlogin.backgroundColor = UIColor.green
           items[notCliced].isCliced = true
            
        }
        else {
            btnlogin.backgroundColor = UIColor.black
            items[notCliced].isCliced = false
            
        }
        print(notCliced)
        print (items[notCliced].isCliced!)
        
        
        
        
        
    }    
    func register() {
        print("hi iam register button")
    }
    
    
    
    
    
    
}
