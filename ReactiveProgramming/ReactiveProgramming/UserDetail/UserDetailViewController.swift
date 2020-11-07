//
//  UserDetailViewController.swift
//  ReactiveProgramming
//
//  Created by Enoxus on 07.11.2020.
//

import RxSwift

class UserDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var friendRequestButton: UIButton!
    
    private let viewModel = UserDetailViewModel()
    private let disposeBag = DisposeBag()
    private let analyticsManager: AnalyticsManagerProtocol = AnalyticsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analyticsManager.logEvent("UserDetailScreenDidAppear", params: nil)
    }
    
    private func setupBindings() {
        viewModel.name.bind(to: nameLabel.rx.text).disposed(by: disposeBag)
        viewModel.username.bind(to: usernameLabel.rx.text).disposed(by: disposeBag)
        viewModel.city.bind(to: cityLabel.rx.text).disposed(by: disposeBag)
        viewModel.email.bind(to: emailLabel.rx.text).disposed(by: disposeBag)
        viewModel.company.bind(to: companyLabel.rx.text).disposed(by: disposeBag)
        
        friendRequestButton.rx
            .tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                self?.analyticsManager.logEvent("FriendRequestWasSent", params: nil)
            })
            .disposed(by: disposeBag)
    }
    
    func configure(with data: UserViewData) {
        viewModel.accept(data)
    }
}
