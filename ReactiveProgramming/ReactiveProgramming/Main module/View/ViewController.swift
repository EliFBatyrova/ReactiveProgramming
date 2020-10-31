//
//  ViewController.swift
//  ReactiveProgramming
//
//  Created by Amir on 25.10.2020.
//

import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    //MARK: - View model
    private let viewModel = UsersListViewModel()
    
    //MARK: - Dispose bag
    private let disposeBag = DisposeBag()
    
    //MARK: - Main controller view
    private let mainView = UsersView()
    
    //MARK: - VC lifecycle
    override func loadView() {
        
        title = "Users"
        view = mainView
        
        initBindings()
        viewModel.getUsers()
    }
    
    //MARK: - Initializing bindings
    private func initBindings() {
        
        viewModel
            .usersList
            .bind(
                to: mainView
                    .tableView
                    .rx
                    .items(
                        cellIdentifier: UserCell.identifier,
                        cellType: UserCell.self
                    )
            ) { _, user, cell in
                cell.configure(with: user)
            }.disposed(by: disposeBag)
        
        mainView
            .tableView
            .rx
            .itemSelected
            .subscribe(onNext: { [weak self] index in
                self?.mainView.tableView.deselectRow(at: index, animated: true)
            }).disposed(by: disposeBag)
    }
}
