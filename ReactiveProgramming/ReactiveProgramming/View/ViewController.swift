//
//  MainTableViewController.swift
//  ReactiveProgramming
//
//  Created by Евгений on 29.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let bag = DisposeBag()
    private let viewModel = UserViewModel()
    private let cellIdentifier = "customCell"
    private let cellNibName = "CustomTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        viewModel.users.bind(to: tableView.rx.items) { tableView, index, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as! CustomTableViewCell
            cell.configure(with: user)
            return cell
        }.disposed(by: bag)
        viewModel.initUsers()
    }
}
