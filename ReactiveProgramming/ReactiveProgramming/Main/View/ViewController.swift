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
    private let analyticsManager: AnalyticsManagerProtocol = AnalyticsManager()

    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBindings()
        viewModel.loadUsers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analyticsManager.logEvent("UserListScreenDidAppear", params: nil)
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
        
        mainTableView.rx
            .itemSelected
            .asDriver()
            .drive(onNext: { [weak self] in
                self?.performSegue(withIdentifier: "showDetail", sender: self?.viewModel.users.value[$0.row])
            })
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "showDetail", let user = sender as? UserViewData {
            let destination = segue.destination as! UserDetailViewController
            destination.configure(with: user)
        }
    }
}

