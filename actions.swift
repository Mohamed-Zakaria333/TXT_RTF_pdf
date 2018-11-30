//
//  actions.swift
//  uitableView button
//
//  Created by MZ333 on 11/30/18.
//  Copyright © 2018 MZ333. All rights reserved.
//

import UIKit
protocol handel {
    func login(isCliced: Bool,btnlogin: UIButton,notCliced: Int)
    func register()
}

class actions: UITableViewCell {
    var isClickedd: Bool!
    var arrayTYpe: cell_data!
    var index: IndexPath?
    @IBOutlet weak var login_btn: UIButton!
    
   
    
    //@IBOutlet weak var register: UIButton!
    func setCell(variableType: cell_data)
    {
        
          arrayTYpe = variableType
        
    }
    
    var mydelegate: handel?
    
    @IBAction func loginActios(_ sender: UIButton) {
       /* if(arrayTYpe.isCliced == false)
        {
            sender.backgroundColor = UIColor.green
            arrayTYpe.isCliced = true
        }
        else
        {
            
            sender.backgroundColor = UIColor.black
            arrayTYpe.isCliced = false
            
            
        }*/
       
        mydelegate?.login(isCliced: arrayTYpe.isCliced!, btnlogin: sender,notCliced: (index?.row)!)
        
        
        
    }
    @IBAction func register(_ sender: UIButton) {
        mydelegate?.register();
        
    }
    

}
