//
//  ViewController.swift
//  ReactiveProgramming
//
//  Created by Сергей Шабельник on 29.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    private var viewModel: UserListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = UserListViewModel()
        setup()
    }
    
    func setup() {
        tableView.tableFooterView = UIView()
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.fetchUsers().observeOn(MainScheduler.instance).bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: MainTableViewCell.self)) { _, user, cell in
            cell.setupCell(user: user)
        }.disposed(by: disposeBag)
    }
}

