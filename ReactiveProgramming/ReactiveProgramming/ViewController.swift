//
//  ViewController.swift
//  ReactiveProgramming
//
//  Created by Евгений on 29.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var networkManager = NetworkManagerImpl()
        networkManager.getUsers(completion: { users in
            print(users)
        })
        // Do any additional setup after loading the view.
    }


}

