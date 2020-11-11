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
    private let segueName = "toDetailSegue"
    private let analyticsManager: AnalyticsManager = AnalyticsManagerImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        viewModel.users.bind(to: tableView.rx.items) { tableView, index, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as! CustomTableViewCell
            cell.configure(with: user)
            return cell
        }.disposed(by: bag)
        
        tableView.rx
            .itemSelected
            .map { index in
                return (index, self.viewModel.users.value[index.row])
            }
            .subscribe(onNext: { [weak self] index, model in
                guard let strongSelf = self else { return }
                strongSelf.performSegue(withIdentifier: strongSelf.segueName, sender: model)
            })
            .disposed(by: bag)
        
        viewModel.initUsers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        analyticsManager.reportEvent(with: "OpenedScreenWithTable", parameters: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            guard let destination = segue.destination as? DetailViewController else { return }
            guard let user = sender as? UserDTO else { return }
            destination.configure(with: user)
        }
    }
}
