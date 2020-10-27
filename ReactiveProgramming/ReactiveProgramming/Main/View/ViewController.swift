//
//  ViewController.swift
//  ReactiveProgramming
//
//  Created by Enoxus on 27.10.2020.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class ViewController: UIViewController {
    
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()

    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()
        viewModel.loadUsers()
    }

    private func setupTableView() {
        mainTableView.tableFooterView = .init()
        mainTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "userTableViewCell")
    }
    
    private func setupBindings() {
        viewModel.users.bind(
            to: mainTableView.rx.items(
                cellIdentifier: "userTableViewCell",
                cellType: UserTableViewCell.self
            )
        ) { _, data, cell in
            cell.configure(with: data)
        }.disposed(by: disposeBag)
    }
}

